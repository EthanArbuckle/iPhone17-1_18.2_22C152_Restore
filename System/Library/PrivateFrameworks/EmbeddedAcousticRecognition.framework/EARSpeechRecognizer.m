@interface EARSpeechRecognizer
@end

@implementation EARSpeechRecognizer

void __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    std::string::size_type v17 = 0;
  }
  unint64_t v6 = *(void *)(v5 + 64);
  unint64_t v7 = *(void *)(v5 + 56);
  if (v7 >= v6)
  {
    uint64_t v8 = *(void *)(v5 + 48);
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v8) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v8) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v5 + 64);
    if (v12) {
      v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v5 + 64, v12);
    }
    else {
      v13 = 0;
    }
    v14 = v13 + v9;
    __v.__first_ = v13;
    __v.__begin_ = v14;
    __v.__end_cap_.__value_ = &v13[v12];
    v14->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    __v.__end_ = v14 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)(v5 + 48), &__v);
    uint64_t v15 = *(void *)(v5 + 56);
    std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
    *(void *)(v5 + 56) = v15;
  }
  else
  {
    *(void *)(v7 + 16) = v17;
    *(_OWORD *)unint64_t v7 = *(_OWORD *)__p;
    *(void *)(v5 + 56) = v7 + 24;
  }
}

void __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke_2(uint64_t a1)
{
  v1 = (quasar::DecoderOptions *)std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(a1 + 40) fileSystemRepresentation]);
  quasar::DecoderOptions::defaultDecoderOptions(v1);
  quasar::SpeechRecognizer::make_shared();
}

void __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 80);
  if (v5)
  {
    objc_msgSend(v5, "ear_toString");
    if (v7)
    {
LABEL_3:
      objc_msgSend(v7, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    uint64_t v11 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  memset(&__p, 0, sizeof(__p));
LABEL_6:
  quasar::SpeechRecognizer::AddConfigOverride(v8, (unsigned __int8 *)v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(v10[0]);
  }
}

void __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke_550(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  int v4 = [v3 isEqualToString:@"textfield-editing"];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke_2_556(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [MEMORY[0x1E4F28F80] processInfo];
    [v2 systemUptime];
    double v4 = v3;

    id v5 = [[_EARFormatter alloc] initWithQuasarConfig:*(void *)(a1 + 40) overrideConfigFiles:*(void *)(a1 + 48) supportEmojiRecognition:*(unsigned __int8 *)(a1 + 65) language:*(void *)(a1 + 56) skipPathsExistCheck:1];
    uint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    uint64_t v8 = [MEMORY[0x1E4F28F80] processInfo];
    [v8 systemUptime];
    double v10 = v9;

    unint64_t v12 = EARLogger::QuasarOSLogger(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
      *(double *)((char *)buf.__r_.__value_.__r.__words + 4) = v10 - v4;
      _os_log_impl(&dword_1B1A86000, v12, OS_LOG_TYPE_INFO, "Formatter initialization time: %f", (uint8_t *)&buf, 0xCu);
    }

    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      v44 = 0;
      unint64_t v45 = 0;
      unint64_t v46 = 0;
      memset(v43, 0, sizeof(v43));
      std::string::basic_string[abi:ne180100]<0>(v41, "DUMMYTOKEN");
      std::string::basic_string[abi:ne180100]<0>(v39, "");
      std::string::basic_string[abi:ne180100]<0>(v37, "");
      memset(v36, 0, sizeof(v36));
      std::string::basic_string[abi:ne180100]<0>(v34, "");
      quasar::Token::Token(&buf, (long long *)v41, 0, 0, 0, 0, 0, (long long *)v39, 0.0, (long long *)v37, v36, 0, (long long *)v34, 0, 0);
      unint64_t v13 = v45;
      if (v45 >= v46)
      {
        unint64_t v45 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>((uint64_t *)&v44, (long long *)&buf);
        if (SHIBYTE(v63) < 0) {
          operator delete((void *)__p);
        }
      }
      else
      {
        long long v14 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
        *(void *)(v45 + 16) = *((void *)&buf.__r_.__value_.__l + 2);
        *(_OWORD *)unint64_t v13 = v14;
        *(_OWORD *)&buf.__r_.__value_.__l.__data_ = 0uLL;
        uint64_t v15 = *(void *)&v49[14];
        *(_OWORD *)(v13 + 24) = *(_OWORD *)v49;
        *(void *)(v13 + 38) = v15;
        uint64_t v16 = v51;
        *(_OWORD *)(v13 + 48) = v50;
        *(void *)(v13 + 64) = v16;
        *(void *)(v13 + 72) = 0;
        buf.__r_.__value_.__r.__words[2] = 0;
        long long v50 = 0uLL;
        *(void *)(v13 + 80) = 0;
        *(void *)(v13 + 88) = 0;
        *(_OWORD *)(v13 + 72) = v52;
        *(void *)(v13 + 88) = v53;
        uint64_t v53 = 0;
        uint64_t v51 = 0;
        long long v52 = 0uLL;
        long long v17 = v54;
        *(void *)(v13 + 112) = v55;
        *(void *)(v13 + 120) = 0;
        *(_OWORD *)(v13 + 96) = v17;
        long long v54 = 0uLL;
        *(void *)(v13 + 128) = 0;
        *(void *)(v13 + 136) = 0;
        *(_OWORD *)(v13 + 120) = v56;
        *(void *)(v13 + 136) = v57;
        uint64_t v57 = 0;
        uint64_t v55 = 0;
        long long v56 = 0uLL;
        long long v18 = v58;
        *(void *)(v13 + 160) = v59;
        *(_OWORD *)(v13 + 144) = v18;
        long long v58 = 0uLL;
        uint64_t v59 = 0;
        LODWORD(v16) = v60;
        *(_WORD *)(v13 + 172) = v61;
        *(_DWORD *)(v13 + 168) = v16;
        long long v19 = __p;
        *(void *)(v13 + 192) = v63;
        *(_OWORD *)(v13 + 176) = v19;
        uint64_t v63 = 0;
        long long __p = 0uLL;
        long long v20 = v64;
        *(_DWORD *)(v13 + 216) = v65;
        *(_OWORD *)(v13 + 200) = v20;
        unint64_t v45 = v13 + 224;
      }
      if (SHIBYTE(v59) < 0) {
        operator delete((void *)v58);
      }
      v47 = (void **)&v56;
      std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v47);
      if (SHIBYTE(v55) < 0) {
        operator delete((void *)v54);
      }
      v47 = (void **)&v52;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v47);
      if (SHIBYTE(v51) < 0) {
        operator delete((void *)v50);
      }
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
      if (v35 < 0) {
        operator delete(v34[0]);
      }
      v34[0] = v36;
      std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v34);
      if (v38 < 0) {
        operator delete(v37[0]);
      }
      if (v40 < 0) {
        operator delete(v39[0]);
      }
      if (v42 < 0) {
        operator delete(v41[0]);
      }
      [*(id *)(*(void *)(a1 + 32) + 16) formatWords:&v44 unrepairedWordsOut:v43 task:@"Dictation"];
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v33;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v44;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    }
    v24 = *(void **)(a1 + 56);
    if (v24 && (v25 = *(void **)(*(void *)(a1 + 32) + 16)) != 0)
    {
      std::string::basic_string[abi:ne180100]<0>(&v44, (char *)[v24 UTF8String]);
      [v25 endsOfSentencePunctuationsForLanguage:&v44];
      uint64_t v26 = EARHelpers::ContainerToNSSet<std::unordered_set<std::string>>((uint64_t)&buf);
      uint64_t v27 = *(void *)(a1 + 32);
      v28 = *(void **)(v27 + 72);
      *(void *)(v27 + 72) = v26;

      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&buf);
      if (SHIBYTE(v46) < 0) {
        operator delete(v44);
      }
    }
    else
    {
      uint64_t v29 = [MEMORY[0x1E4F1CAD0] set];
      uint64_t v30 = *(void *)(a1 + 32);
      v31 = *(void **)(v30 + 72);
      *(void *)(v30 + 72) = v29;
    }
  }
  else
  {
    id v32 = [*(id *)(*(void *)(a1 + 32) + 496) stringByDeletingLastPathComponent];
    id v21 = [[_EARFormatter alloc] initNcsWithModelRoot:v32];
    uint64_t v22 = *(void *)(a1 + 32);
    v23 = *(void **)(v22 + 16);
    *(void *)(v22 + 16) = v21;
  }
}

void __75___EARSpeechRecognizer_initWithConfiguration_withLanguage_withSdapiConfig___block_invoke(void *a1)
{
  v2 = [[_EARFormatter alloc] initWithLanguage:a1[5] withSdapiConfig:a1[6] quasarConfig:*(void *)(a1[4] + 496)];
  uint64_t v3 = a1[4];
  double v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

void __85___EARSpeechRecognizer_initWithConfiguration_useQuasarFormatter_activeConfiguration___block_invoke(uint64_t a1)
{
  obj = [[_EARFormatter alloc] initWithQuasarConfig:*(void *)(*(void *)(a1 + 32) + 496)];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 2, obj);
  }
}

void __46___EARSpeechRecognizer_updateUserProfileData___block_invoke(uint64_t a1)
{
}

void __45___EARSpeechRecognizer_updateJitProfileData___block_invoke(uint64_t a1)
{
}

void __116___EARSpeechRecognizer_runRecognitionWithResultStream_language_task_samplingRate_userProfileData_speakerCodeWriter___block_invoke(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 64) && *(void *)(a1 + 40))
  {
    uint64_t SysConfig = quasar::SpeechRecognizer::getSysConfig(*(quasar::SpeechRecognizer **)(v2 + 80));
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v5, "ear_toString");
    }
    else
    {
      long long __p = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
    }
    quasar::localeSupportsVoiceCommands(SysConfig);
  }
  *(unsigned char *)(v2 + 65) = 0;
  std::allocate_shared[abi:ne180100]<ResultStreamWrapper,std::allocator<ResultStreamWrapper>,_EARSpeechRecognizer * const {__strong}&,NSDictionary<NSString *,NSString> * {__strong}&,_EARSpeechRecognizer * const {__strong}&* {__strong}&<NSString,NSNumber *>,objc_object  {objcproto33_EARSpeechRecognitionResultStream}* const {__strong}&,NSString const {__strong}&,objc_object  {objcproto30_EARSpeakerCodeWriterInterface}* const {__strong}&,objc_object  {objcproto33_EARSpeechRecognitionResultStream}* const {__strong},void>(v3, (void **)(*(void *)(a1 + 32) + 328), (void **)(*(void *)(a1 + 32) + 336), (void **)(a1 + 48), (void **)(a1 + 56), (void **)(a1 + 64), (void **)(a1 + 40), &__p);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = v27;
  uint64_t v22 = __p;
  v23 = v27;
  if (v27) {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v6)
  {
    [v6 _audioBufferWithLangauge:v7 task:v8 samplingRate:v9 userProfileData:v10 resultStream:&v22];
    uint64_t v11 = v23;
    if (!v23) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v24 = 0;
  v25 = 0;
  if (v11) {
LABEL_12:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
LABEL_13:
  unint64_t v12 = [_EARSpeechRecognitionAudioBuffer alloc];
  uint64_t v20 = v24;
  id v21 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = [(_EARSpeechRecognitionAudioBuffer *)v12 _initWithAudioBuffer:&v20 speechRecognizer:*v3];
  uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 112), *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  uint64_t v16 = *(void *)(a1 + 32);
  long long v18 = __p;
  long long v17 = v27;
  if (v27) {
    atomic_fetch_add_explicit(&v27->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  long long v19 = *(std::__shared_weak_count **)(v16 + 128);
  *(void *)(v16 + 120) = v18;
  *(void *)(v16 + 128) = v17;
  if (v19) {
    std::__shared_weak_count::__release_weak(v19);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
}

void __96___EARSpeechRecognizer__audioBufferWithLangauge_task_samplingRate_userProfileData_resultStream___block_invoke(uint64_t a1)
{
  (*(void (**)(long long *__return_ptr))(**(void **)(*(void *)(a1 + 32) + 80) + 24))(&v5);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = v5;
  long long v5 = 0uLL;
  double v4 = *(std::__shared_weak_count **)(v2 + 56);
  *(_OWORD *)(v2 + 48) = v3;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    if (*((void *)&v5 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v5 + 1));
    }
  }
}

void __67___EARSpeechRecognizer_testFormattingWithOneBestResults_uttMillis___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v12 = 0;
  uint64_t v13 = @"Dictation";
  uint64_t v11 = @"en_US";
  std::allocate_shared[abi:ne180100]<ResultStreamWrapper,std::allocator<ResultStreamWrapper>,_EARSpeechRecognizer * const {__strong}&,NSDictionary<NSString *,NSString> * {__strong}&,_EARSpeechRecognizer * const {__strong}&* {__strong}&<NSString,NSNumber *>,_EARSyncResultStreamHelper * const {__strong}&,NSString {__strong},decltype(nullptr),_EARSyncResultStreamHelper * const {__strong},void>((void **)(a1 + 32), (void **)(v2 + 328), (void **)(v2 + 336), (void **)(a1 + 40), (void **)&v13, (uint64_t)&v12, (void **)&v11, &v14);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v4 = v14;
  long long v14 = 0uLL;
  long long v5 = *(std::__shared_weak_count **)(v3 + 56);
  *(_OWORD *)(v3 + 48) = v4;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    if (*((void *)&v14 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
    }
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v6 + 48);
  uint64_t v8 = *(void *)(v6 + 56);
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *(std::__shared_weak_count **)(v7 + 128);
  *(void *)(v7 + 120) = v9;
  *(void *)(v7 + 128) = v8;
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
}

void __72___EARSpeechRecognizer_compileRecognizerModels2WithConfiguration_error___block_invoke(void *a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  long long v4 = v3;
  if (!v3)
  {
LABEL_4:
    uint64_t v7 = EARLogger::QuasarOSLogger(v3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[4];
      int v14 = 138412290;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1B1A86000, v7, OS_LOG_TYPE_INFO, "e5ml compilation succeeded, path: %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_13;
  }
  long long v5 = [(EARLogger *)v3 domain];
  if ([v5 isEqualToString:@"com.apple.siri.quasar.espressoV2compilation"])
  {
    uint64_t v6 = [(EARLogger *)v4 code];

    if (v6 == 2) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  uint64_t v9 = EARLogger::QuasarOSLogger(v3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __72___EARSpeechRecognizer_compileRecognizerModels2WithConfiguration_error___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  uint64_t v10 = (void *)a1[6];
  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *MEMORY[0x1E4F28A50];
  v17[0] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v12 = [v11 errorWithDomain:@"EARErrorDomain" code:100 userInfo:v7];
  uint64_t v13 = v12;
  if (v10 && v12) {
    *uint64_t v10 = v12;
  }

LABEL_13:
}

uint64_t __41___EARSpeechRecognizer_cancelRecognition__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 80) + 40))();
}

uint64_t __50___EARSpeechRecognizer__waitForAsyncRecogToFinish__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 80) + 32))();
}

void __41___EARSpeechRecognizer_interruptTraining__block_invoke(uint64_t a1)
{
}

uint64_t __46___EARSpeechRecognizer_getFormatterWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

void __47___EARSpeechRecognizer_setActiveConfiguration___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 80) + 40))(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 80));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(quasar::SpeechRecognizer **)(*(void *)(a1 + 32) + 80);
  if (v2) {
    [v2 speechRecognizerActiveConfiguration];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  quasar::SpeechRecognizer::setActiveConfiguration(v3, (const quasar::SpeechRecognizerActiveConfiguration *)v4);
}

void __43___EARSpeechRecognizer_activeConfiguration__block_invoke(uint64_t a1)
{
  id v2 = [[_EARSpeechRecognitionActiveConfiguration alloc] _initWithActiveConfiguration:quasar::SpeechRecognizer::getActiveConfiguration(*(quasar::SpeechRecognizer **)(*(void *)(a1 + 32) + 80))];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __83___EARSpeechRecognizer_resumeRecognitionWithLeftContext_rightContext_selectedText___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*((void *)WeakRetained + 2);
    if (v3)
    {
      long long v5 = v2;
      if ([v3 refreshEmojiRecognizer])
      {
        id v2 = v5;
        BOOL v4 = v5[278] != 0;
      }
      else
      {
        BOOL v4 = 0;
        id v2 = v5;
      }
      v2[278] = v4;
    }
  }
}

void __72___EARSpeechRecognizer_compileRecognizerModels2WithConfiguration_error___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1B1A86000, v1, OS_LOG_TYPE_ERROR, "e5ml compilation failed, error: %@ path: %@", v2, 0x16u);
}

@end