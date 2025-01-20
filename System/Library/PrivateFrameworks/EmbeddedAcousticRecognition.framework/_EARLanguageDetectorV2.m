@interface _EARLanguageDetectorV2
+ (void)initialize;
- (BOOL)shouldReportResults:(unint64_t)a3 reportingFrequency:(char)a4;
- (_EARLanguageDetectorV2)initWithConfigFile:(id)a3;
- (_EARLanguageDetectorV2Delegate)lidDelegate;
- (id).cxx_construct;
- (id)earLIDScores:(void *)a3;
- (id)languageDetectorV2Result:(id)a3;
- (id)startRequestWithSamplingRate:(unint64_t)a3 context:(id)a4 delegate:(id)a5;
- (id)startRequestWithSamplingRate:(unint64_t)a3 requestOptions:(id)a4 delegate:(id)a5;
- (id)supportedLocales;
- (void)_startComputeTask;
- (void)dealloc;
- (void)setLidDelegate:(id)a3;
@end

@implementation _EARLanguageDetectorV2

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARLanguageDetectorV2)initWithConfigFile:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_EARLanguageDetectorV2;
  v5 = [(_EARLanguageDetectorV2 *)&v23 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v7 = [v6 fileExistsAtPath:v4];

    if (v7)
    {
      if (v4)
      {
        objc_msgSend(v4, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v22 = 0;
      }
      memset(v20, 0, sizeof(v20));
      *(_OWORD *)v17 = 0u;
      long long v18 = 0u;
      int v19 = 1065353216;
      int JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v5->_sysConfig, (uint64_t)__p, v20, (uint64_t)v17, 0, 0);
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v17);
      v17[0] = v20;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v17);
      if (SHIBYTE(v22) < 0) {
        operator delete(__p[0]);
      }
      if (JsonFile != 2)
      {
        dispatch_queue_t v13 = dispatch_queue_create("com.apple._EARLanguageDetectorV2", 0);
        lidQueue = v5->_lidQueue;
        v5->_lidQueue = (OS_dispatch_queue *)v13;

        std::string::basic_string[abi:ne180100]<0>(v17, "ld-inference");
        quasar::SystemConfig::enforceMinVersion((uint64_t)&v5->_sysConfig, 207, 0, (uint64_t)v17);
        if (SBYTE7(v18) < 0) {
          operator delete(v17[0]);
        }
        quasar::LanguageDetectorV2::languageIdV2Configuration((quasar::LanguageDetectorV2 *)&v5->_sysConfig, v15);
      }
      v9 = EARLogger::QuasarOSLogger(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_EARLanguageDetectorV2 initWithConfigFile:](v9);
      }
    }
    else
    {
      v9 = EARLogger::QuasarOSLogger(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_EARLanguageDetectorV2 initWithConfigFile:]((uint64_t)v4, v9);
      }
    }

    v12 = 0;
  }
  else
  {
    v12 = (_EARLanguageDetectorV2 *)0;
  }

  return v12;
}

- (void)dealloc
{
  v2 = self;
  ptr = self->_audioProcessor.__ptr_;
  if (ptr) {
    self = (_EARLanguageDetectorV2 *)(*(uint64_t (**)(void, SEL))(**(void **)ptr + 32))(*(void *)ptr, a2);
  }
  id v4 = EARLogger::QuasarOSLogger((EARLogger *)self);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v4, OS_LOG_TYPE_INFO, "dealloc", buf, 2u);
  }

  v5.receiver = v2;
  v5.super_class = (Class)_EARLanguageDetectorV2;
  [(_EARLanguageDetectorV2 *)&v5 dealloc];
}

- (id)supportedLocales
{
  return self->_supportedLocales;
}

- (id)startRequestWithSamplingRate:(unint64_t)a3 requestOptions:(id)a4 delegate:(id)a5
{
  unint64_t v18 = a3;
  id v7 = a4;
  v8 = (EARLogger *)a5;
  v9 = EARLogger::QuasarOSLogger(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_1B1A86000, v9, OS_LOG_TYPE_INFO, "Start new request", (uint8_t *)__p, 2u);
  }

  ptr = self->_audioProcessor.__ptr_;
  if (ptr) {
    (*(void (**)(void))(**(void **)ptr + 32))();
  }
  objc_storeWeak((id *)&self->_lidDelegate, v8);
  int v17 = -1;
  int v16 = 0;
  char v15 = 0;
  _ZNSt3__115allocate_sharedB8ne180100IKN5kaldi5TimerENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v14);
  int v13 = -1;
  std::allocate_shared[abi:ne180100]<quasar::RecogAudioBuffer,std::allocator<quasar::RecogAudioBuffer>,unsigned long &,int,int,BOOL,char const(&)[1],std::shared_ptr<kaldi::Timer const>,int,void>((uint64_t)&v19, (int *)&v18, &v17, &v16, &v15, "", &v14, &v13);
}

- (id)startRequestWithSamplingRate:(unint64_t)a3 context:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  v8 = objc_alloc_init(_EARLanguageDetectorV2RequestOptions);
  v9 = [(_EARLanguageDetectorV2 *)self startRequestWithSamplingRate:a3 requestOptions:v8 delegate:v7];

  return v9;
}

- (id)earLIDScores:(void *)a3
{
  *(float *)&double v5 = kaldi::VectorBase<float>::ApplySoftMax((uint64_t)a3);
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v5);
  for (unint64_t i = 0; [(NSArray *)self->_supportedLocales count] > i; ++i)
  {
    LODWORD(v8) = *(_DWORD *)(*(void *)a3 + 4 * i);
    v9 = [NSNumber numberWithFloat:v8];
    v10 = [(NSArray *)self->_supportedLocales objectAtIndexedSubscript:i];
    [v6 setObject:v9 forKeyedSubscript:v10];
  }
  return v6;
}

- (id)languageDetectorV2Result:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(_EARLanguageDetectorV2Result);
  [(_EARLanguageDetectorV2Result *)v5 setConfidences:v4];
  uint64_t v15 = 0;
  int v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  int v13 = &stru_1F0A64AB0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___EARLanguageDetectorV2_languageDetectorV2Result___block_invoke;
  v7[3] = &unk_1E5FFEB40;
  v7[4] = &v15;
  v7[5] = v14;
  v7[6] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  [(_EARLanguageDetectorV2Result *)v5 setDetectedLanguage:v16[3] > self->_englishThreshold];
  [(_EARLanguageDetectorV2Result *)v5 setDominantLocale:v9[5]];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

- (BOOL)shouldReportResults:(unint64_t)a3 reportingFrequency:(char)a4
{
  BOOL v4 = a4 != 1 || a3 > 0x3C0;
  return a4 != 2 && v4;
}

- (void)_startComputeTask
{
  ptr = self->_audioProcessor.__ptr_;
  cntrl = self->_audioProcessor.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  objc_initWeak(&location, self);
  lidQueue = self->_lidQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __43___EARLanguageDetectorV2__startComputeTask__block_invoke;
  block[3] = &unk_1F0A63D50;
  v7[1] = ptr;
  uint64_t v8 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  objc_copyWeak(v7, &location);
  block[4] = self;
  dispatch_async(lidQueue, block);
  objc_destroyWeak(v7);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  objc_destroyWeak(&location);
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (_EARLanguageDetectorV2Delegate)lidDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lidDelegate);
  return (_EARLanguageDetectorV2Delegate *)WeakRetained;
}

- (void)setLidDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lidDelegate);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_supportedLocales, 0);
  cntrl = self->_audioBuffer.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_lidQueue, 0);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)&self->_sysConfig);
  BOOL v4 = self->_audioProcessor.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  self->_audioProcessor = 0u;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&self->_sysConfig);
  self->_audioBuffer = 0u;
  return self;
}

- (void)initWithConfigFile:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Config created with incorrect version", v1, 2u);
}

- (void)initWithConfigFile:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Failed to read languages-list", v1, 2u);
}

- (void)initWithConfigFile:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "Config file does not exist at %@", (uint8_t *)&v2, 0xCu);
}

@end