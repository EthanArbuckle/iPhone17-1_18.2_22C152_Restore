@interface AudioDSPUplinkSpeechMixer
- (AudioDSPUplinkSpeechMixer)initWithSettings:(AudioDSPUplinkSpeechMixerSettings *)a3;
- (AudioStreamBasicDescription)sampleRate;
- (id).cxx_construct;
- (id)processBlock;
- (unsigned)maximumFramesPerSlice;
@end

@implementation AudioDSPUplinkSpeechMixer

- (id).cxx_construct
{
  *((unsigned char *)self + 144) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((unsigned char *)self + 72) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_graphErrorLogger.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  if (self->_graphAUPB.__engaged_) {
    MEMORY[0x1C185BC90](&self->_graphAUPB, a2);
  }
  v4 = self->_graph.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id)processBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__AudioDSPUplinkSpeechMixer_processBlock__block_invoke;
  aBlock[3] = &unk_1E6240738;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

double __41__AudioDSPUplinkSpeechMixer_processBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  DSPGraph::Graph::preflight();
  DSPGraph::Graph::processMultiple();
  uint64_t v7 = *(void *)(a1 + 32);
  double result = *(double *)(v7 + 168) + (double)a5;
  *(double *)(v7 + 168) = result;
  return result;
}

- (AudioDSPUplinkSpeechMixer)initWithSettings:(AudioDSPUplinkSpeechMixerSettings *)a3
{
  v3 = self;
  v61[4] = *MEMORY[0x1E4F143B8];
  double mSampleRate = a3->streamDescription.mSampleRate;
  if (a3->streamDescription.mSampleRate <= 0.0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v10 = 0;
      goto LABEL_73;
    }
    LOWORD(__p[0]) = 0;
    v8 = MEMORY[0x1E4F14500];
    v9 = "uplink speech mixer sample rate must be greater than zero";
LABEL_75:
    _os_log_error_impl(&dword_1BB0CE000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)__p, 2u);
    goto LABEL_12;
  }
  if (!a3->maximumFramesPerSlice)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(__p[0]) = 0;
    v8 = MEMORY[0x1E4F14500];
    v9 = "uplink speech mixer maximum number of frames per slice must be greater than zero";
    goto LABEL_75;
  }
  v52.receiver = self;
  v52.super_class = (Class)AudioDSPUplinkSpeechMixer;
  v6 = [(AudioDSPUplinkSpeechMixer *)&v52 init];

  if (v6)
  {
    MEMORY[0x1C185C420](&v58);
    long long v7 = *(_OWORD *)&a3->streamDescription.mBytesPerPacket;
    long long v48 = *(_OWORD *)&a3->streamDescription.mSampleRate;
    long long v49 = v7;
    uint64_t v50 = *(void *)&a3->streamDescription.mBitsPerChannel;
    uint64_t v51 = 1;
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v47, &gResourcesBasePath);
    v46 = 0;
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v31 = 0;
    std::string::append[abi:ne180100]<char const*,0>((std::string *)__p, "uplink_speech_mixer.dspg", "");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)__p, (uint64_t)&v47, &v45);
    if (SBYTE7(v31) < 0) {
      operator delete(__p[0]);
    }
    std::__fs::filesystem::__status(&v45, 0);
    if (!LOBYTE(__p[0]) || LOBYTE(__p[0]) == 255) {
      operator new();
    }
    uint64_t v43 = 0;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    *(_OWORD *)__p = 0u;
    DSPGraph::Interpreter::Interpreter((DSPGraph::Interpreter *)__p);
    std::to_string(&v28, a3->streamDescription.mSampleRate);
    std::string::basic_string[abi:ne180100]<0>(&v54, "IO_SAMPLE_RATE");
    std::string v55 = v28;
    memset(&v28, 0, sizeof(v28));
    std::to_string(&v27, a3->streamDescription.mChannelsPerFrame);
    std::string::basic_string[abi:ne180100]<0>(v56, "IO_CHANNEL_COUNT");
    std::string v57 = v27;
    memset(&v27, 0, sizeof(v27));
    std::unordered_map<std::string,std::string>::unordered_map((uint64_t)cf, (unsigned __int8 *)&v54, 2);
    memset(v26, 0, sizeof(v26));
    DSPGraph::Interpreter::compileFile();
    v11 = v44;
    v44 = 0;
    v12 = v46;
    v46 = v11;
    if (v12)
    {
      (*(void (**)(DSPGraph::Graph *))(*(void *)v12 + 8))(v12);
      v13 = v44;
      v44 = 0;
      if (v13) {
        (*(void (**)(DSPGraph::Graph *))(*(void *)v13 + 8))(v13);
      }
    }
    v53 = (void **)v26;
    std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100](&v53);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)cf);
    for (uint64_t i = 0; i != -12; i -= 6)
    {
      v15 = (void **)((char *)&v54.__pn_.__r_.__value_.__l.__data_ + i * 8);
      if (SHIBYTE(v57.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(v15[9]);
      }
      if (*((char *)v15 + 71) < 0) {
        operator delete(v15[6]);
      }
    }
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v28.__r_.__value_.__l.__data_);
    }
    MEMORY[0x1C185C400](__p);
    if (SHIBYTE(v45.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v45.__pn_.__r_.__value_.__l.__data_);
    }
    DSPGraph::Graph::setSliceDuration();
    DSPGraph::Graph::configure(v46);
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v31 = 0;
    std::string::append[abi:ne180100]<char const*,0>((std::string *)__p, "uplink_speech_mixer.propstrip", "");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)__p, (uint64_t)&v47, &v54);
    if (SBYTE7(v31) < 0) {
      operator delete(__p[0]);
    }
    std::__fs::filesystem::__status(&v54, 0);
    if (LOBYTE(__p[0]) && LOBYTE(__p[0]) != 255)
    {
      if ((v54.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v16 = &v54;
      }
      else {
        v16 = (std::__fs::filesystem::path *)v54.__pn_.__r_.__value_.__r.__words[0];
      }
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)v16);
      applesauce::CF::make_DataRef((const char *)__p, (CFDataRef *)cf);
      if (SBYTE7(v31) < 0) {
        operator delete(__p[0]);
      }
      if (cf[0])
      {
        applesauce::CF::make_DictionaryRef((CFDataRef *)cf, (applesauce::CF::DictionaryRef *)__p);
        if (__p[0])
        {
          DSPGraph::Graph::setPropertyStrip(v46, (const __CFDictionary *)__p[0]);
          if (__p[0]) {
            CFRelease(__p[0]);
          }
        }
        if (cf[0]) {
          CFRelease(cf[0]);
        }
      }
    }
    if (SHIBYTE(v54.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v54.__pn_.__r_.__value_.__l.__data_);
    }
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v31 = 0;
    std::string::append[abi:ne180100]<char const*,0>((std::string *)__p, "uplink_speech_mixer.austrip", "");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)__p, (uint64_t)&v47, &v54);
    if (SBYTE7(v31) < 0) {
      operator delete(__p[0]);
    }
    std::__fs::filesystem::__status(&v54, 0);
    if (LOBYTE(__p[0]) && LOBYTE(__p[0]) != 255)
    {
      if ((v54.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v17 = &v54;
      }
      else {
        v17 = (std::__fs::filesystem::path *)v54.__pn_.__r_.__value_.__r.__words[0];
      }
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)v17);
      applesauce::CF::make_DataRef((const char *)__p, (CFDataRef *)cf);
      if (SBYTE7(v31) < 0) {
        operator delete(__p[0]);
      }
      if (cf[0])
      {
        applesauce::CF::make_DictionaryRef((CFDataRef *)cf, (applesauce::CF::DictionaryRef *)__p);
        if (__p[0])
        {
          DSPGraph::Graph::setAUStrip(v46, (const __CFDictionary *)__p[0]);
          if (__p[0]) {
            CFRelease(__p[0]);
          }
        }
        if (cf[0]) {
          CFRelease(cf[0]);
        }
      }
    }
    if (SHIBYTE(v54.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v54.__pn_.__r_.__value_.__l.__data_);
    }
    DSPGraph::Graph::initialize(v46);
    long long v18 = *(_OWORD *)&a3->streamDescription.mSampleRate;
    long long v19 = *(_OWORD *)&a3->streamDescription.mBytesPerPacket;
    *(_OWORD *)&v6->_settings.streamDescription.mBitsPerChannel = *(_OWORD *)&a3->streamDescription.mBitsPerChannel;
    *(_OWORD *)&v6->_settings.streamDescription.mBytesPerPacket = v19;
    *(_OWORD *)&v6->_settings.streamDescription.double mSampleRate = v18;
    std::shared_ptr<DSPGraph::Graph>::operator=[abi:ne180100]<DSPGraph::Graph,std::default_delete<DSPGraph::Graph>,void>(&v6->_graph.__ptr_, (uint64_t *)&v46);
    uint64_t p_graphAUPB = (uint64_t)&v6->_graphAUPB;
    if (v6->_graphAUPB.__engaged_)
    {
      uint64_t p_graphAUPB = MEMORY[0x1C185BC90](p_graphAUPB);
      v6->_graphAUPB.__engaged_ = 0;
    }
    MEMORY[0x1C185BC80](p_graphAUPB, &v6->_graph);
    v6->_graphAUPB.__engaged_ = 1;
    caulk::deferred_logger::create_v((uint64_t *)__p, MEMORY[0x1E4F14500], v21);
    shared_ptr<caulk::deferred_logger> v22 = *(shared_ptr<caulk::deferred_logger> *)__p;
    __p[0] = 0;
    __p[1] = 0;
    cntrl = (std::__shared_weak_count *)v6->_graphErrorLogger.__cntrl_;
    v6->_graphErrorLogger = v22;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      if (__p[1]) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
      }
    }
    v6->_graphInputSampleTime = 0.0;
    v24 = v46;
    v46 = 0;
    if (v24) {
      (*(void (**)(DSPGraph::Graph *))(*(void *)v24 + 8))(v24);
    }
    if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v47.__r_.__value_.__l.__data_);
    }
    uint64_t v58 = MEMORY[0x1E4F4EAF8] + 16;
    __p[0] = v61;
    std::vector<std::pair<std::string,AudioComponentDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,DSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,DSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)&v60);
    std::__hash_table<std::__hash_value_type<std::string,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)&v59);
  }
  v3 = v6;
  v10 = v3;
LABEL_73:

  return v10;
}

- (unsigned)maximumFramesPerSlice
{
  return self->_settings.maximumFramesPerSlice;
}

- (AudioStreamBasicDescription)sampleRate
{
  long long v3 = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->double mSampleRate = *(_OWORD *)&self->mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[1].mSampleRate;
  return self;
}

@end