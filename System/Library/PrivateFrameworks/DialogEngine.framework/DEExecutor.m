@interface DEExecutor
+ (id)bundleTemplateDir:(id)a3;
+ (id)prepareCallback:(id)a3 forContext:(void *)a4;
+ (void)executeWithJson:(id)a3 callback:(id)a4 completionBlock:(id)a5;
+ (void)executeWithJson:(id)a3 completionBlock:(id)a4;
+ (void)executeWithJson:(id)a3 paramsString:(id)a4 localeString:(id)a5 callback:(id)a6 completionBlock:(id)a7;
+ (void)initialize;
+ (void)preload;
- (BOOL)createTrace;
- (BOOL)debug;
- (BOOL)deterministic;
- (BOOL)enableUpdates;
- (BOOL)grounding;
- (BOOL)includeKeywords;
- (BOOL)isLabelMode;
- (BOOL)isSpotlight;
- (BOOL)multiuser;
- (BOOL)resetState;
- (BOOL)switchFallthrough;
- (BOOL)test;
- (BOOL)visual;
- (DEDistribution)distribution;
- (DEExecutionContext)context;
- (DEExecutor)init;
- (DEPatternContext)patternContext;
- (NSDictionary)customPronunciations;
- (NSDictionary)dialogMetadata;
- (NSDictionary)globalParameters;
- (NSDictionary)parameters;
- (NSDictionary)userSettings;
- (NSString)catId;
- (NSString)executionRequestId;
- (NSString)interactionId;
- (NSString)locale;
- (NSString)patternId;
- (NSString)pluginName;
- (NSString)responseMode;
- (NSString)templateDir;
- (NSString)voiceGender;
- (basic_string<char,)consumeContextForJson:(std::allocator<char>> *__return_ptr)retstr;
- (id)callback;
- (id)consumeContext:(shared_ptr<siri:()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> dialogengine::Context>)a3 paramsPath:localePath:visualPath:;
- (id)execute;
- (id)executeVisual:(id)a3;
- (id)executeWithParams:(id)a3 locale:(id)a4;
- (id)executeWithParams:(id)a3 locale:(id)a4 visual:(id)a5;
- (id)getRequestJSON;
- (int64_t)currentTime;
- (shared_ptr<siri::dialogengine::Context>)getContext:(ElapsedTimer *)a3;
- (unsigned)randomSeed;
- (void)LogCurareCATExecution:(const void *)a3;
- (void)executeVisual:(id)a3 completionBlock:(id)a4;
- (void)executeWithCompletionBlock:(id)a3;
- (void)executeWithParams:(id)a3 locale:(id)a4 completionBlock:(id)a5;
- (void)setCallback:(id)a3;
- (void)setCatId:(id)a3;
- (void)setContext:(id)a3;
- (void)setCreateTrace:(BOOL)a3;
- (void)setCurrentTime:(int64_t)a3;
- (void)setCustomPronunciations:(id)a3;
- (void)setDebug:(BOOL)a3;
- (void)setDeterministic:(BOOL)a3;
- (void)setDialogMetadata:(id)a3;
- (void)setDistribution:(id)a3;
- (void)setEnableUpdates:(BOOL)a3;
- (void)setExecutionRequestId:(id)a3;
- (void)setGlobalParameters:(id)a3;
- (void)setGrounding:(BOOL)a3;
- (void)setIncludeKeywords:(BOOL)a3;
- (void)setInteractionId:(id)a3;
- (void)setIsLabelMode:(BOOL)a3;
- (void)setIsSpotlight:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setMultiuser:(BOOL)a3;
- (void)setParameters:(id)a3;
- (void)setPatternContext:(id)a3;
- (void)setPatternId:(id)a3;
- (void)setPluginName:(id)a3;
- (void)setRandomSeed:(unsigned int)a3;
- (void)setResetState:(BOOL)a3;
- (void)setResponseMode:(id)a3;
- (void)setSwitchFallthrough:(BOOL)a3;
- (void)setTemplateDir:(id)a3;
- (void)setTest:(BOOL)a3;
- (void)setUserSettings:(id)a3;
- (void)setVisual:(BOOL)a3;
- (void)setVoiceGender:(id)a3;
- (void)updateContext:(void *)a3 paramsPath:()basic_string<char localePath:()std:(std::allocator<char>> *)a4 :char_traits<char> visualPath:;
@end

@implementation DEExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternContext, 0);
  objc_storeStrong((id *)&self->_customPronunciations, 0);
  objc_storeStrong((id *)&self->_distribution, 0);
  objc_storeStrong((id *)&self->_voiceGender, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pluginName, 0);
  objc_storeStrong((id *)&self->_userSettings, 0);
  objc_storeStrong((id *)&self->_globalParameters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
  objc_storeStrong((id *)&self->_executionRequestId, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_dialogMetadata, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_catId, 0);
  objc_storeStrong((id *)&self->_templateDir, 0);
}

- (void)setIsLabelMode:(BOOL)a3
{
  self->_isLabelMode = a3;
}

- (BOOL)isLabelMode
{
  return self->_isLabelMode;
}

- (void)setIsSpotlight:(BOOL)a3
{
  self->_isSpotlight = a3;
}

- (BOOL)isSpotlight
{
  return self->_isSpotlight;
}

- (void)setPatternContext:(id)a3
{
}

- (DEPatternContext)patternContext
{
  return self->_patternContext;
}

- (void)setDeterministic:(BOOL)a3
{
  self->_deterministic = a3;
}

- (BOOL)deterministic
{
  return self->_deterministic;
}

- (void)setCustomPronunciations:(id)a3
{
}

- (NSDictionary)customPronunciations
{
  return self->_customPronunciations;
}

- (void)setDistribution:(id)a3
{
}

- (DEDistribution)distribution
{
  return self->_distribution;
}

- (void)setCurrentTime:(int64_t)a3
{
  self->_currentTime = a3;
}

- (int64_t)currentTime
{
  return self->_currentTime;
}

- (void)setRandomSeed:(unsigned int)a3
{
  self->_randomSeed = a3;
}

- (unsigned)randomSeed
{
  return self->_randomSeed;
}

- (void)setVoiceGender:(id)a3
{
}

- (NSString)voiceGender
{
  return self->_voiceGender;
}

- (void)setIncludeKeywords:(BOOL)a3
{
  self->_includeKeywords = a3;
}

- (BOOL)includeKeywords
{
  return self->_includeKeywords;
}

- (void)setSwitchFallthrough:(BOOL)a3
{
  self->_switchFallthrough = a3;
}

- (BOOL)switchFallthrough
{
  return self->_switchFallthrough;
}

- (void)setCreateTrace:(BOOL)a3
{
  self->_createTrace = a3;
}

- (BOOL)createTrace
{
  return self->_createTrace;
}

- (void)setEnableUpdates:(BOOL)a3
{
  self->_enableUpdates = a3;
}

- (BOOL)enableUpdates
{
  return self->_enableUpdates;
}

- (void)setGrounding:(BOOL)a3
{
  self->_grounding = a3;
}

- (BOOL)grounding
{
  return self->_grounding;
}

- (void)setMultiuser:(BOOL)a3
{
  self->_multiuser = a3;
}

- (BOOL)multiuser
{
  return self->_multiuser;
}

- (void)setResetState:(BOOL)a3
{
  self->_resetState = a3;
}

- (BOOL)resetState
{
  return self->_resetState;
}

- (void)setTest:(BOOL)a3
{
  self->_test = a3;
}

- (BOOL)test
{
  return self->_test;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setVisual:(BOOL)a3
{
  self->_visual = a3;
}

- (BOOL)visual
{
  return self->_visual;
}

- (void)setCallback:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setContext:(id)a3
{
}

- (DEExecutionContext)context
{
  return self->_context;
}

- (void)setPluginName:(id)a3
{
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setUserSettings:(id)a3
{
}

- (NSDictionary)userSettings
{
  return self->_userSettings;
}

- (void)setGlobalParameters:(id)a3
{
}

- (NSDictionary)globalParameters
{
  return self->_globalParameters;
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setResponseMode:(id)a3
{
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (void)setPatternId:(id)a3
{
}

- (NSString)patternId
{
  return self->_patternId;
}

- (void)setExecutionRequestId:(id)a3
{
}

- (NSString)executionRequestId
{
  return self->_executionRequestId;
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setDialogMetadata:(id)a3
{
}

- (NSDictionary)dialogMetadata
{
  return self->_dialogMetadata;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setCatId:(id)a3
{
}

- (NSString)catId
{
  return self->_catId;
}

- (void)setTemplateDir:(id)a3
{
}

- (NSString)templateDir
{
  return self->_templateDir;
}

- (id)executeWithParams:(id)a3 locale:(id)a4 visual:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(DEExecutor *)self getRequestJSON];
  std::string::basic_string[abi:ne180100]<0>(&__p, v11);
  std::string::basic_string[abi:ne180100]<0>(&v16, (char *)[v8 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)[v9 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v14, (char *)[v10 UTF8String]);
  siri::dialogengine::PrepareRequestFromJson(&v17);
}

- (void)executeVisual:(id)a3 completionBlock:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    v7 = [(DEExecutor *)self executeWithParams:&stru_1F2127290 locale:&stru_1F2127290 visual:v8];
    v6[2](v6, v7);
  }
}

- (id)executeVisual:(id)a3
{
  v3 = [(DEExecutor *)self executeWithParams:&stru_1F2127290 locale:&stru_1F2127290 visual:a3];
  return v3;
}

- (id)executeWithParams:(id)a3 locale:(id)a4
{
  v4 = [(DEExecutor *)self executeWithParams:a3 locale:a4 visual:&stru_1F2127290];
  return v4;
}

- (void)executeWithParams:(id)a3 locale:(id)a4 completionBlock:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    id v10 = [(DEExecutor *)self executeWithParams:v11 locale:v8];
    v9[2](v9, v10);
  }
}

- (id)execute
{
  BYTE8(v43) = 0;
  *(void *)&long long v42 = 0;
  long long v41 = 0uLL;
  BYTE8(v42) = 0;
  siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)&v41);
  v38[0] = v41;
  v38[1] = v42;
  v38[2] = v43;
  [(DEExecutor *)self getContext:v38];
  if (!v39)
  {
    v3 = 0;
    goto LABEL_44;
  }
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v32, (const siri::dialogengine::RequestInfo *)(v39 + 8));
  [(DEExecutor *)self LogCurareCATExecution:&v32];
  *(_DWORD *)((char *)v31 + 3) = 0;
  v31[0] = 0;
  *(_DWORD *)((char *)v30 + 3) = 0;
  v30[0] = 0;
  *(_DWORD *)((char *)v29 + 3) = 0;
  v29[0] = 0;
  if (v32 == 1)
  {
    v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v22, v33, v34, 0xAAAAAAAAAAAAAAABLL * ((v34 - v33) >> 5));
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v21, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
    }
    else {
      std::string v21 = v35;
    }
    siri::dialogengine::FindVisualFile(&v22, (uint64_t)&v21, (uint64_t)&v25);
    v4 = v25;
    std::string::size_type v5 = v26;
    v29[0] = *(_DWORD *)v27;
    *(_DWORD *)((char *)v29 + 3) = *(_DWORD *)&v27[3];
    char v6 = v28;
    char v28 = 0;
    LOBYTE(v25) = 0;
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }
    v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v22;
    std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
    __s = 0;
    std::string::size_type v7 = 0;
    char v8 = 0;
    id v9 = 0;
    std::string::size_type v10 = 0;
    char v11 = 0;
  }
  else
  {
    v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v22, v33, v34, 0xAAAAAAAAAAAAAAABLL * ((v34 - v33) >> 5));
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v21, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
    }
    else {
      std::string v21 = v35;
    }
    siri::dialogengine::FindParamsFile(&v22, (uint64_t)&v21, (uint64_t)&v25);
    std::string::size_type v7 = v26;
    __s = v25;
    v31[0] = *(_DWORD *)v27;
    *(_DWORD *)((char *)v31 + 3) = *(_DWORD *)&v27[3];
    char v8 = v28;
    char v28 = 0;
    LOBYTE(v25) = 0;
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }
    v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v22;
    std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
    v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v22, v33, v34, 0xAAAAAAAAAAAAAAABLL * ((v34 - v33) >> 5));
    memset(&v21, 0, sizeof(v21));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v21, v36, v37, 0xAAAAAAAAAAAAAAABLL * (((char *)v37 - (char *)v36) >> 3));
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v20, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
    }
    else {
      std::string v20 = v35;
    }
    siri::dialogengine::FindLocaleFile(&v22, (long long **)&v21, (uint64_t)&v20, (uint64_t)&v25);
    id v9 = v25;
    std::string::size_type v10 = v26;
    v30[0] = *(_DWORD *)v27;
    *(_DWORD *)((char *)v30 + 3) = *(_DWORD *)&v27[3];
    char v11 = v28;
    char v28 = 0;
    LOBYTE(v25) = 0;
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }
    v20.__r_.__value_.__r.__words[0] = (std::string::size_type)&v21;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
    v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v22;
    std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
    v4 = 0;
    std::string::size_type v5 = 0;
    char v6 = 0;
  }
  uint64_t v18 = v39;
  v19 = v40;
  if (v40) {
    atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v8 < 0)
  {
    std::string::__init_copy_ctor_external(&v17, __s, v7);
  }
  else
  {
    v17.__r_.__value_.__r.__words[0] = (std::string::size_type)__s;
    v17.__r_.__value_.__l.__size_ = v7;
    LODWORD(v17.__r_.__value_.__r.__words[2]) = v31[0];
    *(_DWORD *)((char *)&v17.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v31 + 3);
    *((unsigned char *)&v17.__r_.__value_.__s + 23) = v8;
  }
  if (v11 < 0)
  {
    std::string::__init_copy_ctor_external(&v16, v9, v10);
  }
  else
  {
    v16.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
    v16.__r_.__value_.__l.__size_ = v10;
    LODWORD(v16.__r_.__value_.__r.__words[2]) = v30[0];
    *(_DWORD *)((char *)&v16.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v30 + 3);
    *((unsigned char *)&v16.__r_.__value_.__s + 23) = v11;
  }
  if (v6 < 0)
  {
    std::string::__init_copy_ctor_external(&v15, v4, v5);
  }
  else
  {
    v15.__r_.__value_.__r.__words[0] = (std::string::size_type)v4;
    v15.__r_.__value_.__l.__size_ = v5;
    LODWORD(v15.__r_.__value_.__r.__words[2]) = v29[0];
    *(_DWORD *)((char *)&v15.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v29 + 3);
    *((unsigned char *)&v15.__r_.__value_.__s + 23) = v6;
  }
  v3 = -[DEExecutor consumeContext:paramsPath:localePath:visualPath:](self, "consumeContext:paramsPath:localePath:visualPath:", &v18, &v17, &v16, &v15, __s);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if ((v6 & 0x80) == 0)
  {
    if ((v11 & 0x80) == 0) {
      goto LABEL_42;
    }
LABEL_50:
    operator delete(v9);
    if ((v8 & 0x80) == 0) {
      goto LABEL_43;
    }
LABEL_51:
    operator delete(__sa);
    goto LABEL_43;
  }
  operator delete(v4);
  if (v11 < 0) {
    goto LABEL_50;
  }
LABEL_42:
  if (v8 < 0) {
    goto LABEL_51;
  }
LABEL_43:
  siri::dialogengine::RequestInfo::~RequestInfo(&v32);
LABEL_44:
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  return v3;
}

- (void)executeWithCompletionBlock:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F29060] isMainThread];
  char v6 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__DEExecutor_executeWithCompletionBlock___block_invoke;
  block[3] = &unk_1E651EAA0;
  block[4] = self;
  id v9 = v4;
  char v10 = v5;
  id v7 = v4;
  dispatch_async(v6, block);
}

void __41__DEExecutor_executeWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x6012000000;
  v59 = __Block_byref_object_copy__25077;
  v60 = __Block_byref_object_dispose__25078;
  v61 = "";
  char v64 = 0;
  memset(v62, 0, sizeof(v62));
  char v63 = 0;
  siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v62);
  v2 = *(void **)(a1 + 32);
  long long v3 = *((_OWORD *)v57 + 4);
  v53[0] = *((_OWORD *)v57 + 3);
  v53[1] = v3;
  v53[2] = *((_OWORD *)v57 + 5);
  if (v2)
  {
    [v2 getContext:v53];
    if (v54)
    {
      char v50 = 0;
      memset(v48, 0, sizeof(v48));
      char v49 = 0;
      siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v48);
      siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v42, (const siri::dialogengine::RequestInfo *)(v54 + 8));
      [*(id *)(a1 + 32) LogCurareCATExecution:&v42];
      *(_DWORD *)((char *)v41 + 3) = 0;
      v41[0] = 0;
      *(_DWORD *)((char *)v40 + 3) = 0;
      v40[0] = 0;
      *(_DWORD *)((char *)v39 + 3) = 0;
      v39[0] = 0;
      if (v42)
      {
        if (v42 == 1)
        {
          memset(&v36, 0, sizeof(v36));
          std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v36, v43, v44, 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 5));
          if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v35, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
          }
          else {
            std::string v35 = v45;
          }
          siri::dialogengine::FindVisualFile((long long **)&v36, (uint64_t)&v35, (uint64_t)__p);
          char v10 = (std::string::value_type *)__p[0];
          char v11 = __p[1];
          v39[0] = v38;
          *(_DWORD *)((char *)v39 + 3) = *(_DWORD *)((char *)&v38 + 3);
          char v12 = HIBYTE(v38);
          HIBYTE(v38) = 0;
          LOBYTE(__p[0]) = 0;
          if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v35.__r_.__value_.__l.__data_);
          }
          v35.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
          std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
          siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v48, &v36);
          v13 = std::string::insert(&v36, 0, "Finding visual path took ");
          long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
          std::string::size_type v38 = v13->__r_.__value_.__r.__words[2];
          *(_OWORD *)__p = v14;
          v13->__r_.__value_.__l.__size_ = 0;
          v13->__r_.__value_.__r.__words[2] = 0;
          v13->__r_.__value_.__r.__words[0] = 0;
          siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
          if (SHIBYTE(v38) < 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v36.__r_.__value_.__l.__data_);
          }
          char v5 = 0;
          char v6 = 0;
          char v7 = 0;
          uint64_t v24 = 0;
          char v8 = 0;
          char v9 = 0;
        }
        else
        {
          char v5 = 0;
          char v6 = 0;
          char v7 = 0;
          uint64_t v24 = 0;
          char v8 = 0;
          char v9 = 0;
          char v10 = 0;
          char v11 = 0;
          char v12 = 0;
        }
      }
      else
      {
        memset(&v36, 0, sizeof(v36));
        std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v36, v43, v44, 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 5));
        if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v35, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
        }
        else {
          std::string v35 = v45;
        }
        siri::dialogengine::FindParamsFile((long long **)&v36, (uint64_t)&v35, (uint64_t)__p);
        char v6 = __p[1];
        __s = (std::string::value_type *)__p[0];
        v41[0] = v38;
        *(_DWORD *)((char *)v41 + 3) = *(_DWORD *)((char *)&v38 + 3);
        char v7 = HIBYTE(v38);
        HIBYTE(v38) = 0;
        LOBYTE(__p[0]) = 0;
        if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v35.__r_.__value_.__l.__data_);
        }
        v35.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
        std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
        memset(&v36, 0, sizeof(v36));
        std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v36, v43, v44, 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 5));
        memset(&v35, 0, sizeof(v35));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v35, v46, v47, 0xAAAAAAAAAAAAAAABLL * (((char *)v47 - (char *)v46) >> 3));
        if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v34, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
        }
        else {
          std::string v34 = v45;
        }
        siri::dialogengine::FindLocaleFile((long long **)&v36, (long long **)&v35, (uint64_t)&v34, (uint64_t)__p);
        char v8 = __p[1];
        uint64_t v24 = (std::string::value_type *)__p[0];
        v40[0] = v38;
        *(_DWORD *)((char *)v40 + 3) = *(_DWORD *)((char *)&v38 + 3);
        char v9 = HIBYTE(v38);
        HIBYTE(v38) = 0;
        LOBYTE(__p[0]) = 0;
        if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v34.__r_.__value_.__l.__data_);
        }
        v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
        v35.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
        std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
        siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v48, &v36);
        std::string v15 = std::string::insert(&v36, 0, "Finding locale path took ");
        long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
        std::string::size_type v38 = v15->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v16;
        v15->__r_.__value_.__l.__size_ = 0;
        v15->__r_.__value_.__r.__words[2] = 0;
        v15->__r_.__value_.__r.__words[0] = 0;
        siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
        if (SHIBYTE(v38) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v36.__r_.__value_.__l.__data_);
        }
        char v10 = 0;
        char v11 = 0;
        char v12 = 0;
        char v5 = __s;
      }
      std::string v17 = *(void **)(a1 + 32);
      uint64_t v32 = v54;
      uint64_t v33 = v55;
      if (v55) {
        atomic_fetch_add_explicit(&v55->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      __sa = (std::string::value_type *)v5;
      if (v7 < 0)
      {
        std::string::__init_copy_ctor_external(&v31, v5, (std::string::size_type)v6);
      }
      else
      {
        v31.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
        v31.__r_.__value_.__l.__size_ = (std::string::size_type)v6;
        LODWORD(v31.__r_.__value_.__r.__words[2]) = v41[0];
        *(_DWORD *)((char *)&v31.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v41 + 3);
        *((unsigned char *)&v31.__r_.__value_.__s + 23) = v7;
      }
      if (v9 < 0)
      {
        std::string::__init_copy_ctor_external(&v30, v24, (std::string::size_type)v8);
      }
      else
      {
        v30.__r_.__value_.__r.__words[0] = (std::string::size_type)v24;
        v30.__r_.__value_.__l.__size_ = (std::string::size_type)v8;
        LODWORD(v30.__r_.__value_.__r.__words[2]) = v40[0];
        *(_DWORD *)((char *)&v30.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v40 + 3);
        *((unsigned char *)&v30.__r_.__value_.__s + 23) = v9;
      }
      if (v12 < 0)
      {
        std::string::__init_copy_ctor_external(&v29, v10, (std::string::size_type)v11);
      }
      else
      {
        v29.__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
        v29.__r_.__value_.__l.__size_ = (std::string::size_type)v11;
        LODWORD(v29.__r_.__value_.__r.__words[2]) = v39[0];
        *(_DWORD *)((char *)&v29.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v39 + 3);
        *((unsigned char *)&v29.__r_.__value_.__s + 23) = v12;
      }
      uint64_t v18 = objc_msgSend(v17, "consumeContext:paramsPath:localePath:visualPath:", &v32, &v31, &v30, &v29, __sa);
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v29.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v30.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      if (v33) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v33);
      }
      if (*(void *)(a1 + 40))
      {
        siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)(v57 + 6), &v36);
        v19 = std::string::insert(&v36, 0, "Time in executeWithCompletionBlock before switch to return queue is ");
        long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
        std::string::size_type v38 = v19->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v20;
        v19->__r_.__value_.__l.__size_ = 0;
        v19->__r_.__value_.__r.__words[2] = 0;
        v19->__r_.__value_.__r.__words[0] = 0;
        siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
        if (SHIBYTE(v38) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v36.__r_.__value_.__l.__data_);
        }
        if (*(unsigned char *)(a1 + 48))
        {
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __41__DEExecutor_executeWithCompletionBlock___block_invoke_2;
          v25[3] = &unk_1E651EA78;
          char v28 = &v56;
          id v27 = *(id *)(a1 + 40);
          id v26 = v18;
          dispatch_async(MEMORY[0x1E4F14428], v25);
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }

      if (v12 < 0)
      {
        operator delete(v10);
        if ((v9 & 0x80) == 0)
        {
LABEL_63:
          if ((v7 & 0x80) == 0)
          {
LABEL_64:
            siri::dialogengine::RequestInfo::~RequestInfo(&v42);
            goto LABEL_65;
          }
LABEL_70:
          operator delete(__sb);
          goto LABEL_64;
        }
      }
      else if ((v9 & 0x80) == 0)
      {
        goto LABEL_63;
      }
      operator delete(v24);
      if ((v7 & 0x80) == 0) {
        goto LABEL_64;
      }
      goto LABEL_70;
    }
  }
  else
  {
    uint64_t v54 = 0;
    v55 = 0;
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__DEExecutor_executeWithCompletionBlock___block_invoke_409;
    block[3] = &unk_1E651EA50;
    id v52 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_65:
  if (v55) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v55);
  }
  _Block_object_dispose(&v56, 8);
}

uint64_t __41__DEExecutor_executeWithCompletionBlock___block_invoke_409(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__DEExecutor_executeWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), &v5);
  v2 = std::string::insert(&v5, 0, "Total time in executeWithCompletionBlock is ");
  long long v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  std::string::size_type v7 = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)consumeContext:(shared_ptr<siri:()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> dialogengine::Context>)a3 paramsPath:localePath:visualPath:
{
  uint64_t v5 = v4;
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)_log);
  uint64_t v11 = *(void *)ptr;
  if (*((char *)cntrl + 23) < 0) {
    std::string::__init_copy_ctor_external(&v28, *(const std::string::value_type **)cntrl, *((void *)cntrl + 1));
  }
  else {
    std::string v28 = *(std::string *)cntrl;
  }
  if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&value, a4->__r_.__value_.var0.var1.__data_, a4->__r_.__value_.var0.var1.__size_);
  }
  else {
    std::string value = (std::string)a4->__r_.__value_;
  }
  if (*(char *)(v5 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)v5, *(void *)(v5 + 8));
  }
  else {
    std::string v26 = *(std::string *)v5;
  }
  [(DEExecutor *)self updateContext:v11 paramsPath:&v28 localePath:&value visualPath:&v26];
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(value.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  char v12 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v22 = *(void *)ptr;
  uint64_t v23 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(DEExecutor *)self consumeContextForJson:&v22];
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  v13 = (id)_log;
  long long v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)std::string v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FormatResponse", "", v21, 2u);
  }

  if (v25 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  long long v16 = [NSString stringWithUTF8String:p_p];
  id v17 = [[DEResult alloc] initFromJson:v16];
  uint64_t v18 = (id)_log;
  v19 = v18;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)std::string v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v19, OS_SIGNPOST_INTERVAL_END, v10, "FormatResponse", "", v21, 2u);
  }

  if (v25 < 0) {
    operator delete(__p);
  }
  return v17;
}

- (basic_string<char,)consumeContextForJson:(std::allocator<char>> *__return_ptr)retstr
{
  long long v3 = v2;
  uint64_t v4 = v1;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)_log);
  std::string::size_type v7 = [v4 callback];
  char v8 = +[DEExecutor prepareCallback:v7 forContext:*v3];

  *((void *)*v3 + 99) = v8;
  char v9 = (id)_log;
  os_signpost_id_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    [v4 catId];
    uint64_t v24 = retstr;
    id v11 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 UTF8String];
    id v13 = [v4 locale];
    *(_DWORD *)buf = 136315394;
    uint64_t v26 = v12;
    __int16 v27 = 2080;
    uint64_t v28 = [v13 UTF8String];
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadCATFile", "CAT_ID = %s LOCALE = %s", buf, 0x16u);

    retstr = v24;
  }

  siri::dialogengine::Context::Load(*v3);
  long long v14 = (id)_log;
  std::string v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v15, OS_SIGNPOST_INTERVAL_END, v6, "LoadCATFile", "", buf, 2u);
  }

  os_signpost_id_t v16 = os_signpost_id_generate((os_log_t)_log);
  id v17 = (id)_log;
  uint64_t v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    id v19 = [v4 catId];
    uint64_t v20 = [v19 UTF8String];
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = v20;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "GenerateResponse", "CAT_ID = %s", buf, 0xCu);
  }
  siri::dialogengine::GenerateResponse((uint64_t *)&retstr->__r_.__value_.var0.var1, *v3);
  std::string v21 = (id)_log;
  uint64_t v22 = v21;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v22, OS_SIGNPOST_INTERVAL_END, v16, "GenerateResponse", "", buf, 2u);
  }

  *((void *)*v3 + 99) = 0;
  return result;
}

- (void)updateContext:(void *)a3 paramsPath:()basic_string<char localePath:()std:(std::allocator<char>> *)a4 :char_traits<char> visualPath:
{
  os_signpost_id_t v6 = v5;
  std::string::size_type v7 = v4;
  os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)_log);
  id v11 = (id)_log;
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UpdateContext", "", buf, 2u);
  }

  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)buf, (const siri::dialogengine::RequestInfo *)((char *)a3 + 8));
  std::string::operator=(v17, (const std::string *)a4);
  std::string::operator=(v18, v7);
  std::string::operator=(v19, v6);
  siri::dialogengine::Context::SetRequestInfo((uint64_t)a3, (uint64_t)buf);
  id v13 = (id)_log;
  long long v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)std::string v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v14, OS_SIGNPOST_INTERVAL_END, v10, "UpdateContext", "", v15, 2u);
  }

  siri::dialogengine::RequestInfo::~RequestInfo((void **)buf);
}

- (shared_ptr<siri::dialogengine::Context>)getContext:(ElapsedTimer *)a3
{
  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)_log);
  uint64_t v4 = (id)_log;
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PrepareParameters", "", buf, 2u);
  }

  operator new();
}

- (id)getRequestJSON
{
  os_signpost_id_t v3 = objc_opt_new();
  uint64_t v4 = [(DEExecutor *)self catId];

  if (v4)
  {
    uint64_t v5 = [(DEExecutor *)self catId];
    [v3 setValue:v5 forKey:@"catId"];
  }
  os_signpost_id_t v6 = [(DEExecutor *)self parameters];

  if (v6)
  {
    std::string::size_type v7 = [(DEExecutor *)self parameters];
    [v3 setValue:v7 forKey:@"parameters"];
  }
  char v8 = [(DEExecutor *)self templateDir];

  if (v8)
  {
    char v9 = [(DEExecutor *)self templateDir];
    [v3 setValue:v9 forKey:@"templateDir"];
  }
  os_signpost_id_t v10 = [(DEExecutor *)self locale];

  if (v10)
  {
    id v11 = [(DEExecutor *)self locale];
    [v3 setValue:v11 forKey:@"locale"];
  }
  uint64_t v12 = [(DEExecutor *)self globalParameters];

  if (v12)
  {
    id v13 = [(DEExecutor *)self globalParameters];
    [v3 setValue:v13 forKey:@"globalParameters"];
  }
  long long v14 = [(DEExecutor *)self userSettings];

  if (v14)
  {
    std::string v15 = [(DEExecutor *)self userSettings];
    [v3 setValue:v15 forKey:@"userSettings"];
  }
  if ([(DEExecutor *)self visual]) {
    [v3 setValue:@"visual" forKey:@"requestType"];
  }
  if ([(DEExecutor *)self debug])
  {
    os_signpost_id_t v16 = [NSNumber numberWithBool:1];
    [v3 setValue:v16 forKey:@"debug"];
  }
  if ([(DEExecutor *)self test])
  {
    id v17 = [NSNumber numberWithBool:1];
    [v3 setValue:v17 forKey:@"test"];
  }
  if ([(DEExecutor *)self resetState])
  {
    uint64_t v18 = [NSNumber numberWithBool:1];
    [v3 setValue:v18 forKey:@"resetState"];
  }
  if ([(DEExecutor *)self multiuser])
  {
    id v19 = [NSNumber numberWithBool:1];
    [v3 setValue:v19 forKey:@"multiuser"];
  }
  if ([(DEExecutor *)self grounding])
  {
    uint64_t v20 = [NSNumber numberWithBool:1];
    [v3 setValue:v20 forKey:@"grounding"];
  }
  std::string v21 = [(DEExecutor *)self voiceGender];

  if (v21)
  {
    uint64_t v22 = [(DEExecutor *)self voiceGender];
    [v3 setValue:v22 forKey:@"voiceGender"];
  }
  uint64_t v23 = [(DEExecutor *)self dialogMetadata];

  if (v23)
  {
    uint64_t v24 = [(DEExecutor *)self dialogMetadata];
    [v3 setValue:v24 forKey:@"dialogMetadata"];
  }
  char v25 = [(DEExecutor *)self interactionId];

  if (v25)
  {
    uint64_t v26 = [(DEExecutor *)self interactionId];
    [v3 setValue:v26 forKey:@"interactionId"];
  }
  __int16 v27 = [(DEExecutor *)self executionRequestId];

  if (v27)
  {
    uint64_t v28 = [(DEExecutor *)self executionRequestId];
    [v3 setValue:v28 forKey:@"executionRequestId"];
  }
  if ([(DEExecutor *)self randomSeed])
  {
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DEExecutor randomSeed](self, "randomSeed"));
    [v3 setValue:v29 forKey:@"randomSeed"];
  }
  if ([(DEExecutor *)self currentTime])
  {
    std::string v30 = objc_msgSend(NSNumber, "numberWithLong:", -[DEExecutor currentTime](self, "currentTime"));
    [v3 setValue:v30 forKey:@"currentTime"];
  }
  if ([(DEExecutor *)self isSpotlight])
  {
    std::string v31 = [NSNumber numberWithBool:1];
    [v3 setValue:v31 forKey:@"isSpotlight"];
  }
  uint64_t v32 = [(DEExecutor *)self customPronunciations];

  if (v32)
  {
    uint64_t v33 = [(DEExecutor *)self customPronunciations];
    [v3 setValue:v33 forKey:@"customPronunciations"];
  }
  if ([(DEExecutor *)self createTrace])
  {
    std::string v34 = [NSNumber numberWithBool:1];
    [v3 setValue:v34 forKey:@"createTrace"];
  }
  if ([(DEExecutor *)self switchFallthrough])
  {
    std::string v35 = [NSNumber numberWithBool:1];
    [v3 setValue:v35 forKey:@"switchFallthrough"];
  }
  if ([(DEExecutor *)self deterministic])
  {
    std::string v36 = [NSNumber numberWithBool:1];
    [v3 setValue:v36 forKey:@"deterministic"];
  }
  if ([(DEExecutor *)self isLabelMode])
  {
    v37 = [NSNumber numberWithBool:1];
    [v3 setValue:v37 forKey:@"labelMode"];
  }
  if ([(DEExecutor *)self includeKeywords])
  {
    std::string::size_type v38 = [NSNumber numberWithBool:1];
    [v3 setValue:v38 forKey:@"includeKeywords"];
  }
  id v44 = 0;
  uint64_t v39 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:3 error:&v44];
  id v41 = v44;
  if (v39)
  {
    long long v42 = (void *)[[NSString alloc] initWithData:v39 encoding:4];
  }
  else
  {
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Failed to parse input parameters for CAT request", v40);
    uint64_t v39 = 0;
    long long v42 = 0;
  }

  return v42;
}

- (DEExecutor)init
{
  v5.receiver = self;
  v5.super_class = (Class)DEExecutor;
  v2 = [(DEExecutor *)&v5 init];
  os_signpost_id_t v3 = v2;
  if (v2)
  {
    [(DEExecutor *)v2 setVisual:0];
    [(DEExecutor *)v3 setDebug:0];
    [(DEExecutor *)v3 setTest:0];
    [(DEExecutor *)v3 setResetState:0];
    [(DEExecutor *)v3 setMultiuser:0];
    [(DEExecutor *)v3 setGrounding:0];
    [(DEExecutor *)v3 setEnableUpdates:0];
    [(DEExecutor *)v3 setCreateTrace:0];
    [(DEExecutor *)v3 setSwitchFallthrough:0];
    [(DEExecutor *)v3 setIncludeKeywords:0];
  }
  return v3;
}

- (void)LogCurareCATExecution:(const void *)a3
{
  if (*((char *)a3 + 55) < 0) {
    std::string::__init_copy_ctor_external(&v14, *((const std::string::value_type **)a3 + 4), *((void *)a3 + 5));
  }
  else {
    std::string v14 = *(std::string *)((char *)a3 + 32);
  }
  if (*((char *)a3 + 343) < 0) {
    std::string::__init_copy_ctor_external(&v13, *((const std::string::value_type **)a3 + 40), *((void *)a3 + 41));
  }
  else {
    std::string v13 = *(std::string *)((char *)a3 + 320);
  }
  if (*((char *)a3 + 127) < 0) {
    std::string::__init_copy_ctor_external(&v12, *((const std::string::value_type **)a3 + 13), *((void *)a3 + 14));
  }
  else {
    std::string v12 = *(std::string *)((char *)a3 + 104);
  }
  if (*((char *)a3 + 151) < 0) {
    std::string::__init_copy_ctor_external(&v11, *((const std::string::value_type **)a3 + 16), *((void *)a3 + 17));
  }
  else {
    std::string v11 = *(std::string *)((char *)a3 + 128);
  }
  id v4 = MEMORY[0x1E4F14428];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __36__DEExecutor_LogCurareCATExecution___block_invoke;
  v6[3] = &__block_descriptor_128_ea8_32c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE56c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE104c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_e5_v8__0l;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v7, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  }
  else {
    std::string v7 = v14;
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v8, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  }
  else {
    std::string v8 = v13;
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v9, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
  }
  else {
    std::string v9 = v12;
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v11;
  }
  objc_super v5 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v6);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
}

uint64_t __36__DEExecutor_LogCurareCATExecution___block_invoke(uint64_t a1)
{
  return siri::dialogengine::LogCurareCATExecution((uint64_t *)(a1 + 32), (const std::string::value_type *)(a1 + 56), (uint64_t *)(a1 + 80), (uint64_t *)(a1 + 104));
}

+ (void)executeWithJson:(id)a3 completionBlock:(id)a4
{
}

+ (void)executeWithJson:(id)a3 callback:(id)a4 completionBlock:(id)a5
{
}

+ (void)executeWithJson:(id)a3 paramsString:(id)a4 localeString:(id)a5 callback:(id)a6 completionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  std::string::basic_string[abi:ne180100]<0>(&v20, "");
  if (v12) {
    MEMORY[0x1C8796900](&v20, [v12 UTF8String]);
  }
  std::string::basic_string[abi:ne180100]<0>(&v19, "");
  if (v13) {
    MEMORY[0x1C8796900](&v19, [v13 UTF8String]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v11 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v17, "");
  siri::dialogengine::ParseRequestFromJson(&v18);
}

uint64_t __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v4 = a1[6];
  os_signpost_id_t v3 = (std::__shared_weak_count *)a1[7];
  uint64_t v11 = v4;
  id v12 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v2)
  {
    [v2 consumeContextForJson:&v11];
    os_signpost_id_t v3 = v12;
    if (!v12) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v14 = 0;
  if (v3) {
LABEL_5:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
LABEL_6:
  if (v14 >= 0) {
    objc_super v5 = v13;
  }
  else {
    objc_super v5 = (void **)v13[0];
  }
  os_signpost_id_t v6 = [NSString stringWithUTF8String:v5];
  std::string v7 = (void *)a1[5];
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke_3;
    block[3] = &unk_1E651EAC8;
    id v10 = v7;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (SHIBYTE(v14) < 0) {
    operator delete(v13[0]);
  }
}

uint64_t __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)prepareCallback:(id)a3 forContext:(void *)a4
{
  id v5 = a3;
  os_signpost_id_t v6 = v5;
  std::string v7 = 0;
  if (v5 && a4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__DEExecutor_prepareCallback_forContext___block_invoke;
    v9[3] = &unk_1E651EA28;
    uint64_t v11 = a4;
    id v10 = v5;
    std::string v7 = (void *)MEMORY[0x1C8797450](v9);
  }
  return v7;
}

void __41__DEExecutor_prepareCallback_forContext___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, void *a5@<X8>)
{
  id v10 = objc_opt_new();
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    uint64_t v13 = *(void *)(v11 + 504);
    id v12 = *(std::__shared_weak_count **)(v11 + 512);
    if (v12)
    {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    if (v13)
    {
      uint64_t v30 = a1;
      std::string v31 = a5;
      std::map<std::string,std::shared_ptr<siri::dialogengine::Variable>>::map[abi:ne180100]((uint64_t)&v35, (const void ***)(*(void *)(a1 + 40) + 520));
      uint64_t v14 = v35;
      if (v35 != (long long *)v36)
      {
        do
        {
          std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100](&__p, v14 + 2);
          id v15 = DE_VariableToNSObject(v33, 1);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, v30, v31);
          [v10 setObject:v15 forKey:v17];

          if (v34) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v34);
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          uint64_t v18 = (long long *)*((void *)v14 + 1);
          if (v18)
          {
            do
            {
              uint64_t v19 = v18;
              uint64_t v18 = *(long long **)v18;
            }
            while (v18);
          }
          else
          {
            do
            {
              uint64_t v19 = (long long *)*((void *)v14 + 2);
              BOOL v20 = *(void *)v19 == (void)v14;
              uint64_t v14 = v19;
            }
            while (!v20);
          }
          uint64_t v14 = v19;
        }
        while (v19 != (long long *)v36);
      }
      std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v36[0]);
      a1 = v30;
      a5 = v31;
    }
  }
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v21 = a2;
  }
  else {
    uint64_t v21 = *(void *)a2;
  }
  uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", v21, v30, v31);
  if (*(char *)(a3 + 23) >= 0) {
    uint64_t v23 = a3;
  }
  else {
    uint64_t v23 = *(void *)a3;
  }
  uint64_t v24 = [NSString stringWithUTF8String:v23];
  if (a4[23] >= 0) {
    char v25 = a4;
  }
  else {
    char v25 = *(char **)a4;
  }
  uint64_t v26 = [NSString stringWithUTF8String:v25];
  uint64_t v27 = a1;
  uint64_t v28 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v28)
  {
    uint64_t v29 = DE_NSObjectToVariable(*(const char **)(v27 + 40), v28, a3, (const void **)a4, a2, 0);
    if (v29) {
      std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::Variable,void>(a5, v29);
    }
  }
  *a5 = 0;
  a5[1] = 0;
}

+ (id)bundleTemplateDir:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 resourcePath];
    os_signpost_id_t v6 = v5;
    if (v5) {
      std::string v7 = (char *)[v5 UTF8String];
    }
    else {
      std::string v7 = "";
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v7);
    siri::dialogengine::GetDomainTemplateDir((uint64_t)__p, (uint64_t)v13);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    if (v14 >= 0) {
      id v9 = v13;
    }
    else {
      id v9 = (void **)v13[0];
    }
    std::string v8 = [NSString stringWithUTF8String:v9];
    if (v14 < 0) {
      operator delete(v13[0]);
    }
  }
  else
  {
    std::string v8 = &stru_1F2127290;
  }

  return v8;
}

+ (void)preload
{
  {
    __cxa_atexit(MEMORY[0x1E4FBA268], &+[DEExecutor preload]::sPreloadMutex, &dword_1C5C1E000);
  }
  std::mutex::lock((std::mutex *)&+[DEExecutor preload]::sPreloadMutex);
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)_log);
  id v3 = (id)_log;
  uint64_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Preload", "", buf, 2u);
  }

  if ((+[DEExecutor preload]::sInitialized & 1) == 0)
  {
    char v29 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    *(void *)buf = 0;
    char v28 = 0;
    siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)buf);
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"PRELOAD: DialogEngine starting preload work", v5);
    char v24 = 0;
    memset(v22, 0, sizeof(v22));
    char v23 = 0;
    siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v22);
    siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v22);
    id v7 = siri::dialogengine::GetUAFAssetSet(v6);
    siri::dialogengine::ElapsedTimer::Stop(v22);
    siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v22, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"PRELOAD: GetUAFAssetSet time: %s", v8, p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v22);
    id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v11 = [v10 localeIdentifier];
    std::string::basic_string[abi:ne180100]<0>(&v20, (char *)[v11 UTF8String]);
    siri::dialogengine::GetCanonicalLocale(&v20, 0, &__p);
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }

    siri::dialogengine::PreloadMorphunData(&__p);
    siri::dialogengine::ElapsedTimer::Stop(v22);
    siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v22, &v20);
    if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v13 = &v20;
    }
    else {
      uint64_t v13 = (std::string *)v20.__r_.__value_.__r.__words[0];
    }
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"PRELOAD: PreloadMorphunData time: %s", v12, v13);
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }
    siri::dialogengine::ElapsedTimer::Stop((siri::dialogengine **)buf);
    siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)buf, &v19);
    char v14 = std::string::insert(&v19, 0, "PRELOAD: DialogEngine finished preload work in ");
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v20.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)&v20, 0);
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    siri::dialogengine::ReportPreloadHasBeenCalled(v16);
    +[DEExecutor preload]::sInitialized = 1;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v17 = (id)_log;
  uint64_t v18 = v17;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v18, OS_SIGNPOST_INTERVAL_END, v2, "Preload", "", buf, 2u);
  }

  std::mutex::unlock((std::mutex *)&+[DEExecutor preload]::sPreloadMutex);
}

+ (void)initialize
{
  _log = (uint64_t)os_log_create("com.apple.siri.DialogEngine", "DEExecutor");
  MEMORY[0x1F41817F8]();
}

@end