@interface _EAREndpointer
+ (void)initialize;
- (BOOL)acceptEagerResultWithFeatures:(id)a3 featuresToLog:(id *)a4;
- (BOOL)didEndpointWithFeatures:(id)a3 audioTimestamp:(double)a4 featuresToLog:(id *)a5 endpointPosterior:(float *)a6 extraDelayMs:(int *)a7;
- (BOOL)requestSupportedWithSamplingRate:(unint64_t)a3;
- (_EAREndpointer)initWithConfiguration:(id)a3;
- (_EAREndpointer)initWithConfiguration:(id)a3 delaysTrigger:(BOOL)a4 modelVersion:(id *)a5;
- (_EAREndpointer)initWithConfiguration:(id)a3 modelVersion:(id *)a4;
- (id).cxx_construct;
- (id)defaultServerEndpointFeatures;
- (void)updateEndpointerDelayedTriggerSwitch:(BOOL)a3;
- (void)updateEndpointerThresholdWithValue:(float)a3;
@end

@implementation _EAREndpointer

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EAREndpointer)initWithConfiguration:(id)a3
{
  return [(_EAREndpointer *)self initWithConfiguration:a3 modelVersion:0];
}

- (_EAREndpointer)initWithConfiguration:(id)a3 modelVersion:(id *)a4
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EAREndpointer;
  v6 = [(_EAREndpointer *)&v13 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v7 fileExistsAtPath:v5];

    if (v8)
    {
      if (v5) {
        objc_msgSend(v5, "ear_toString");
      }
      operator new();
    }
    v10 = EARLogger::QuasarOSLogger(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_EAROnDeviceEndpointerInfo initWithConfig:]((uint64_t)v5, v10);
    }

    v11 = 0;
  }
  else
  {
    v11 = (_EAREndpointer *)0;
  }

  return v11;
}

- (_EAREndpointer)initWithConfiguration:(id)a3 delaysTrigger:(BOOL)a4 modelVersion:(id *)a5
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_EAREndpointer;
  v7 = [(_EAREndpointer *)&v14 init];
  if (v7)
  {
    int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v9 = [v8 fileExistsAtPath:v6];

    if (v9)
    {
      if (v6) {
        objc_msgSend(v6, "ear_toString");
      }
      operator new();
    }
    v11 = EARLogger::QuasarOSLogger(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_EAROnDeviceEndpointerInfo initWithConfig:]((uint64_t)v6, v11);
    }

    v12 = 0;
  }
  else
  {
    v12 = (_EAREndpointer *)0;
  }

  return v12;
}

- (BOOL)requestSupportedWithSamplingRate:(unint64_t)a3
{
  return quasar::HybridEndpointer::configureForRequest((quasar::HybridEndpointer *)self->_endpointer.__ptr_.__value_, a3);
}

- (void)updateEndpointerThresholdWithValue:(float)a3
{
}

- (void)updateEndpointerDelayedTriggerSwitch:(BOOL)a3
{
}

- (BOOL)didEndpointWithFeatures:(id)a3 audioTimestamp:(double)a4 featuresToLog:(id *)a5 endpointPosterior:(float *)a6 extraDelayMs:(int *)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  int v61 = 0;
  id v57 = a3;
  [v57 pauseCounts];
  v55 = a7;
  v59 = 0;
  v60 = 0;
  __p = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:&v66 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(id *)(*((void *)&v62 + 1) + 8 * i);
        int v16 = [v15 unsignedIntValue];
        int v17 = v16;
        v18 = v59;
        if (v59 >= v60)
        {
          v20 = (char *)__p;
          uint64_t v21 = (v59 - (unsigned char *)__p) >> 2;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v23 = v60 - (unsigned char *)__p;
          if ((v60 - (unsigned char *)__p) >> 1 > v22) {
            unint64_t v22 = v23 >> 1;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v60, v24);
            v20 = (char *)__p;
            v18 = v59;
          }
          else
          {
            v25 = 0;
          }
          v26 = &v25[4 * v21];
          *(_DWORD *)v26 = v17;
          v19 = v26 + 4;
          while (v18 != v20)
          {
            int v27 = *((_DWORD *)v18 - 1);
            v18 -= 4;
            *((_DWORD *)v26 - 1) = v27;
            v26 -= 4;
          }
          __p = v26;
          v59 = v19;
          v60 = &v25[4 * v24];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          *(_DWORD *)v59 = v16;
          v19 = v18 + 4;
        }
        v59 = v19;
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:&v66 count:16];
    }
    while (v12);
  }

  v66 = 0;
  v67 = 0;
  uint64_t v68 = 0;
  LODWORD(v62) = 0;
  value = self->_endpointer.__ptr_.__value_;
  v29 = v57;
  int v30 = [v57 wordCount];
  int v31 = [v57 trailingSilenceDuration];
  [v57 endOfSentenceLikelihood];
  double v33 = v32;
  [v57 acousticEndpointerScore];
  double v35 = v34;
  [v57 silencePosterior];
  double v37 = v36;
  [v57 clientSilenceFramesCountMs];
  double v39 = v38;
  [v57 clientSilenceProbability];
  double v41 = v40;
  [v57 silencePosteriorNF];
  float v43 = v42;
  [v57 serverFeaturesLatency];
  float v45 = v44;
  int v46 = [v57 eagerResultEndTime];
  float v47 = v33;
  float v48 = v35;
  float v49 = v37;
  float v50 = v39;
  float v51 = v41;
  BOOL v52 = quasar::HybridEndpointer::evalEndPoint((uint64_t)value, (float *)&v61, v30, v31, (unsigned int **)&__p, v46, (double **)&v66, &v62, a4, v47, v48, v49, v50, v51, v43, v45);
  v53 = a6;
  if (v55) {
    int *v55 = v62;
  }
  if (a5 && v66 != v67)
  {
    EARHelpers::VectorToArray<double>((double **)&v66);
    v29 = v57;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v53 = a6;
  }
  if (v53) {
    *(_DWORD *)v53 = v61;
  }
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  if (__p)
  {
    v59 = (char *)__p;
    operator delete(__p);
  }

  return v52;
}

- (id)defaultServerEndpointFeatures
{
  quasar::HybridEndpointer::defaultServerEndpointFeatures((const void ***)self->_endpointer.__ptr_.__value_, (uint64_t *)v22);
  v2 = [_EARDefaultServerEndpointFeatures alloc];
  std::string::basic_string[abi:ne180100]<0>(v20, quasar::EP_NUM_OF_WORDS_STR[0]);
  v18[0] = v20;
  float v3 = *((float *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)v20, (uint64_t)&std::piecewise_construct, (_OWORD **)v18)+ 14);
  std::string::basic_string[abi:ne180100]<0>(v18, quasar::EP_NUM_TRAILING_SIL_STR[0]);
  v16[0] = v18;
  float v4 = *((float *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)v18, (uint64_t)&std::piecewise_construct, (_OWORD **)v16)+ 14);
  std::string::basic_string[abi:ne180100]<0>(v16, quasar::EP_EOS_LIKELIHOOD_STR[0]);
  v14[0] = v16;
  int v5 = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)v16, (uint64_t)&std::piecewise_construct, (_OWORD **)v14)+ 14);
  std::string::basic_string[abi:ne180100]<0>(v14, quasar::EP_ACOUSTIC_EP_SCORE_STR[0]);
  __p[0] = v14;
  int v6 = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)v14, (uint64_t)&std::piecewise_construct, (_OWORD **)__p)+ 14);
  std::string::basic_string[abi:ne180100]<0>(__p, quasar::EP_SILENCE_POSTERIOR_STR[0]);
  uint64_t v23 = __p;
  LODWORD(v7) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v23)+ 14);
  LODWORD(v8) = v5;
  LODWORD(v9) = v6;
  v10 = [(_EARDefaultServerEndpointFeatures *)v2 initWithWordCount:(uint64_t)v3 trailingSilenceDuration:(uint64_t)v4 endOfSentenceLikelihood:v8 acousticEndpointerScore:v9 silencePosterior:v7];
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v15 < 0) {
    operator delete(v14[0]);
  }
  if (v17 < 0) {
    operator delete(v16[0]);
  }
  if (v19 < 0) {
    operator delete(v18[0]);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  std::__tree<std::string>::destroy((uint64_t)v22, (char *)v22[1]);
  return v10;
}

- (BOOL)acceptEagerResultWithFeatures:(id)a3 featuresToLog:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  [v47 pauseCounts];
  float v49 = 0;
  float v50 = 0;
  __p = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:&v55 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v52 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v51 + 1) + 8 * i);
        int v10 = [v9 unsignedIntValue];
        int v11 = v10;
        uint64_t v12 = v49;
        if (v49 >= v50)
        {
          objc_super v14 = (char *)__p;
          uint64_t v15 = (v49 - (unsigned char *)__p) >> 2;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v17 = v50 - (unsigned char *)__p;
          if ((v50 - (unsigned char *)__p) >> 1 > v16) {
            unint64_t v16 = v17 >> 1;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            char v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v50, v18);
            objc_super v14 = (char *)__p;
            uint64_t v12 = v49;
          }
          else
          {
            char v19 = 0;
          }
          v20 = &v19[4 * v15];
          *(_DWORD *)v20 = v11;
          char v13 = v20 + 4;
          while (v12 != v14)
          {
            int v21 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v20 - 1) = v21;
            v20 -= 4;
          }
          __p = v20;
          float v49 = v13;
          float v50 = &v19[4 * v18];
          if (v14) {
            operator delete(v14);
          }
        }
        else
        {
          *(_DWORD *)float v49 = v10;
          char v13 = v12 + 4;
        }
        float v49 = v13;
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:&v55 count:16];
    }
    while (v6);
  }

  v55 = 0;
  v56 = 0;
  uint64_t v57 = 0;
  value = self->_endpointer.__ptr_.__value_;
  uint64_t v23 = v47;
  int v24 = [v47 wordCount];
  int v25 = [v47 trailingSilenceDuration];
  [v47 endOfSentenceLikelihood];
  double v27 = v26;
  [v47 silencePosterior];
  double v29 = v28;
  [v47 clientSilenceFramesCountMs];
  double v31 = v30;
  [v47 clientSilenceProbability];
  double v33 = v32;
  [v47 silencePosteriorNF];
  float v35 = v34;
  [v47 serverFeaturesLatency];
  float v37 = v36;
  int v38 = [v47 eagerResultEndTime];
  float v39 = v27;
  float v40 = v29;
  float v41 = v31;
  float v42 = v33;
  char v43 = quasar::HybridEndpointer::acceptEagerResult(value, v24, v25, (unsigned int **)&__p, v38, (char *)&v55, v39, v40, v41, v42, v35, v37);
  float v44 = v55;
  if (a4 && v55 != v56)
  {
    EARHelpers::VectorToArray<double>((double **)&v55);
    uint64_t v23 = v47;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    float v44 = v55;
  }
  if (v44)
  {
    v56 = v44;
    operator delete(v44);
  }
  if (__p)
  {
    float v49 = (char *)__p;
    operator delete(__p);
  }

  return v43;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end