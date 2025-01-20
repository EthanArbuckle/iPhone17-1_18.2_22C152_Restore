@interface _EARe5mlCompiler
+ (unint64_t)getMilPathWithModelConfig:(id)a3 files:(void *)a4;
+ (void)compileWithModelConfig:(id)a3 completion:(id)a4;
+ (void)compileWithModelMilPath:(id)a3 computePlatform:(id)a4 completion:(id)a5;
+ (void)compileWithModelMilPath:(id)a3 computePlatforms:(id)a4 completion:(id)a5;
@end

@implementation _EARe5mlCompiler

+ (void)compileWithModelMilPath:(id)a3 computePlatform:(id)a4 completion:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (v9)
  {
    id v15 = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [a1 compileWithModelMilPath:v8 computePlatforms:v11 completion:v10];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v11 = [NSString stringWithFormat:@"compute platform specified is nil"];
    v17[0] = v11;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v14 = [v12 errorWithDomain:@"com.apple.siri.quasar.espressoV2compilation" code:4 userInfo:v13];
    v10[2](v10, v14);
  }
}

+ (void)compileWithModelMilPath:(id)a3 computePlatforms:(id)a4 completion:(id)a5
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v58 = a4;
  v56 = v7;
  v57 = (void (**)(id, void *))a5;
  if (v7) {
    objc_msgSend(v7, "ear_toString");
  }
  else {
    memset(&__v, 0, 24);
  }
  BOOL isEspressoV2Mil = kaldi::quasar::isEspressoV2Mil((uint64_t *)&__v);
  BOOL v9 = isEspressoV2Mil;
  if (SHIBYTE(__v.__end_) < 0)
  {
    operator delete(__v.__first_);
    if (v9) {
      goto LABEL_6;
    }
LABEL_36:
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    v24 = [NSString stringWithFormat:@"mil path is invalid: %@", v7];
    v75[0] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
    v26 = [v23 errorWithDomain:@"com.apple.siri.quasar.espressoV2compilation" code:3 userInfo:v25];
    v57[2](v57, v26);

    goto LABEL_71;
  }
  if (!isEspressoV2Mil) {
    goto LABEL_36;
  }
LABEL_6:
  if (v58 && [v58 count])
  {
    memset(&v67, 0, sizeof(v67));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v58;
    uint64_t v10 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v64 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(id *)(*((void *)&v63 + 1) + 8 * i);
          if (([v13 isEqual:@"CPU"] & 1) == 0
            && ([v13 isEqual:@"GPU"] & 1) == 0
            && ([v13 isEqual:@"ANE"] & 1) == 0)
          {
            kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&__v);
            v50 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__v, (uint64_t)"compilation platform not specified correctly: ", 46);
            if (v13)
            {
              objc_msgSend(v13, "ear_toString");
              unsigned int v53 = HIBYTE(v61);
              v52 = (void **)__p[0];
              v51 = __p[1];
            }
            else
            {
              v51 = 0;
              v52 = 0;
              unsigned int v53 = 0;
              __p[0] = 0;
              __p[1] = 0;
              std::string::size_type v61 = 0;
            }
            if ((v53 & 0x80u) == 0) {
              v54 = __p;
            }
            else {
              v54 = v52;
            }
            if ((v53 & 0x80u) == 0) {
              uint64_t v55 = v53;
            }
            else {
              uint64_t v55 = (uint64_t)v51;
            }
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v50, (uint64_t)v54, v55);
            if (SHIBYTE(v61) < 0) {
              operator delete(__p[0]);
            }
            kaldi::KaldiErrorMessage::~KaldiErrorMessage((kaldi::KaldiErrorMessage *)&__v);
          }
          if (v13)
          {
            objc_msgSend(v13, "ear_toString");
          }
          else
          {
            __p[0] = 0;
            __p[1] = 0;
            std::string::size_type v61 = 0;
          }
          std::vector<std::string>::pointer end = v67.__end_;
          if (v67.__end_ >= v67.__end_cap_.__value_)
          {
            unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v67.__end_ - (char *)v67.__begin_) >> 3);
            unint64_t v17 = v16 + 1;
            if (v16 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v67.__end_cap_.__value_ - (char *)v67.__begin_) >> 3) > v17) {
              unint64_t v17 = 0x5555555555555556 * (((char *)v67.__end_cap_.__value_ - (char *)v67.__begin_) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v67.__end_cap_.__value_ - (char *)v67.__begin_) >> 3) >= 0x555555555555555) {
              unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v18 = v17;
            }
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v67.__end_cap_;
            if (v18) {
              v19 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v67.__end_cap_, v18);
            }
            else {
              v19 = 0;
            }
            v20 = v19 + v16;
            __v.__first_ = v19;
            __v.__begin_ = v20;
            __v.__end_cap_.__value_ = &v19[v18];
            long long v21 = *(_OWORD *)__p;
            v20->__r_.__value_.__r.__words[2] = v61;
            *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
            __p[1] = 0;
            std::string::size_type v61 = 0;
            __p[0] = 0;
            __v.__end_ = v20 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v67, &__v);
            v22 = v67.__end_;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
            v67.__end_ = v22;
          }
          else
          {
            long long v15 = *(_OWORD *)__p;
            v67.__end_->__r_.__value_.__r.__words[2] = v61;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v15;
            v67.__end_ = end + 1;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v10);
    }

    if (v56) {
      objc_msgSend(v56, "ear_toString");
    }
    else {
      memset(&__v, 0, 24);
    }
    __p[0] = 0;
    __p[1] = 0;
    std::string::size_type v61 = 0;
    int v31 = kaldi::quasar::onDeviceCompile((uint64_t)&__v, (unsigned __int16 **)&v67, (uint64_t *)__p);
    v68 = __p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v68);
    if (SHIBYTE(__v.__end_) < 0) {
      operator delete(__v.__first_);
    }
    if (v31)
    {
      if ((kaldi::g_kaldi_verbose_level & 0x80000000) == 0)
      {
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&__v);
        v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__v, (uint64_t)"Compiling for model: ", 21);
        if (v56)
        {
          objc_msgSend(v56, "ear_toString");
          unsigned int v33 = HIBYTE(v61);
          v34 = (void **)__p[0];
          v35 = __p[1];
        }
        else
        {
          v35 = 0;
          v34 = 0;
          unsigned int v33 = 0;
          __p[0] = 0;
          __p[1] = 0;
          std::string::size_type v61 = 0;
        }
        if ((v33 & 0x80u) == 0) {
          v40 = __p;
        }
        else {
          v40 = v34;
        }
        if ((v33 & 0x80u) == 0) {
          uint64_t v41 = v33;
        }
        else {
          uint64_t v41 = (uint64_t)v35;
        }
        v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)v40, v41);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)" is successful", 14);
        if (SHIBYTE(v61) < 0) {
          operator delete(__p[0]);
        }
        kaldi::KaldiLogMessage::~KaldiLogMessage((kaldi::KaldiLogMessage *)&__v);
      }
      v57[2](v57, 0);
    }
    else
    {
      if ((kaldi::g_kaldi_verbose_level & 0x80000000) == 0)
      {
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&__v);
        v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__v, (uint64_t)"Compiling for model: ", 21);
        if (v56)
        {
          objc_msgSend(v56, "ear_toString");
          unsigned int v37 = HIBYTE(v61);
          v38 = (void **)__p[0];
          v39 = __p[1];
        }
        else
        {
          v39 = 0;
          v38 = 0;
          unsigned int v37 = 0;
          __p[0] = 0;
          __p[1] = 0;
          std::string::size_type v61 = 0;
        }
        if ((v37 & 0x80u) == 0) {
          v43 = __p;
        }
        else {
          v43 = v38;
        }
        if ((v37 & 0x80u) == 0) {
          uint64_t v44 = v37;
        }
        else {
          uint64_t v44 = (uint64_t)v39;
        }
        v45 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)v43, v44);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)" failed", 7);
        if (SHIBYTE(v61) < 0) {
          operator delete(__p[0]);
        }
        kaldi::KaldiLogMessage::~KaldiLogMessage((kaldi::KaldiLogMessage *)&__v);
      }
      v46 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      v47 = [NSString stringWithFormat:@"On device compilation fail with mil: %@ and compute platform: %@", v56, obj];
      v70 = v47;
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v49 = [v46 errorWithDomain:@"com.apple.siri.quasar.espressoV2compilation" code:0 userInfo:v48];
      v57[2](v57, v49);
    }
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&v67;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  else
  {
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    v28 = [NSString stringWithFormat:@"compute platforms specified are nil or empty"];
    v73 = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    v30 = [v27 errorWithDomain:@"com.apple.siri.quasar.espressoV2compilation" code:4 userInfo:v29];
    v57[2](v57, v30);
  }
LABEL_71:
}

+ (void)compileWithModelConfig:(id)a3 completion:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  std::string::basic_string[abi:ne180100]<0>(&v24, "");
  memset(v23, 0, sizeof(v23));
  uint64_t v8 = [a1 getMilPathWithModelConfig:v6 files:v23];
  if (v8 == 1)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    uint64_t v10 = [NSString stringWithFormat:@"mil file not found in: %@", v6];
    v27 = v10;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    long long v15 = [v13 errorWithDomain:@"com.apple.siri.quasar.espressoV2compilation" code:2 userInfo:v14];
    v7[2](v7, v15);
  }
  else
  {
    if (v8)
    {
      [MEMORY[0x1E4F28CB8] defaultManager];
      objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v6, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v20 = 0;
      }
      memset(&v21, 0, sizeof(v21));
      *(_OWORD *)unint64_t v16 = 0u;
      long long v17 = 0u;
      LODWORD(v18) = 1065353216;
      quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v22, (uint64_t)__p, (uint64_t *)&v21, (uint64_t)v16);
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v16);
      v16[0] = &v21;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v16);
      if (SHIBYTE(v20) < 0) {
        operator delete(__p[0]);
      }
      std::string::basic_string[abi:ne180100]<0>(v16, "misc-shared.mil-is-ane-ready-on-low-end-device-v2");
      quasar::SystemConfig::getPtreeOptional((uint64_t)v22, (uint64_t)v16);
    }
    BOOL v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v10 = [NSString stringWithFormat:@"config file invalid: %@", v6];
    v29[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v12 = [v9 errorWithDomain:@"com.apple.siri.quasar.espressoV2compilation" code:1 userInfo:v11];
    v7[2](v7, v12);
  }
  v22[0] = (void **)v23;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v22);
  if (v25 < 0) {
    operator delete(v24);
  }
}

+ (unint64_t)getMilPathWithModelConfig:(id)a3 files:(void *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "ear_toString");
    if ((kaldi::g_kaldi_verbose_level & 0x80000000) == 0)
    {
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v17);
      id v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Getting model config for compilation :", 38);
      if ((v22 & 0x80u) == 0) {
        uint64_t v8 = v21;
      }
      else {
        uint64_t v8 = (void **)v21[0];
      }
      if ((v22 & 0x80u) == 0) {
        uint64_t v9 = v22;
      }
      else {
        uint64_t v9 = (uint64_t)v21[1];
      }
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)v8, v9);
      kaldi::KaldiLogMessage::~KaldiLogMessage((kaldi::KaldiLogMessage *)&v17);
    }
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v16 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    int v25 = 1065353216;
    quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&v17, (uint64_t)v21, (uint64_t *)__p, (uint64_t)&v23);
    uint64_t v10 = (void ***)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v23);
    *(void *)&long long v23 = __p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v10);
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    Ptree = (quasar::PTree *)quasar::SystemConfig::getPtree((uint64_t)&v17, (uint64_t)__p);
    *(void *)&long long v23 = &unk_1F0A5A5F8;
    *((void *)&v23 + 1) = kaldi::quasar::isEspressoV2Mil;
    *((void *)&v24 + 1) = &v23;
    quasar::findLeafValuesWithCondition(Ptree, (uint64_t)&v23, &v18);
    std::__function::__value_func<BOOL ()(std::string const&)>::~__value_func[abi:ne180100](&v23);
    if (SHIBYTE(v16) < 0) {
      operator delete(__p[0]);
    }
    quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)&v17);
    uint64_t v12 = v18;
    if (v18 != v19)
    {
      std::string::basic_string[abi:ne180100]<0>(&v23, ":,");
      quasar::splitStringSimple(v12, (uint64_t *)&v23, (unint64_t)&v17);
    }
    if (*((void *)a4 + 1) == *(void *)a4) {
      unint64_t v13 = 1;
    }
    else {
      unint64_t v13 = 2;
    }
    long long v17 = (void **)&v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v17);
    if ((char)v22 < 0) {
      operator delete(v21[0]);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

@end