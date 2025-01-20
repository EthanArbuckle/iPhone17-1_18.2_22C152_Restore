@interface EARCaesuraSilencePosteriorGenerator
+ (void)initialize;
- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3;
- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3 samplingRate:(unint64_t)a4;
- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3 samplingRate:(unint64_t)a4 queue:(id)a5;
- (EARCaesuraSilencePosteriorGeneratorDelegate)delegate;
- (id).cxx_construct;
- (int64_t)getFrameDurationMs;
- (void)_startComputeTask;
- (void)addAudio:(id)a3 numSamples:(unint64_t)a4;
- (void)dealloc;
- (void)endAudio;
- (void)resetForNewRequest;
- (void)setDelegate:(id)a3;
@end

@implementation EARCaesuraSilencePosteriorGenerator

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3
{
  return [(EARCaesuraSilencePosteriorGenerator *)self initWithConfigFile:a3 samplingRate:16000];
}

- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3 samplingRate:(unint64_t)a4
{
  v7 = dispatch_get_global_queue(2, 0);
  v8 = [(EARCaesuraSilencePosteriorGenerator *)self initWithConfigFile:a3 samplingRate:a4 queue:v7];

  return v8;
}

- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3 samplingRate:(unint64_t)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)EARCaesuraSilencePosteriorGenerator;
  v11 = [(EARCaesuraSilencePosteriorGenerator *)&v25 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_16;
  }
  p_configFile = (id *)&v11->_configFile;
  objc_storeStrong((id *)&v11->_configFile, a3);
  v12->_samplingRate = a4;
  objc_storeStrong((id *)&v12->_spgQueue, a5);
  v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v15 = [v14 fileExistsAtPath:*p_configFile];

  if ((v15 & 1) == 0)
  {
    v17 = EARLogger::QuasarOSLogger(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[EARCaesuraSilencePosteriorGenerator initWithConfigFile:samplingRate:queue:]((uint64_t *)&v12->_configFile, v17);
    }

    goto LABEL_17;
  }
  if (*p_configFile)
  {
    objc_msgSend(*p_configFile, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v23 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::SilencePosteriorGenerator,std::allocator<quasar::SilencePosteriorGenerator>,std::string,unsigned long &,void>((uint64_t)__p, (unsigned int *)&v12->_samplingRate, &v24);
  shared_ptr<quasar::SilencePosteriorGenerator> v18 = v24;
  shared_ptr<quasar::SilencePosteriorGenerator> v24 = (shared_ptr<quasar::SilencePosteriorGenerator>)0;
  cntrl = (std::__shared_weak_count *)v12->_silenceGenerator.__cntrl_;
  v12->_silenceGenerator = v18;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    if (v24.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v24.__cntrl_);
    }
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[0]);
  }
  if (!v12->_silenceGenerator.__ptr_)
  {
LABEL_17:
    v20 = 0;
    goto LABEL_18;
  }
  [(EARCaesuraSilencePosteriorGenerator *)v12 _startComputeTask];
LABEL_16:
  v20 = v12;
LABEL_18:

  return v20;
}

- (void)addAudio:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  (*(void (**)(void, uint64_t, unint64_t))(**((void **)self->_silenceGenerator.__ptr_ + 2) + 16))(*((void *)self->_silenceGenerator.__ptr_ + 2), [v6 bytes], a4);
}

- (int64_t)getFrameDurationMs
{
  return (int)quasar::SilencePosteriorGenerator::getFrameDurationMs((quasar::SilencePosteriorGenerator *)self->_silenceGenerator.__ptr_);
}

- (void)_startComputeTask
{
  ptr = self->_silenceGenerator.__ptr_;
  cntrl = self->_silenceGenerator.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  objc_initWeak(&location, self);
  spgQueue = self->_spgQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __56__EARCaesuraSilencePosteriorGenerator__startComputeTask__block_invoke;
  v6[3] = &unk_1F0A63CE0;
  v7[1] = ptr;
  v8 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  objc_copyWeak(v7, &location);
  dispatch_async(spgQueue, v6);
  objc_destroyWeak(v7);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  objc_destroyWeak(&location);
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

void __56__EARCaesuraSilencePosteriorGenerator__startComputeTask__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  v3 = (id *)(a1 + 32);
  v4 = sel_silenceDurationEstimateAvailable_numEstimates_clientProcessedAudioMs_;
  p_vtable = &OBJC_METACLASS___TextSequenceTrain.vtable;
  do
  {
    uint64_t v6 = mach_absolute_time();
    __p = 0;
    v36 = 0;
    uint64_t v37 = 0;
    char v7 = quasar::SilencePosteriorGenerator::estimateSilenceDuration(*(void *)(a1 + 40), (uint64_t)&__p);
    uint64_t v8 = mach_absolute_time();
    id v9 = objc_alloc((Class)(p_vtable + 507));
    double SilenceFramesCountMs = quasar::SilencePosteriorGenerator::getSilenceFramesCountMs(*(quasar::SilencePosteriorGenerator **)(a1 + 40));
    double SilenceProbability = quasar::SilencePosteriorGenerator::getSilenceProbability(*(quasar::SilencePosteriorGenerator **)(a1 + 40));
    double SilenceDurationMs = quasar::SilencePosteriorGenerator::getSilenceDurationMs(*(double ***)(a1 + 40));
    double SilencePosterior = quasar::SilencePosteriorGenerator::getSilencePosterior(*(quasar::SilencePosteriorGenerator **)(a1 + 40));
    v2 += v8 - v6;
    v14 = (void *)[v9 initWithSilenceFramesCountMs:v2 silenceProbability:SilenceFramesCountMs silenceDurationMs:SilenceProbability silencePosterior:SilenceDurationMs processedAudioMs:SilencePosterior inferenceTime:(double)quasar::SilencePosteriorGenerator::getProcessedAudioMs(*(quasar::SilencePosteriorGenerator **)(a1 + 40))];
    id WeakRetained = objc_loadWeakRetained(v3);
    v16 = [WeakRetained delegate];
    [v16 clientSilenceFeaturesAvailable:v14];

    id v17 = objc_loadWeakRetained(v3);
    shared_ptr<quasar::SilencePosteriorGenerator> v18 = [v17 delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      v34 = v14;
      char v20 = v7;
      v21 = v4;
      v22 = p_vtable;
      id v23 = objc_loadWeakRetained(v3);
      shared_ptr<quasar::SilencePosteriorGenerator> v24 = [v23 delegate];
      objc_super v25 = __p;
      v26 = v36;
      *(float *)&double v27 = (float)quasar::SilencePosteriorGenerator::getProcessedAudioMs(*(quasar::SilencePosteriorGenerator **)(a1 + 40));
      [v24 silenceDurationEstimateAvailable:v25 numEstimates:(v26 - v25) >> 2 clientProcessedAudioMs:v27];

      p_vtable = v22;
      v4 = v21;
      char v7 = v20;
      v14 = v34;
    }

    if (__p)
    {
      v36 = __p;
      operator delete(__p);
    }
  }
  while ((v7 & 1) != 0);
  id v28 = objc_loadWeakRetained(v3);
  v29 = [v28 delegate];
  char v30 = objc_opt_respondsToSelector();

  if (v30)
  {
    id v31 = objc_loadWeakRetained(v3);
    v32 = [v31 delegate];
    id v33 = objc_loadWeakRetained(v3);
    [v32 silencePosteriorGeneratorProcessorIsFinished:v33];
  }
}

- (void)resetForNewRequest
{
  ptr = self->_silenceGenerator.__ptr_;
  if (ptr) {
    (*(void (**)(void, SEL))(**((void **)ptr + 2) + 32))(*((void *)ptr + 2), a2);
  }
  configFile = self->_configFile;
  if (configFile)
  {
    [(NSString *)configFile ear_toString];
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v8 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::SilencePosteriorGenerator,std::allocator<quasar::SilencePosteriorGenerator>,std::string,unsigned long &,void>((uint64_t)__p, (unsigned int *)&self->_samplingRate, &v9);
  shared_ptr<quasar::SilencePosteriorGenerator> v5 = v9;
  shared_ptr<quasar::SilencePosteriorGenerator> v9 = (shared_ptr<quasar::SilencePosteriorGenerator>)0;
  cntrl = self->_silenceGenerator.__cntrl_;
  self->_silenceGenerator = v5;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    if (v9.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9.__cntrl_);
    }
  }
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
  [(EARCaesuraSilencePosteriorGenerator *)self _startComputeTask];
}

- (void)endAudio
{
}

- (void)dealloc
{
  ptr = self->_silenceGenerator.__ptr_;
  if (ptr) {
    (*(void (**)(void, SEL))(**((void **)ptr + 2) + 32))(*((void *)ptr + 2), a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)EARCaesuraSilencePosteriorGenerator;
  [(EARCaesuraSilencePosteriorGenerator *)&v4 dealloc];
}

- (EARCaesuraSilencePosteriorGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EARCaesuraSilencePosteriorGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spgQueue, 0);
  objc_storeStrong((id *)&self->_configFile, 0);
  cntrl = self->_silenceGenerator.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)initWithConfigFile:(uint64_t *)a1 samplingRate:(NSObject *)a2 queue:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "EARSPG: SilencePosteriorGenerator Config file does not exist at %@", (uint8_t *)&v3, 0xCu);
}

@end