@interface MLNonMaximumSuppression
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLNonMaximumSuppression)initWithParameters:(id)a3 modelDescription:(id)a4 configuration:(id)a5 error:(id *)a6;
- (MLNonMaximumSuppressionParameters)parameters;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)predictionTypeForKTrace;
@end

@implementation MLNonMaximumSuppression

- (void).cxx_destruct
{
}

- (MLNonMaximumSuppressionParameters)parameters
{
  return (MLNonMaximumSuppressionParameters *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)predictionTypeForKTrace
{
  return 1;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  id v225 = a3;
  id v217 = a4;
  [(MLNonMaximumSuppressionParameters *)self->_parameters iouThreshold];
  double v8 = v7;
  [(MLNonMaximumSuppressionParameters *)self->_parameters confidenceThreshold];
  double v10 = v9;
  v11 = [(MLNonMaximumSuppressionParameters *)self->_parameters iouThresholdInputFeatureName];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(MLNonMaximumSuppressionParameters *)self->_parameters iouThresholdInputFeatureName];
    v14 = [v225 featureValueForName:v13];

    if (v14)
    {
      [v14 doubleValue];
      double v8 = v15;
    }
  }
  v16 = [(MLNonMaximumSuppressionParameters *)self->_parameters confidenceThresholdInputFeatureName];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = [(MLNonMaximumSuppressionParameters *)self->_parameters confidenceThresholdInputFeatureName];
    v19 = [v225 featureValueForName:v18];

    if (v19)
    {
      [v19 doubleValue];
      double v10 = v20;
    }
  }
  v21 = [(MLNonMaximumSuppressionParameters *)self->_parameters confidenceInputFeatureName];
  v221 = [v225 featureValueForName:v21];

  v22 = [(MLNonMaximumSuppressionParameters *)self->_parameters coordinatesInputFeatureName];
  v220 = [v225 featureValueForName:v22];

  v224 = [v221 multiArrayValue];
  v223 = [v220 multiArrayValue];
  if ([v224 dataType] == 65600 && objc_msgSend(v223, "dataType") == 65600)
  {
    parameters = self->_parameters;
    unint64_t v24 = [(MLModelEngine *)self signpostID];
    uint64_t v25 = [v217 parentSignpostID];
    v26 = v224;
    v212 = v223;
    v27 = parameters;
    v218 = v27;
    if ([(MLNonMaximumSuppressionParameters *)v27 numClasses])
    {
      v28 = [(MLMultiArray *)v26 shape];
      v29 = [v28 objectAtIndexedSubscript:1];
      uint64_t v30 = [v29 unsignedLongValue];
      uint64_t v31 = [(MLNonMaximumSuppressionParameters *)v27 numClasses];

      if (v30 != v31)
      {
        v216 = v26;
        if (a5)
        {
          v78 = [(MLMultiArray *)v26 shape];
          v79 = [v78 objectAtIndexedSubscript:1];
          *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Dimension 1 of input confidence (%@) is not consistent with the number of classes (%lu)", v79, [(MLNonMaximumSuppressionParameters *)v27 numClasses]];
        }
        v59 = 0;
LABEL_147:

        goto LABEL_198;
      }
    }
    if ([(MLMultiArray *)v26 isContiguousInOrder:1])
    {
      kdebug_trace();
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v257 = 3221225472;
      v258 = ___ZL10performNMSIddEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke;
      v259 = &__block_descriptor_40_e5_v8__0l;
      unint64_t v260 = v24;
      v32 = (void (**)(void))_Block_copy(&aBlock);
      v33 = v26;
      v34 = [MLMultiArray alloc];
      v35 = [(MLMultiArray *)v26 shape];
      v26 = [(MLMultiArray *)v34 initWithShape:v35 dataType:[(MLMultiArray *)v26 dataType] storageOrder:0 error:a5];

      [(MLMultiArray *)v33 vectorizeIntoMultiArray:v26 storageOrder:0 error:a5];
      v32[2](v32);
    }
    if ([v212 isContiguousInOrder:1])
    {
      kdebug_trace();
      uint64_t v251 = MEMORY[0x1E4F143A8];
      uint64_t v252 = 3221225472;
      v253 = ___ZL10performNMSIddEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke_2;
      v254 = &__block_descriptor_40_e5_v8__0l;
      unint64_t v255 = v24;
      v36 = (void (**)(void))_Block_copy(&v251);
      v37 = [MLMultiArray alloc];
      v38 = [v212 shape];
      v39 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v37, "initWithShape:dataType:storageOrder:error:", v38, [v212 dataType], 0, a5);

      [v212 vectorizeIntoMultiArray:v39 storageOrder:0 error:a5];
      v36[2](v36);
    }
    else
    {
      v39 = (MLMultiArray *)v212;
    }
    v216 = v26;
    __Aa = [(MLMultiArray *)v216 bytes];
    v212 = v39;
    v60 = (char *)[v212 bytes];
    v61 = [(MLMultiArray *)v216 shape];
    v62 = [v61 objectAtIndexedSubscript:0];
    unint64_t v63 = [v62 unsignedLongValue];

    v64 = [(MLMultiArray *)v216 shape];
    v65 = [v64 objectAtIndexedSubscript:1];
    vDSP_Length v66 = [v65 unsignedLongValue];

    BOOL v67 = [(MLNonMaximumSuppressionParameters *)v27 perClass];
    std::vector<double>::vector(&__C, v63);
    if (v67) {
      unint64_t v68 = v63;
    }
    else {
      unint64_t v68 = 0;
    }
    std::vector<unsigned long>::vector(&v247, v68);
    v244 = 0;
    v245 = 0;
    uint64_t v246 = 0;
    v241 = 0;
    v242 = 0;
    uint64_t v243 = 0;
    __src = 0;
    uint64_t v239 = 0;
    uint64_t v240 = 0;
    v235 = 0;
    v236 = 0;
    uint64_t v237 = 0;
    kdebug_trace();
    uint64_t v229 = MEMORY[0x1E4F143A8];
    uint64_t v230 = 3221225472;
    v231 = ___ZL10performNMSIddEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke_3;
    v232 = &__block_descriptor_48_e5_v8__0l;
    unint64_t v233 = v24;
    uint64_t v234 = v25;
    v202 = (void (**)(void))_Block_copy(&v229);
    uint64_t v69 = 8 * v66;
    if (v63)
    {
      uint64_t v70 = 0;
      v71 = __Aa;
      unint64_t v72 = v63;
      do
      {
        v73 = &__C[v70];
        if (v67) {
          vDSP_maxviD(v71, 1, v73, (vDSP_Length *)((char *)v247 + v70 * 8), v66);
        }
        else {
          vDSP_maxvD(v71, 1, v73, v66);
        }
        ++v70;
        v71 = (const double *)((char *)v71 + v69);
        --v72;
      }
      while (v72);
      if (v10 <= 0.0)
      {
LABEL_65:
        v74 = 0;
        __p = 0;
LABEL_100:
        v267 = 0;
        std::vector<double>::resize((char **)&__src, v63 * v66, &v267);
        v267 = 0;
        std::vector<double>::resize((char **)&v235, 4 * v63, &v267);
        std::vector<unsigned long>::vector(&v267, v63);
        v112 = v267;
        if (v63)
        {
          for (vDSP_Length i = 0; i != v63; ++i)
            v112[i] = i;
        }
        vDSP_vsortiD(__C, v112, 0, v63, -1);
        LOBYTE(v263) = 0;
        std::vector<BOOL>::vector(&v265, v63, (unsigned __int8 *)&v263);
        if (v63)
        {
          unint64_t v114 = 0;
          unint64_t v115 = 0;
          v204 = (char *)__src;
          v116 = (char *)v235;
          __asm { FMOV            V0.2D, #0.5 }
          float64x2_t v227 = _Q0;
          while (1)
          {
            if ((*(void *)&v265[(v114 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v114))
            {
              unint64_t v122 = v114 + 1;
            }
            else
            {
              if (([(MLNonMaximumSuppressionParameters *)v218 maxBoxes] & 0x8000000000000000) == 0
                && v115 >= [(MLNonMaximumSuppressionParameters *)v218 maxBoxes])
              {
                goto LABEL_127;
              }
              vDSP_Length v123 = v267[v114];
              vDSP_Length v124 = v66 + v123 * v66;
              if (v124 != v123 * v66)
              {
                memmove(&v204[8 * v115 * v66], &__Aa[v123 * v66], 8 * v124 - 8 * v123 * v66);
                vDSP_Length v123 = v267[v114];
              }
              memmove(&v116[32 * v115], &v60[32 * v123], 0x20uLL);
              if (v67) {
                uint64_t v125 = *((void *)v247 + v267[v114]);
              }
              else {
                uint64_t v125 = 0;
              }
              ++v115;
              unint64_t v122 = v114 + 1;
              if (v114 + 1 < v63)
              {
                v126 = v267;
                v127 = v247;
                unint64_t v128 = v114 + 1;
                v129 = v265;
                do
                {
                  vDSP_Length v130 = v126[v128];
                  if (v67) {
                    uint64_t v131 = v127[v130];
                  }
                  else {
                    uint64_t v131 = 0;
                  }
                  uint64_t v132 = *(void *)&v129[8 * (v128 >> 6)];
                  if ((v132 & (1 << v128)) == 0 && v125 == v131)
                  {
                    v133 = (float64x2_t *)&v60[32 * v126[v114]];
                    v134 = (float64x2_t *)&v60[32 * v130];
                    float64x2_t v135 = vmaxnmq_f64(v133[1], (float64x2_t)0);
                    float64x2_t v136 = vsubq_f64(*v133, vmulq_f64(v135, v227));
                    float64x2_t v137 = vmaxnmq_f64(v134[1], (float64x2_t)0);
                    float64x2_t v138 = vsubq_f64(*v134, vmulq_f64(v137, v227));
                    float64x2_t v139 = vmaxnmq_f64(vsubq_f64(vminnmq_f64(vaddq_f64(v135, v136), vaddq_f64(v137, v138)), vmaxnmq_f64(v136, v138)), (float64x2_t)0);
                    v139.f64[0] = vmulq_laneq_f64(v139, v139, 1).f64[0];
                    if (v139.f64[0]
                       / (vmlad_n_f64(vmulq_laneq_f64(v137, v137, 1).f64[0], v135.f64[1], v135.f64[0])
                        - v139.f64[0]
                        + 0.00001) > v8)
                      *(void *)&v129[8 * (v128 >> 6)] = v132 | (1 << v128);
                  }
                  ++v128;
                }
                while (v63 != v128);
              }
            }
            unint64_t v114 = v122;
            if (v122 == v63) {
              goto LABEL_127;
            }
          }
        }
        unint64_t v115 = 0;
LABEL_127:
        if (v265) {
          operator delete(v265);
        }
        if (v267)
        {
          v268 = v267;
          operator delete(v267);
        }
        v202[2](v202);

        uint64_t v140 = v115;
        if (v115 <= [(MLNonMaximumSuppressionParameters *)v218 minBoxes]) {
          uint64_t v140 = [(MLNonMaximumSuppressionParameters *)v218 minBoxes];
        }
        v141 = [MLMultiArray alloc];
        v142 = [NSNumber numberWithUnsignedLong:v140];
        v267 = v142;
        v143 = [NSNumber numberWithUnsignedLong:v66];
        v268 = v143;
        v144 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v267 count:2];
        __Ab = [(MLMultiArray *)v141 initWithShape:v144 dataType:[(MLMultiArray *)v216 dataType] error:a5];

        v145 = [MLMultiArray alloc];
        v146 = [NSNumber numberWithUnsignedLong:v140];
        v265 = v146;
        v266 = &unk_1EF11A628;
        v147 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v265 count:2];
        v205 = -[MLMultiArray initWithShape:dataType:error:](v145, "initWithShape:dataType:error:", v147, [v212 dataType], a5);

        v228 = __Ab;
        v148 = (char *)[v228 mutableBytes];
        v149 = v205;
        v150 = [(MLMultiArray *)v149 mutableBytes];
        kdebug_trace();
        v151 = __src;
        memcpy(v148, __src, v115 * v69);
        v152 = v235;
        memcpy(v150, v235, 32 * v115);
        unint64_t v153 = v140 - v115;
        if (v153)
        {
          bzero(&v148[8 * v115 * v66], v153 * v69);
          bzero(&v150[32 * v115], 32 * v153);
        }
        kdebug_trace();
        v154 = [MLDictionaryFeatureProvider alloc];
        v155 = [(MLNonMaximumSuppressionParameters *)v218 confidenceOutputFeatureName];
        v261 = v155;
        v263 = (float *)v228;
        v156 = [(MLNonMaximumSuppressionParameters *)v218 coordinatesOutputFeatureName];
        v262 = v156;
        v264 = v149;
        v157 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v263 forKeys:&v261 count:2];
        v59 = [(MLDictionaryFeatureProvider *)v154 initWithDictionary:v157 error:a5];

        if (v152)
        {
          v236 = v152;
          operator delete(v152);
        }
        if (v151) {
          operator delete(v151);
        }
        if (__p)
        {
          v242 = __p;
          operator delete(__p);
          v74 = v244;
        }
        v27 = v218;
        if (v74)
        {
          v245 = v74;
          operator delete(v74);
        }
        if (v247)
        {
          v248 = v247;
          operator delete(v247);
        }
        if (__C)
        {
          v250 = __C;
          operator delete(__C);
        }
        goto LABEL_147;
      }
      v74 = 0;
      v75 = __C;
      unint64_t v76 = v63;
      do
      {
        double v77 = *v75++;
        if (v77 >= v10) {
          ++v74;
        }
        --v76;
      }
      while (v76);
    }
    else
    {
      v74 = 0;
      if (v10 <= 0.0)
      {
        __p = 0;
        unint64_t v63 = 0;
        goto LABEL_100;
      }
    }
    if (v74 != (char *)v63)
    {
      std::vector<double>::resize(&v244, v66 * v63);
      std::vector<double>::resize(&v241, 4 * v63);
      v74 = v244;
      v101 = v241;
      if (v63)
      {
        uint64_t v102 = 0;
        unint64_t v103 = 0;
        v104 = __C;
        do
        {
          if (v104[v102] >= v10)
          {
            if ((v102 + 1) * v66 != v102 * v66)
            {
              memmove(&v74[8 * v103 * v66], &__Aa[v102 * v66], 8 * v66);
              v104 = __C;
            }
            v105 = &v60[32 * v102];
            v106 = &v101[32 * v103];
            long long v107 = *((_OWORD *)v105 + 1);
            *(_OWORD *)v106 = *(_OWORD *)v105;
            *((_OWORD *)v106 + 1) = v107;
            v104[v103] = v104[v102];
            if (v67) {
              *((void *)v247 + v103) = *((void *)v247 + v102);
            }
            ++v103;
            ++v102;
          }
          else
          {
            ++v102;
          }
        }
        while (v102 != v63);
        v74 = v244;
        v60 = v241;
        __p = v241;
        unint64_t v63 = v103;
      }
      else
      {
        __p = v241;
        v60 = v241;
      }
      __Aa = (double *)v74;
      goto LABEL_100;
    }
    goto LABEL_65;
  }
  if ([v224 dataType] == 65568 && objc_msgSend(v223, "dataType") == 65568)
  {
    v40 = self->_parameters;
    unint64_t v41 = [(MLModelEngine *)self signpostID];
    uint64_t v42 = [v217 parentSignpostID];
    v43 = v224;
    v215 = v223;
    v44 = v40;
    v226 = v44;
    if ([(MLNonMaximumSuppressionParameters *)v44 numClasses])
    {
      v45 = [(MLMultiArray *)v43 shape];
      v46 = [v45 objectAtIndexedSubscript:1];
      uint64_t v47 = [v46 unsignedLongValue];
      uint64_t v48 = [(MLNonMaximumSuppressionParameters *)v44 numClasses];

      if (v47 != v48)
      {
        v219 = v43;
        if (a5)
        {
          v98 = [(MLMultiArray *)v43 shape];
          v99 = [v98 objectAtIndexedSubscript:1];
          *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Dimension 1 of input confidence (%@) is not consistent with the number of classes (%lu)", v99, [(MLNonMaximumSuppressionParameters *)v44 numClasses]];
        }
        v59 = 0;
LABEL_197:

        goto LABEL_198;
      }
    }
    __A = (double *)v41;
    if ([(MLMultiArray *)v43 isContiguousInOrder:1])
    {
      kdebug_trace();
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v257 = 3221225472;
      v258 = ___ZL10performNMSIffEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke;
      v259 = &__block_descriptor_40_e5_v8__0l;
      unint64_t v260 = v41;
      v49 = (void (**)(void))_Block_copy(&aBlock);
      v50 = v43;
      v51 = [MLMultiArray alloc];
      v52 = [(MLMultiArray *)v43 shape];
      v43 = [(MLMultiArray *)v51 initWithShape:v52 dataType:[(MLMultiArray *)v43 dataType] storageOrder:0 error:a5];

      [(MLMultiArray *)v50 vectorizeIntoMultiArray:v43 storageOrder:0 error:a5];
      v49[2](v49);
    }
    if ([(MLMultiArray *)v215 isContiguousInOrder:1])
    {
      kdebug_trace();
      uint64_t v251 = MEMORY[0x1E4F143A8];
      uint64_t v252 = 3221225472;
      v253 = ___ZL10performNMSIffEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke_2;
      v254 = &__block_descriptor_40_e5_v8__0l;
      unint64_t v255 = v41;
      v53 = (void (**)(void))_Block_copy(&v251);
      v54 = [MLMultiArray alloc];
      v55 = [(MLMultiArray *)v215 shape];
      v56 = [(MLMultiArray *)v54 initWithShape:v55 dataType:[(MLMultiArray *)v215 dataType] storageOrder:0 error:a5];

      [(MLMultiArray *)v215 vectorizeIntoMultiArray:v56 storageOrder:0 error:a5];
      v53[2](v53);
    }
    else
    {
      v56 = v215;
    }
    v219 = v43;
    v213 = [(MLMultiArray *)v219 bytes];
    v215 = v56;
    v80 = [(MLMultiArray *)v215 bytes];
    v81 = [(MLMultiArray *)v219 shape];
    v82 = [v81 objectAtIndexedSubscript:0];
    unint64_t v83 = [v82 unsignedLongValue];

    v84 = [(MLMultiArray *)v219 shape];
    v85 = [v84 objectAtIndexedSubscript:1];
    vDSP_Length v86 = [v85 unsignedLongValue];

    BOOL v87 = [(MLNonMaximumSuppressionParameters *)v44 perClass];
    std::vector<float>::vector(&__C, v83);
    if (v87) {
      unint64_t v88 = v83;
    }
    else {
      unint64_t v88 = 0;
    }
    std::vector<unsigned long>::vector(&v247, v88);
    v244 = 0;
    v245 = 0;
    uint64_t v246 = 0;
    v241 = 0;
    v242 = 0;
    uint64_t v243 = 0;
    __src = 0;
    uint64_t v239 = 0;
    uint64_t v240 = 0;
    v235 = 0;
    v236 = 0;
    uint64_t v237 = 0;
    kdebug_trace();
    uint64_t v229 = MEMORY[0x1E4F143A8];
    uint64_t v230 = 3221225472;
    v231 = ___ZL10performNMSIffEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke_3;
    v232 = &__block_descriptor_48_e5_v8__0l;
    unint64_t v233 = (unint64_t)__A;
    uint64_t v234 = v42;
    v207 = (void (**)(void))_Block_copy(&v229);
    if (v83)
    {
      uint64_t v89 = 0;
      uint64_t v90 = 0;
      v91 = v213;
      unint64_t v92 = v83;
      do
      {
        v93 = (float *)((char *)__C + v89);
        if (v87) {
          vDSP_maxvi(v91, 1, v93, (vDSP_Length *)((char *)v247 + v90), v86);
        }
        else {
          vDSP_maxv(v91, 1, v93, v86);
        }
        v90 += 8;
        v89 += 4;
        v91 += v86;
        --v92;
      }
      while (v92);
      if (v10 <= 0.0)
      {
LABEL_71:
        v94 = 0;
        v100 = 0;
LABEL_150:
        LODWORD(v267) = 0;
        std::vector<float>::resize((char **)&__src, v83 * v86, &v267);
        LODWORD(v267) = 0;
        std::vector<float>::resize((char **)&v235, 4 * v83, &v267);
        std::vector<unsigned long>::vector(&v267, v83);
        v158 = v267;
        if (v83)
        {
          for (vDSP_Length j = 0; j != v83; ++j)
            v158[j] = j;
        }
        vDSP_vsorti((const float *)__C, v158, 0, v83, -1);
        LOBYTE(v263) = 0;
        std::vector<BOOL>::vector(&v265, v83, (unsigned __int8 *)&v263);
        v206 = v100;
        if (v83)
        {
          unint64_t v160 = 0;
          unint64_t v161 = 0;
          v162 = (char *)__src;
          v163 = (char *)v235;
          while (1)
          {
            if ((*(void *)&v265[(v160 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v160))
            {
              unint64_t v164 = v160 + 1;
            }
            else
            {
              if (([(MLNonMaximumSuppressionParameters *)v226 maxBoxes] & 0x8000000000000000) == 0
                && v161 >= [(MLNonMaximumSuppressionParameters *)v226 maxBoxes])
              {
                goto LABEL_177;
              }
              vDSP_Length v165 = v267[v160];
              vDSP_Length v166 = v86 + v165 * v86;
              if (v166 != v165 * v86)
              {
                memmove(&v162[4 * v161 * v86], &v213[v165 * v86], 4 * v166 - 4 * v165 * v86);
                vDSP_Length v165 = v267[v160];
              }
              memmove(&v163[16 * v161], &v80[16 * v165], 0x10uLL);
              if (v87) {
                uint64_t v167 = *((void *)v247 + v267[v160]);
              }
              else {
                uint64_t v167 = 0;
              }
              ++v161;
              unint64_t v164 = v160 + 1;
              if (v160 + 1 < v83)
              {
                v168 = v267;
                v169 = v247;
                unint64_t v170 = v160 + 1;
                v171 = v265;
                do
                {
                  vDSP_Length v172 = v168[v170];
                  if (v87) {
                    uint64_t v173 = v169[v172];
                  }
                  else {
                    uint64_t v173 = 0;
                  }
                  uint64_t v174 = *(void *)&v171[8 * (v170 >> 6)];
                  if ((v174 & (1 << v170)) == 0 && v167 == v173)
                  {
                    v175 = (float32x2_t *)&v80[16 * v168[v160]];
                    v176 = (float32x2_t *)&v80[16 * v172];
                    float32x2_t v177 = vmaxnm_f32(v175[1], 0);
                    float32x2_t v178 = vsub_f32(*v175, vmul_f32(v177, (float32x2_t)0x3F0000003F000000));
                    float32x2_t v179 = vmaxnm_f32(v176[1], 0);
                    float32x2_t v180 = vsub_f32(*v176, vmul_f32(v179, (float32x2_t)0x3F0000003F000000));
                    float32x2_t v181 = vmaxnm_f32(vsub_f32(vminnm_f32(vadd_f32(v177, v178), vadd_f32(v179, v180)), vmaxnm_f32(v178, v180)), 0);
                    v181.f32[0] = vmul_lane_f32(v181, v181, 1).f32[0];
                    if (v181.f32[0]
                       / ((float)(vmlas_n_f32(vmul_lane_f32(v179, v179, 1).f32[0], v177.f32[1], v177.f32[0])
                                - v181.f32[0])
                        + 0.00001) > v8)
                      *(void *)&v171[8 * (v170 >> 6)] = v174 | (1 << v170);
                  }
                  ++v170;
                }
                while (v83 != v170);
              }
            }
            unint64_t v160 = v164;
            if (v164 == v83) {
              goto LABEL_177;
            }
          }
        }
        unint64_t v161 = 0;
LABEL_177:
        if (v265) {
          operator delete(v265);
        }
        if (v267)
        {
          v268 = v267;
          operator delete(v267);
        }
        v207[2](v207);

        uint64_t v182 = v161;
        if (v161 <= [(MLNonMaximumSuppressionParameters *)v226 minBoxes]) {
          uint64_t v182 = [(MLNonMaximumSuppressionParameters *)v226 minBoxes];
        }
        v183 = [MLMultiArray alloc];
        v184 = [NSNumber numberWithUnsignedLong:v182];
        v267 = v184;
        v185 = [NSNumber numberWithUnsignedLong:v86];
        v268 = v185;
        v186 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v267 count:2];
        v208 = [(MLMultiArray *)v183 initWithShape:v186 dataType:[(MLMultiArray *)v219 dataType] error:a5];

        v187 = [MLMultiArray alloc];
        v188 = [NSNumber numberWithUnsignedLong:v182];
        v265 = v188;
        v266 = &unk_1EF11A628;
        v189 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v265 count:2];
        v203 = [(MLMultiArray *)v187 initWithShape:v189 dataType:[(MLMultiArray *)v215 dataType] error:a5];

        v214 = v208;
        v190 = (char *)[v214 mutableBytes];
        v191 = v203;
        v192 = [(MLMultiArray *)v191 mutableBytes];
        kdebug_trace();
        v193 = __src;
        memcpy(v190, __src, 4 * v161 * v86);
        v194 = v235;
        memcpy(v192, v235, 16 * v161);
        unint64_t v195 = v182 - v161;
        if (v182 != v161)
        {
          bzero(&v190[4 * v161 * v86], 4 * v86 * v195);
          bzero(&v192[16 * v161], 16 * v195);
        }
        kdebug_trace();
        v196 = [MLDictionaryFeatureProvider alloc];
        v197 = [(MLNonMaximumSuppressionParameters *)v226 confidenceOutputFeatureName];
        v261 = v197;
        v263 = v214;
        v198 = [(MLNonMaximumSuppressionParameters *)v226 coordinatesOutputFeatureName];
        v262 = v198;
        v264 = v191;
        v199 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v263 forKeys:&v261 count:2];
        v59 = [(MLDictionaryFeatureProvider *)v196 initWithDictionary:v199 error:a5];

        if (v194)
        {
          v236 = v194;
          operator delete(v194);
        }
        v44 = v226;
        if (v193) {
          operator delete(v193);
        }
        if (v206) {
          operator delete(v206);
        }
        if (v94) {
          operator delete(v94);
        }
        if (v247)
        {
          v248 = v247;
          operator delete(v247);
        }
        if (__C)
        {
          v250 = __C;
          operator delete(__C);
        }
        goto LABEL_197;
      }
      v94 = 0;
      v95 = __C;
      unint64_t v96 = v83;
      do
      {
        float v97 = *(float *)v95;
        v95 = (double *)((char *)v95 + 4);
        if (v10 <= v97) {
          ++v94;
        }
        --v96;
      }
      while (v96);
    }
    else
    {
      v94 = 0;
      if (v10 <= 0.0)
      {
        v100 = 0;
        unint64_t v83 = 0;
        goto LABEL_150;
      }
    }
    if (v94 != (char *)v83)
    {
      std::vector<float>::resize(&v244, v86 * v83);
      std::vector<float>::resize(&v241, 4 * v83);
      v94 = v244;
      v100 = v241;
      if (v83)
      {
        v108 = v241;
        uint64_t v109 = 0;
        unint64_t v110 = 0;
        v111 = __C;
        do
        {
          if (v10 <= *((float *)v111 + v109))
          {
            if ((v109 + 1) * v86 != v109 * v86) {
              memmove(&v94[4 * v110 * v86], &v213[v109 * v86], 4 * v86);
            }
            *(_OWORD *)&v108[16 * v110] = *(_OWORD *)&v80[16 * v109];
            v111 = __C;
            *((_DWORD *)__C + v110) = *((_DWORD *)__C + v109);
            if (v87) {
              *((void *)v247 + v110) = *((void *)v247 + v109);
            }
            ++v110;
            ++v109;
          }
          else
          {
            ++v109;
          }
        }
        while (v109 != v83);
        v80 = v108;
        unint64_t v83 = v110;
        v100 = v108;
      }
      else
      {
        v80 = v241;
      }
      v213 = (float *)v94;
      goto LABEL_150;
    }
    goto LABEL_71;
  }
  if (a5)
  {
    v57 = +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", [v224 dataType]);
    v58 = +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", [v223 dataType]);
    *a5 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Data type error for NonMaximumSuppression: confidence and coordinates must be MLMultiArray of a same type and it must be either DOUBLE or FLOAT32. However, confidence uses %@ and coordinates uses %@", v57, v58];
  }
  v59 = 0;
LABEL_198:

  return v59;
}

- (MLNonMaximumSuppression)initWithParameters:(id)a3 modelDescription:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MLNonMaximumSuppression;
  v11 = [(MLModelEngine *)&v14 initWithDescription:a4 configuration:a5];
  uint64_t v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_parameters, a3);
  }

  return v12;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  double v8 = v7;
  if (*(_DWORD *)(*(void *)a3 + 44) != 610)
  {
    if (a5)
    {
      +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not a NonMaximumSuppression"];
      uint64_t v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = 0;
    }
    goto LABEL_137;
  }
  id v71 = v7;
  id v72 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  double v9 = objc_alloc_init(MLNonMaximumSuppressionParameters);
  id v10 = v9;
  if (*(_DWORD *)(*(void *)a3 + 44) == 610)
  {
    v11 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_NonMaximumSuppression_2eproto::InitDefaults((CoreML::Specification::protobuf_NonMaximumSuppression_2eproto *)v9);
    v11 = &CoreML::Specification::_NonMaximumSuppression_default_instance_;
  }
  v73 = &unk_1EF0D4E80;
  v74[0] = 0;
  int v80 = 0;
  uint64_t v13 = v11[1];
  if (v13) {
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(v74, v13 & 0xFFFFFFFFFFFFFFFELL);
  }
  v74[1] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
  uint64_t v14 = v11[2];
  if (*(char *)(v14 + 23) < 0) {
    uint64_t v15 = *(void *)(v14 + 8);
  }
  else {
    uint64_t v15 = *(unsigned __int8 *)(v14 + 23);
  }
  if ((long long *)v14 != &google::protobuf::internal::fixed_address_empty_string && v15) {
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
  }
  v74[2] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
  uint64_t v16 = v11[3];
  if (*(char *)(v16 + 23) < 0) {
    uint64_t v17 = *(void *)(v16 + 8);
  }
  else {
    uint64_t v17 = *(unsigned __int8 *)(v16 + 23);
  }
  if ((long long *)v16 != &google::protobuf::internal::fixed_address_empty_string && v17) {
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
  }
  v74[3] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
  uint64_t v18 = v11[4];
  if (*(char *)(v18 + 23) < 0) {
    uint64_t v19 = *(void *)(v18 + 8);
  }
  else {
    uint64_t v19 = *(unsigned __int8 *)(v18 + 23);
  }
  if ((long long *)v18 != &google::protobuf::internal::fixed_address_empty_string && v19) {
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
  }
  v74[4] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
  uint64_t v20 = v11[5];
  if (*(char *)(v20 + 23) < 0) {
    uint64_t v21 = *(void *)(v20 + 8);
  }
  else {
    uint64_t v21 = *(unsigned __int8 *)(v20 + 23);
  }
  if ((long long *)v20 != &google::protobuf::internal::fixed_address_empty_string && v21) {
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
  }
  v75 = &google::protobuf::internal::fixed_address_empty_string;
  uint64_t v22 = v11[6];
  if (*(char *)(v22 + 23) < 0) {
    uint64_t v23 = *(void *)(v22 + 8);
  }
  else {
    uint64_t v23 = *(unsigned __int8 *)(v22 + 23);
  }
  if ((long long *)v22 != &google::protobuf::internal::fixed_address_empty_string && v23) {
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
  }
  unint64_t v76 = &google::protobuf::internal::fixed_address_empty_string;
  uint64_t v24 = v11[7];
  if (*(char *)(v24 + 23) < 0) {
    uint64_t v25 = *(void *)(v24 + 8);
  }
  else {
    uint64_t v25 = *(unsigned __int8 *)(v24 + 23);
  }
  if ((long long *)v24 != &google::protobuf::internal::fixed_address_empty_string && v25) {
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
  }
  long long v77 = *((_OWORD *)v11 + 4);
  int v81 = 0;
  if (*((_DWORD *)v11 + 25) == 1)
  {
    int v81 = 1;
    operator new();
  }
  int v82 = 0;
  int v26 = *((_DWORD *)v11 + 26);
  if (v26 == 101)
  {
    int v82 = 101;
    operator new();
  }
  if (v26 == 100)
  {
    int v82 = 100;
    operator new();
  }
  [(MLNonMaximumSuppressionParameters *)v10 setIouThreshold:*(double *)&v77];
  [(MLNonMaximumSuppressionParameters *)v10 setConfidenceThreshold:*((double *)&v77 + 1)];
  v27 = objc_msgSend(NSString, "stringWithUTF8String:");
  [(MLNonMaximumSuppressionParameters *)v10 setConfidenceInputFeatureName:v27];

  v28 = objc_msgSend(NSString, "stringWithUTF8String:");
  [(MLNonMaximumSuppressionParameters *)v10 setCoordinatesInputFeatureName:v28];

  v29 = objc_msgSend(NSString, "stringWithUTF8String:");
  [(MLNonMaximumSuppressionParameters *)v10 setConfidenceOutputFeatureName:v29];

  uint64_t v30 = objc_msgSend(NSString, "stringWithUTF8String:");
  [(MLNonMaximumSuppressionParameters *)v10 setCoordinatesOutputFeatureName:v30];

  uint64_t v31 = objc_msgSend(NSString, "stringWithUTF8String:");
  [(MLNonMaximumSuppressionParameters *)v10 setIouThresholdInputFeatureName:v31];

  v32 = objc_msgSend(NSString, "stringWithUTF8String:");
  [(MLNonMaximumSuppressionParameters *)v10 setConfidenceThresholdInputFeatureName:v32];

  if (v81 == 1) {
    inited = (unint64_t *)[(MLNonMaximumSuppressionParameters *)v10 setPerClass:*(unsigned __int8 *)(v78 + 16)];
  }
  uint64_t v70 = a5;
  if (*(void *)(*(void *)a3 + 16)) {
    v34 = *(uint64_t **)(*(void *)a3 + 16);
  }
  else {
    v34 = &CoreML::Specification::_ModelDescription_default_instance_;
  }
  if (*((int *)v34 + 12) >= 1)
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = -1;
    while (1)
    {
      v39 = *(uint64_t **)(*(void *)(v34[7] + 8 * v35 + 8) + 32);
      if (!v39) {
        v39 = &CoreML::Specification::_FeatureType_default_instance_;
      }
      if (*((_DWORD *)v39 + 9) == 5)
      {
        v40 = (uint64_t *)v39[3];
      }
      else
      {
        inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
        v40 = &CoreML::Specification::_ArrayFeatureType_default_instance_;
      }
      if (*((_DWORD *)v40 + 4) == 2) {
        break;
      }
      if (*((_DWORD *)v40 + 15) == 31)
      {
        uint64_t v48 = (uint64_t *)v40[5];
      }
      else
      {
        inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
        uint64_t v48 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
      }
      if (*((_DWORD *)v48 + 6) != 2) {
        goto LABEL_91;
      }
      if (*((_DWORD *)v40 + 15) == 31)
      {
        v49 = (uint64_t *)v40[5];
        uint64_t v36 = *(void *)(*(void *)(v49[4] + 8) + 16);
      }
      else
      {
        inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
        uint64_t v36 = *(void *)(*(void *)(qword_1EB4E17B0 + 8) + 16);
        if (*((_DWORD *)v40 + 15) == 31)
        {
          v49 = (uint64_t *)v40[5];
        }
        else
        {
          inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
          v49 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
        }
      }
      uint64_t v38 = *(void *)(*(void *)(v49[4] + 8) + 24);
      v50 = *(unsigned __int8 **)(*(void *)(v34[7] + 8 * v35 + 8) + 16);
      uint64_t v51 = v50[23];
      if ((v51 & 0x80u) == 0) {
        uint64_t v52 = v50[23];
      }
      else {
        uint64_t v52 = *((void *)v50 + 1);
      }
      uint64_t v53 = *((unsigned __int8 *)v75 + 23);
      int v54 = (char)v53;
      if ((v53 & 0x80u) != 0) {
        uint64_t v53 = *((void *)v75 + 1);
      }
      if (v52 != v53) {
        goto LABEL_91;
      }
      if (v54 >= 0) {
        v55 = v75;
      }
      else {
        v55 = *(long long **)v75;
      }
      if ((v51 & 0x80) == 0)
      {
        if (v50[23])
        {
          while (*v50 == *(unsigned __int8 *)v55)
          {
            ++v50;
            v55 = (long long *)((char *)v55 + 1);
            if (!--v51) {
              goto LABEL_109;
            }
          }
          goto LABEL_91;
        }
LABEL_109:
        if (*((_DWORD *)v40 + 15) == 31)
        {
          v56 = (uint64_t *)v40[5];
          uint64_t v57 = *(void *)(*(void *)(v56[4] + 16) + 16);
        }
        else
        {
          inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
          uint64_t v57 = *(void *)(*(void *)(qword_1EB4E17B0 + 16) + 16);
          if (*((_DWORD *)v40 + 15) == 31)
          {
            v56 = (uint64_t *)v40[5];
          }
          else
          {
            inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
            v56 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
          }
        }
        if (v57 == *(void *)(*(void *)(v56[4] + 16) + 24))
        {
          if (*((_DWORD *)v40 + 15) == 31)
          {
            v58 = (uint64_t *)v40[5];
          }
          else
          {
            inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
            v58 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
          }
          uint64_t v37 = *(void *)(*(void *)(v58[4] + 16) + 16);
        }
        goto LABEL_91;
      }
      inited = (unint64_t *)memcmp(*(const void **)v50, v55, *((void *)v50 + 1));
      if (!inited) {
        goto LABEL_109;
      }
LABEL_91:
      if (++v35 >= *((int *)v34 + 12)) {
        goto LABEL_120;
      }
    }
    uint64_t v41 = v40[3];
    uint64_t v38 = *(void *)(v41 + 8);
    uint64_t v42 = *(unsigned __int8 **)(*(void *)(v34[7] + 8 * v35 + 8) + 16);
    uint64_t v43 = v42[23];
    if ((v43 & 0x80u) == 0) {
      uint64_t v44 = v42[23];
    }
    else {
      uint64_t v44 = *((void *)v42 + 1);
    }
    uint64_t v45 = *((unsigned __int8 *)v75 + 23);
    int v46 = (char)v45;
    if ((v45 & 0x80u) != 0) {
      uint64_t v45 = *((void *)v75 + 1);
    }
    if (v44 == v45)
    {
      if (v46 >= 0) {
        uint64_t v47 = v75;
      }
      else {
        uint64_t v47 = *(long long **)v75;
      }
      if ((v43 & 0x80) == 0)
      {
        if (v42[23])
        {
          while (*v42 == *(unsigned __int8 *)v47)
          {
            ++v42;
            uint64_t v47 = (long long *)((char *)v47 + 1);
            if (!--v43) {
              goto LABEL_88;
            }
          }
          goto LABEL_90;
        }
        goto LABEL_88;
      }
      inited = (unint64_t *)memcmp(*(const void **)v42, v47, *((void *)v42 + 1));
      if (!inited)
      {
LABEL_88:
        if (*(uint64_t *)(v41 + 16) >= 0) {
          uint64_t v37 = *(void *)(v41 + 16);
        }
      }
    }
LABEL_90:
    uint64_t v36 = v38;
    goto LABEL_91;
  }
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  uint64_t v38 = -1;
LABEL_120:
  if (v82 != 100)
  {
    double v8 = v71;
    v59 = v72;
    if (v82 != 101)
    {
      id v61 = 0;
      goto LABEL_134;
    }
    uint64_t v60 = v79;
    uint64_t v37 = *(int *)(v79 + 16);
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((int)v37 < 1)
    {
      double v8 = v71;
      goto LABEL_134;
    }
    uint64_t v62 = 0;
    do
    {
      unint64_t v63 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(v60 + 24) + v62 + 8)];
      [v61 addObject:v63];

      v62 += 8;
    }
    while (8 * v37 != v62);
    double v8 = v71;
    goto LABEL_131;
  }
  uint64_t v64 = v79;
  uint64_t v37 = *(int *)(v79 + 24);
  double v8 = v71;
  v59 = v72;
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((int)v37 >= 1)
  {
    uint64_t v65 = 0;
    do
    {
      vDSP_Length v66 = *(uint64_t **)(*(void *)(v64 + 32) + v65 + 8);
      if (*((char *)v66 + 23) < 0) {
        vDSP_Length v66 = (uint64_t *)*v66;
      }
      BOOL v67 = [NSString stringWithUTF8String:v66];
      [v61 addObject:v67];

      v65 += 8;
    }
    while (8 * v37 != v65);
LABEL_131:
    v59 = v72;
  }
LABEL_134:
  [(MLNonMaximumSuppressionParameters *)v10 setMinBoxes:v36];
  [(MLNonMaximumSuppressionParameters *)v10 setMaxBoxes:v38];
  [(MLNonMaximumSuppressionParameters *)v10 setNumClasses:v37];
  if (v61)
  {
    unint64_t v68 = (void *)[v61 copy];
    [(MLNonMaximumSuppressionParameters *)v10 setLabelNames:v68];

    [v59 setClassLabels:v61];
  }
  uint64_t v12 = [[MLNonMaximumSuppression alloc] initWithParameters:v10 modelDescription:v59 configuration:v8 error:v70];

  CoreML::Specification::NonMaximumSuppression::~NonMaximumSuppression((CoreML::Specification::NonMaximumSuppression *)&v73);
LABEL_137:

  return v12;
}

@end