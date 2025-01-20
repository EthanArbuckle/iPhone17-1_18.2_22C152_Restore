@interface _EARNnetUtil
+ (id)doBackPropWithNnetModelFile:(id)a3 inputFeatureVector:(id)a4 inputTargetVector:(id)a5 inputLearningRate:(float)a6 inputFreezeComponents:(id)a7 inputNumLocalIterations:(int)a8 inputGradNormFactor:(float)a9 inputGradNormType:(id)a10 inputBatchSize:(float)a11 inputObjectiveFunction:(id)a12 outTrainingLoss:(float *)a13 outModelLayersUpdated:(id *)a14;
+ (id)doBackPropWithNnetModelFile:(id)a3 inputFeatureVector:(id)a4 inputTargetVector:(id)a5 inputLearningRate:(float)a6 inputFreezeComponents:(id)a7 inputNumLocalIterations:(int)a8 inputGradNormFactor:(float)a9 inputGradNormType:(id)a10 inputBatchSize:(float)a11 inputObjectiveFunction:(id)a12 outTrainingLosses:(id *)a13 outModelLayersUpdated:(id *)a14;
+ (void)initialize;
@end

@implementation _EARNnetUtil

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

+ (id)doBackPropWithNnetModelFile:(id)a3 inputFeatureVector:(id)a4 inputTargetVector:(id)a5 inputLearningRate:(float)a6 inputFreezeComponents:(id)a7 inputNumLocalIterations:(int)a8 inputGradNormFactor:(float)a9 inputGradNormType:(id)a10 inputBatchSize:(float)a11 inputObjectiveFunction:(id)a12 outTrainingLoss:(float *)a13 outModelLayersUpdated:(id *)a14
{
  id v19 = 0;
  v14 = +[_EARNnetUtil doBackPropWithNnetModelFile:inputFeatureVector:inputTargetVector:inputLearningRate:inputFreezeComponents:inputNumLocalIterations:inputGradNormFactor:inputGradNormType:inputBatchSize:inputObjectiveFunction:outTrainingLosses:outModelLayersUpdated:](_EARNnetUtil, "doBackPropWithNnetModelFile:inputFeatureVector:inputTargetVector:inputLearningRate:inputFreezeComponents:inputNumLocalIterations:inputGradNormFactor:inputGradNormType:inputBatchSize:inputObjectiveFunction:outTrainingLosses:outModelLayersUpdated:", a3, a4, a5, a7, *(void *)&a8, a10, a12, &v19, a14);
  id v15 = v19;
  v16 = [v15 lastObject];
  [v16 floatValue];
  *(_DWORD *)a13 = v17;

  return v14;
}

+ (id)doBackPropWithNnetModelFile:(id)a3 inputFeatureVector:(id)a4 inputTargetVector:(id)a5 inputLearningRate:(float)a6 inputFreezeComponents:(id)a7 inputNumLocalIterations:(int)a8 inputGradNormFactor:(float)a9 inputGradNormType:(id)a10 inputBatchSize:(float)a11 inputObjectiveFunction:(id)a12 outTrainingLosses:(id *)a13 outModelLayersUpdated:(id *)a14
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v21 = a4;
  id v78 = a5;
  id v75 = a7;
  id v76 = a10;
  id v77 = a12;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  v102 = 0;
  uint64_t v103 = 0;
  uint64_t v104 = 0;
  v99 = 0;
  uint64_t v100 = 0;
  uint64_t v101 = 0;
  uint64_t v97 = 0;
  uint64_t v98 = 0;
  uint64_t v96 = 0;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  obuint64_t j = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v118 objects:v126 count:16];
  if (v22)
  {
    uint64_t v83 = *(void *)v119;
    do
    {
      uint64_t v23 = 0;
      uint64_t v85 = v22;
      do
      {
        if (*(void *)v119 != v83) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(id *)(*((void *)&v118 + 1) + 8 * v23);
        *(void *)&v117[0] = 0;
        __p[0] = 0;
        __p[1] = 0;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v122 objects:&v128 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v123;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v123 != v27) {
                objc_enumerationMutation(v25);
              }
              id v29 = *(id *)(*((void *)&v122 + 1) + 8 * i);
              [v29 floatValue];
              int v31 = v30;
              v32 = (char *)__p[1];
              if (__p[1] >= (void *)*(void *)&v117[0])
              {
                v34 = (char *)__p[0];
                int64_t v35 = ((char *)__p[1] - (char *)__p[0]) >> 2;
                unint64_t v36 = v35 + 1;
                if ((unint64_t)(v35 + 1) >> 62) {
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                }
                int64_t v37 = *(void *)&v117[0] - (unint64_t)__p[0];
                if ((uint64_t)(*(void *)&v117[0] - (unint64_t)__p[0]) >> 1 > v36) {
                  unint64_t v36 = v37 >> 1;
                }
                if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v38 = v36;
                }
                if (v38)
                {
                  v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v117, v38);
                  v32 = (char *)__p[1];
                  v34 = (char *)__p[0];
                }
                else
                {
                  v39 = 0;
                }
                v40 = &v39[4 * v35];
                *(_DWORD *)v40 = v31;
                v33 = v40 + 4;
                while (v32 != v34)
                {
                  int v41 = *((_DWORD *)v32 - 1);
                  v32 -= 4;
                  *((_DWORD *)v40 - 1) = v41;
                  v40 -= 4;
                }
                __p[0] = v40;
                __p[1] = v33;
                *(void *)&v117[0] = &v39[4 * v38];
                if (v34) {
                  operator delete(v34);
                }
              }
              else
              {
                *(_DWORD *)__p[1] = v30;
                v33 = v32 + 4;
              }
              __p[1] = v33;
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v122 objects:&v128 count:16];
          }
          while (v26);
        }

        std::vector<std::vector<float>>::push_back[abi:ne180100](&v96, (uint64_t)__p);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        ++v23;
      }
      while (v23 != v85);
      uint64_t v22 = [obj countByEnumeratingWithState:&v118 objects:v126 count:16];
    }
    while (v22);
  }

  id v42 = v78;
  v94 = 0;
  uint64_t v95 = 0;
  v93 = 0;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v79 = v42;
  uint64_t v43 = [v79 countByEnumeratingWithState:&v109 objects:&v122 count:16];
  if (v43)
  {
    uint64_t v72 = *(void *)v110;
    do
    {
      uint64_t v44 = 0;
      uint64_t v71 = v43;
      do
      {
        if (*(void *)v110 != v72) {
          objc_enumerationMutation(v79);
        }
        uint64_t v73 = v44;
        id v45 = *(id *)(*((void *)&v109 + 1) + 8 * v44);
        memset(v108, 0, sizeof(v108));
        *(_OWORD *)__p = 0u;
        memset(v117, 0, sizeof(v117));
        id v80 = v45;
        uint64_t v46 = [v80 countByEnumeratingWithState:__p objects:v126 count:16];
        if (v46)
        {
          uint64_t v82 = **(void **)&v117[0];
          do
          {
            uint64_t v47 = 0;
            uint64_t v84 = v46;
            do
            {
              if (**(void **)&v117[0] != v82) {
                objc_enumerationMutation(v80);
              }
              id v48 = *((id *)__p[1] + v47);
              v115 = 0;
              v113 = 0;
              v114 = 0;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              id v49 = v48;
              uint64_t v50 = [v49 countByEnumeratingWithState:&v118 objects:&v128 count:16];
              uint64_t v86 = v47;
              if (v50)
              {
                int v51 = 0;
                uint64_t v52 = *(void *)v119;
                do
                {
                  for (uint64_t j = 0; j != v50; ++j)
                  {
                    if (*(void *)v119 != v52) {
                      objc_enumerationMutation(v49);
                    }
                    id v54 = *(id *)(*((void *)&v118 + 1) + 8 * j);
                    [v54 floatValue];
                    int v56 = v55;
                    v57 = v114;
                    if (v114 >= v115)
                    {
                      v59 = (char *)v113;
                      uint64_t v60 = (v114 - (unsigned char *)v113) >> 3;
                      unint64_t v61 = v60 + 1;
                      if ((unint64_t)(v60 + 1) >> 61) {
                        std::vector<int>::__throw_length_error[abi:ne180100]();
                      }
                      uint64_t v62 = v115 - (unsigned char *)v113;
                      if ((v115 - (unsigned char *)v113) >> 2 > v61) {
                        unint64_t v61 = v62 >> 2;
                      }
                      if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
                        unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v63 = v61;
                      }
                      if (v63)
                      {
                        v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)&v115, v63);
                        v57 = v114;
                        v59 = (char *)v113;
                      }
                      else
                      {
                        v64 = 0;
                      }
                      v65 = &v64[8 * v60];
                      *(_DWORD *)v65 = v51;
                      *((_DWORD *)v65 + 1) = v56;
                      v66 = v65;
                      if (v57 != v59)
                      {
                        do
                        {
                          uint64_t v67 = *((void *)v57 - 1);
                          v57 -= 8;
                          *((void *)v66 - 1) = v67;
                          v66 -= 8;
                        }
                        while (v57 != v59);
                        v59 = (char *)v113;
                      }
                      v58 = v65 + 8;
                      v113 = v66;
                      v114 = v65 + 8;
                      v115 = &v64[8 * v63];
                      if (v59) {
                        operator delete(v59);
                      }
                    }
                    else
                    {
                      *(_DWORD *)v114 = v51;
                      *((_DWORD *)v57 + 1) = v55;
                      v58 = v57 + 8;
                    }
                    v114 = v58;

                    ++v51;
                  }
                  uint64_t v50 = [v49 countByEnumeratingWithState:&v118 objects:&v128 count:16];
                }
                while (v50);
              }

              std::vector<std::vector<std::pair<int,float>>>::push_back[abi:ne180100](v108, (uint64_t)&v113);
              if (v113)
              {
                v114 = (char *)v113;
                operator delete(v113);
              }

              uint64_t v47 = v86 + 1;
            }
            while (v86 + 1 != v84);
            uint64_t v46 = [v80 countByEnumeratingWithState:__p objects:v126 count:16];
          }
          while (v46);
        }

        std::vector<std::vector<std::vector<std::pair<int,float>>>>::push_back[abi:ne180100]((uint64_t *)&v93, (uint64_t)v108);
        v128 = (void **)v108;
        std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v128);

        uint64_t v44 = v73 + 1;
      }
      while (v73 + 1 != v71);
      uint64_t v43 = [v79 countByEnumeratingWithState:&v109 objects:&v122 count:16];
    }
    while (v43);
  }

  v128 = (void **)&unk_1F0A4A6D0;
  *(_OWORD *)v129 = xmmword_1B255E480;
  *(_DWORD *)&v129[16] = -1082130432;
  *(void *)&v129[20] = 0x100000003;
  *(_WORD *)&v129[28] = 0;
  v129[30] = 0;
  kaldi::nnet1::GradientNormalizationParams::GradientNormalizationParams((kaldi::nnet1::GradientNormalizationParams *)&v122);
  *(float *)v129 = a6;
  v129[28] = 1;
  *(float *)&long long v122 = a9;
  if (v76)
  {
    objc_msgSend(v76, "ear_toString");
  }
  else
  {
    v126[1] = 0;
    v126[0] = 0;
    uint64_t v127 = 0;
  }
  DWORD1(v122) = kaldi::nnet1::Component::MarkerToGradientNormType((kaldi::nnet1::Component *)v126);
  if (SHIBYTE(v127) < 0) {
    operator delete(v126[0]);
  }
  BYTE9(v122) = 0;
  v91 = &unk_1F0A4A6D0;
  v92[0] = *(_OWORD *)v129;
  *(_OWORD *)((char *)v92 + 15) = *(_OWORD *)&v129[15];
  uint64_t v68 = v122;
  uint64_t v69 = DWORD2(v122);
  if (v77)
  {
    objc_msgSend(v77, "ear_toString");
    if (v75)
    {
LABEL_79:
      objc_msgSend(v75, "ear_toString");
      goto LABEL_82;
    }
  }
  else
  {
    memset(v90, 0, sizeof(v90));
    if (v75) {
      goto LABEL_79;
    }
  }
  memset(v89, 0, sizeof(v89));
LABEL_82:
  memset(v88, 0, sizeof(v88));
  std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v88, v96, v97, 0xAAAAAAAAAAAAAAABLL * ((v97 - v96) >> 3));
  memset(v87, 0, sizeof(v87));
  std::vector<std::vector<std::vector<std::pair<int,float>>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<std::pair<int,float>>>*,std::vector<std::vector<std::pair<int,float>>>*>(v87, v93, v94, 0xAAAAAAAAAAAAAAABLL * (v94 - v93));
  if (v74) {
    objc_msgSend(v74, "ear_toString");
  }
  kaldi::nnet1::DoBackProp(a11, (uint64_t)&v91, v68, v69, (uint64_t)v90, (uint64_t)v89);
}

@end