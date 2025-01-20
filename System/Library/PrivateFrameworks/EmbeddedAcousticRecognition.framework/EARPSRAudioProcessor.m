@interface EARPSRAudioProcessor
+ (void)initialize;
- (EARPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6;
- (EARPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7;
- (EARPSRAudioProcessorDelegate)delegate;
- (NSString)configRoot;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (unint64_t)batchSize;
- (void)_startComputeTask;
- (void)addAudio:(id)a3;
- (void)dealloc;
- (void)endAudio;
- (void)resetForNewRequest;
- (void)setBatchSize:(unint64_t)a3;
- (void)setConfigRoot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation EARPSRAudioProcessor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.ear", "EARPSRAudioProcessor");
    v3 = (void *)earPSRLog;
    earPSRLog = (uint64_t)v2;
  }
}

- (EARPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6
{
  v11 = dispatch_get_global_queue(2, 0);
  v12 = [(EARPSRAudioProcessor *)self initWithConfigFile:a3 configRoot:a4 sampleRate:a5 delegate:a6 queue:v11];

  return v12;
}

- (EARPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)EARPSRAudioProcessor;
  v16 = [(EARPSRAudioProcessor *)&v31 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_17;
  }
  v16->_sampleRate = a5;
  objc_storeStrong((id *)&v16->_configRoot, a4);
  objc_storeWeak((id *)&v17->_delegate, v14);
  objc_storeStrong((id *)&v17->_queue, a7);
  v17->_batchSize = 1;
  v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v19 = [v18 fileExistsAtPath:v12];

  if (v19)
  {
    if (v12)
    {
      objc_msgSend(v12, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v30 = 0;
    }
    memset(v28, 0, sizeof(v28));
    *(_OWORD *)buf = 0u;
    long long v33 = 0u;
    int v34 = 1065353216;
    int JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v17->_sysConfig, (uint64_t)__p, v28, (uint64_t)buf, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
    *(void *)buf = v28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (SHIBYTE(v30) < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(buf, "psr");
    quasar::SystemConfig::enforceMinVersion((uint64_t)&v17->_sysConfig, 62, 0, (uint64_t)buf);
    if (SBYTE7(v33) < 0) {
      operator delete(*(void **)buf);
    }
    if (JsonFile == 2)
    {
      uint64_t v25 = earPSRLog;
      if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v21 = "PSR: ERR: AudioProcessorPipeline created with incorrect version";
        v22 = v25;
        uint32_t v23 = 2;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
LABEL_17:
    v26 = v17;
    goto LABEL_18;
  }
  uint64_t v20 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v12;
    v21 = "PSR: EARAudioProcessor Config file does not exist at %@";
    v22 = v20;
    uint32_t v23 = 12;
LABEL_15:
    _os_log_impl(&dword_1B1A86000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
  }
LABEL_16:
  v26 = 0;
LABEL_18:

  return v26;
}

- (void)addAudio:(id)a3
{
  id v4 = a3;
  (*(void (**)(void, uint64_t, unint64_t))(**(void **)self->_audioProcessor.__ptr_ + 16))(*(void *)self->_audioProcessor.__ptr_, [v4 bytes], (unint64_t)objc_msgSend(v4, "length") >> 1);
}

- (void)endAudio
{
  v3 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B1A86000, v3, OS_LOG_TYPE_DEFAULT, "endAudio", v4, 2u);
  }
  (*(void (**)(void))(**(void **)self->_audioProcessor.__ptr_ + 32))(*(void *)self->_audioProcessor.__ptr_);
}

- (void)resetForNewRequest
{
  v3 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p) = 0;
    _os_log_impl(&dword_1B1A86000, v3, OS_LOG_TYPE_DEFAULT, "resetForNewRequest", (uint8_t *)&__p, 2u);
  }
  ptr = self->_audioProcessor.__ptr_;
  if (ptr) {
    (*(void (**)(void))(**(void **)ptr + 32))();
  }
  configRoot = self->_configRoot;
  if (configRoot)
  {
    [(NSString *)configRoot ear_toString];
  }
  else
  {
    __p = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::PSRAudioProcessor,std::allocator<quasar::PSRAudioProcessor>,quasar::SystemConfig &,std::string,unsigned long &,void>((uint64_t)&self->_sysConfig, (uint64_t)&__p, (unsigned int *)&self->_sampleRate, &v11);
  shared_ptr<quasar::PSRAudioProcessor> v6 = v11;
  shared_ptr<quasar::PSRAudioProcessor> v11 = (shared_ptr<quasar::PSRAudioProcessor>)0;
  cntrl = self->_audioProcessor.__cntrl_;
  self->_audioProcessor = v6;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    if (v11.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v11.__cntrl_);
    }
  }
  if (SHIBYTE(v10) < 0) {
    operator delete(__p);
  }
  [(EARPSRAudioProcessor *)self _startComputeTask];
}

- (void)_startComputeTask
{
  ptr = self->_audioProcessor.__ptr_;
  cntrl = self->_audioProcessor.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __41__EARPSRAudioProcessor__startComputeTask__block_invoke;
  block[3] = &unk_1F0A63D50;
  v7[1] = ptr;
  v8 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  objc_copyWeak(v7, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  objc_destroyWeak(&location);
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

void __41__EARPSRAudioProcessor__startComputeTask__block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 48) + 16) + 8))(*(void *)(*(void *)(a1 + 48) + 16));
  int v3 = quasar::PSRAudioProcessor::frameDurationMs(*(quasar::PSRAudioProcessor **)(a1 + 48));
  id location = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v27 = [WeakRetained delegate];

  v5 = [MEMORY[0x1E4F28F80] processInfo];
  [v5 systemUptime];
  double v7 = v6;

  v8 = 0;
  int v9 = 0;
  do
  {
    kaldi::Matrix<float>::Matrix((uint64_t)buf, *(unsigned int *)(*(void *)(a1 + 32) + 1600), v2, 0, 0);
    int v10 = quasar::PSRAudioProcessor::compute(*(void *)(a1 + 48), (uint64_t)buf);
    if ((int)kaldi::MatrixBase<float>::NumRows((uint64_t)buf) >= 1)
    {
      int v11 = kaldi::MatrixBase<float>::NumRows((uint64_t)buf);
      int v12 = kaldi::MatrixBase<float>::NumRows((uint64_t)buf);
      uint64_t v13 = *(void *)buf;
      int v14 = v29;
      kaldi::MatrixBase<float>::NumCols((uint64_t)buf);
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 + 4 * v14 * (v12 - 1) length:4 * (int)kaldi::MatrixBase<float>::NumCols((uint64_t)buf)];

      v16 = [MEMORY[0x1E4F28F80] processInfo];
      [v16 systemUptime];
      double v18 = v17;
      v9 += v11 * v3;

      if (v18 - v7 > 0.100000001) {
        int v19 = v10;
      }
      else {
        int v19 = 0;
      }
      if (v19 == 1)
      {
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", v18 - v7);
        [v20 systemUptime];
        double v7 = v21;

        if (objc_opt_respondsToSelector())
        {
          id v22 = objc_loadWeakRetained(location);
          [v27 psrAudioProcessor:v22 hasSpeakerVector:v15 speakerVectorSize:(int)kaldi::MatrixBase<float>::NumCols((uint64_t)buf) processedAudioDurationMs:v9];
        }
      }
      v8 = (void *)v15;
    }
    kaldi::Matrix<float>::~Matrix((uint64_t)buf);
  }
  while ((v10 & 1) != 0);
  if (objc_opt_respondsToSelector())
  {
    id v23 = objc_loadWeakRetained(location);
    [v27 psrAudioProcessor:v23 hasResult:v8 numElements:(int)v2];
  }
  if (objc_opt_respondsToSelector())
  {
    id v24 = objc_loadWeakRetained(location);
    [v27 psrAudioProcessor:v24 finishedWithFinalSpeakerVector:v8 speakerVectorSize:(int)v2 processedAudioDurationMs:v9];
  }
  uint64_t v25 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v25, OS_LOG_TYPE_DEFAULT, "ComputeTask done", buf, 2u);
  }
}

- (void)dealloc
{
  ptr = self->_audioProcessor.__ptr_;
  if (ptr) {
    (*(void (**)(void, SEL))(**(void **)ptr + 32))(*(void *)ptr, a2);
  }
  id v4 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v4, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)EARPSRAudioProcessor;
  [(EARPSRAudioProcessor *)&v5 dealloc];
}

- (NSString)configRoot
{
  return self->_configRoot;
}

- (void)setConfigRoot:(id)a3
{
}

- (EARPSRAudioProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EARPSRAudioProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configRoot, 0);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)&self->_sysConfig);
  cntrl = self->_audioProcessor.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  self->_audioProcessor.__ptr_ = 0;
  self->_audioProcessor.__cntrl_ = 0;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&self->_sysConfig);
  return self;
}

@end