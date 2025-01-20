@interface EARSyncPSRAudioProcessor
+ (void)initialize;
- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6;
- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7;
- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 maxBufferSizeSeconds:(int64_t)a8;
- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 maxBufferSizeSeconds:(int64_t)a8 memoryLock:(BOOL)a9 outputLastRowOnly:(BOOL)a10;
- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 outputLastRowOnly:(BOOL)a8;
- (EARSyncPSRAudioProcessorDelegate)delegate;
- (NSString)configRoot;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (id)getLatestSuperVector;
- (unint64_t)getAccmulatedProcessingTime;
- (unint64_t)getProcessedAudioDurationMs;
- (void)addAudio:(id)a3;
- (void)endAudio;
- (void)resetForNewRequest;
- (void)setConfigRoot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation EARSyncPSRAudioProcessor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.ear", "EARSyncPSRAudioProcessor");
    v3 = (void *)earPSRLog;
    earPSRLog = (uint64_t)v2;
  }
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6
{
  v11 = dispatch_get_global_queue(2, 0);
  v12 = [(EARSyncPSRAudioProcessor *)self initWithConfigFile:a3 configRoot:a4 sampleRate:a5 delegate:a6 queue:v11];

  return v12;
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7
{
  return [(EARSyncPSRAudioProcessor *)self initWithConfigFile:a3 configRoot:a4 sampleRate:a5 delegate:a6 queue:a7 maxBufferSizeSeconds:120];
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 outputLastRowOnly:(BOOL)a8
{
  BYTE1(v9) = a8;
  LOBYTE(v9) = 0;
  return -[EARSyncPSRAudioProcessor initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:memoryLock:outputLastRowOnly:](self, "initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:memoryLock:outputLastRowOnly:", a3, a4, a5, a6, a7, 120, v9);
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 maxBufferSizeSeconds:(int64_t)a8
{
  LOWORD(v9) = 0;
  return -[EARSyncPSRAudioProcessor initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:memoryLock:outputLastRowOnly:](self, "initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:memoryLock:outputLastRowOnly:", a3, a4, a5, a6, a7, a8, v9);
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 maxBufferSizeSeconds:(int64_t)a8 memoryLock:(BOOL)a9 outputLastRowOnly:(BOOL)a10
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  v36.receiver = self;
  v36.super_class = (Class)EARSyncPSRAudioProcessor;
  v20 = [(EARSyncPSRAudioProcessor *)&v36 init];
  v21 = v20;
  if (!v20) {
    goto LABEL_18;
  }
  v20->_sampleRate = a5;
  objc_storeStrong((id *)&v20->_configRoot, a4);
  objc_storeWeak((id *)&v21->_delegate, v18);
  objc_storeStrong((id *)&v21->_queue, a7);
  v21->_maxBufferSizeSeconds = a8;
  v21->_accumulatedProcessingTime = 0;
  v22 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v23 = [v22 fileExistsAtPath:v16];

  if (v23)
  {
    if (v16)
    {
      objc_msgSend(v16, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v35 = 0;
    }
    memset(v33, 0, sizeof(v33));
    *(_OWORD *)buf = 0u;
    long long v38 = 0u;
    int v39 = 1065353216;
    int JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v21->_sysConfig, (uint64_t)__p, v33, (uint64_t)buf, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
    *(void *)buf = v33;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (SHIBYTE(v35) < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(buf, "psr");
    quasar::SystemConfig::enforceMinVersion((uint64_t)&v21->_sysConfig, 62, 0, (uint64_t)buf);
    if (SBYTE7(v38) < 0) {
      operator delete(*(void **)buf);
    }
    if (JsonFile == 2)
    {
      uint64_t v29 = earPSRLog;
      if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "PSR: ERR: AudioProcessorPipeline created with incorrect version";
        v26 = v29;
        uint32_t v27 = 2;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    v21->_lastRowOutputOnly = a10;
    uint64_t ModelLoader = quasar::SystemConfig::getModelLoader((quasar::SystemConfig *)&v21->_sysConfig);
    quasar::ModelLoader::enableEmbeddedMlock(ModelLoader, a9);
LABEL_18:
    v30 = v21;
    goto LABEL_19;
  }
  uint64_t v24 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v16;
    v25 = "PSR: EARSyncAudioProcessor Config file does not exist at %@";
    v26 = v24;
    uint32_t v27 = 12;
LABEL_15:
    _os_log_impl(&dword_1B1A86000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
  }
LABEL_16:
  v30 = 0;
LABEL_19:

  return v30;
}

- (void)resetForNewRequest
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EARSyncPSRAudioProcessor_resetForNewRequest__block_invoke;
  block[3] = &unk_1E5FFE4B8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__EARSyncPSRAudioProcessor_resetForNewRequest__block_invoke(uint64_t a1)
{
  os_log_t v2 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_1B1A86000, v2, OS_LOG_TYPE_DEFAULT, "resetForNewRequest", (uint8_t *)__p, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(quasar::SyncPSRAudioProcessor **)(v3 + 8);
  if (!v4)
  {
    uint64_t v5 = v3 + 24;
    v6 = *(void **)(v3 + 1616);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v11 = 0;
    }
    std::allocate_shared[abi:ne180100]<quasar::SyncPSRAudioProcessor,std::allocator<quasar::SyncPSRAudioProcessor>,quasar::SystemConfig &,std::string,unsigned long &,BOOL &,long &,void>(v5, (uint64_t)__p, (unsigned int *)(v3 + 1568), (unsigned __int8 *)(v3 + 1600), (unsigned int *)(v3 + 1584), &v12);
    uint64_t v7 = *(void *)(a1 + 32);
    long long v8 = v12;
    long long v12 = 0uLL;
    uint64_t v9 = *(std::__shared_weak_count **)(v7 + 16);
    *(_OWORD *)(v7 + 8) = v8;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    if (*((void *)&v12 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
    }
    if (SHIBYTE(v11) < 0) {
      operator delete(__p[0]);
    }
    v4 = *(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8);
  }
  quasar::SyncPSRAudioProcessor::reset(v4);
  *(void *)(*(void *)(a1 + 32) + 1576) = 0;
  *(void *)(*(void *)(a1 + 32) + 1592) = 0;
}

- (void)addAudio:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__EARSyncPSRAudioProcessor_addAudio___block_invoke;
  v7[3] = &unk_1E5FFE528;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __37__EARSyncPSRAudioProcessor_addAudio___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = (const __int16 *)[*(id *)(a1 + 32) bytes];
  unint64_t v3 = (unint64_t)[*(id *)(a1 + 32) length] >> 1;
  uint64_t v4 = mach_absolute_time();
  quasar::SyncPSRAudioProcessor::addAudio(*(quasar::SyncRecogAudioBuffer ***)(*(void *)(a1 + 40) + 8), v2, v3, 0);
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 40) + 8), (uint64_t)v19);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v19))
  {
    int v5 = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 40) + 8));
    id v6 = _getNSDataForLastRowInMatrix((uint64_t)v19);
    uint64_t v7 = mach_absolute_time();
    id v8 = [MEMORY[0x1E4F28F80] processInfo];
    [v8 systemUptime];
    double v10 = v9;

    *(void *)(*(void *)(a1 + 40) + 1592) += v7 - v4;
    uint64_t v11 = *(void *)(a1 + 40);
    if (v10 - *(double *)(v11 + 1576) > 0.100000001)
    {
      *(double *)(v11 + 1576) = v10;
      long long v12 = *(void **)(a1 + 40);
      id v13 = objc_initWeak(&v18, v12);
      v14 = [v12 delegate];

      if (objc_opt_respondsToSelector())
      {
        id v15 = objc_loadWeakRetained(&v18);
        [v14 psrAudioProcessor:v15 hasSpeakerVector:v6 speakerVectorSize:(int)kaldi::MatrixBase<float>::NumCols((uint64_t)v19) processedAudioDurationMs:v5];
      }
      id v16 = earPSRLog;
      if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v21 = v3;
        __int16 v22 = 1024;
        int v23 = v5;
        _os_log_impl(&dword_1B1A86000, v16, OS_LOG_TYPE_DEFAULT, "Added %d samples, processed %d ms of audio so far", buf, 0xEu);
      }

      objc_destroyWeak(&v18);
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 40) + 1592) += mach_absolute_time() - v4;
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v19);
}

- (void)endAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EARSyncPSRAudioProcessor_endAudio__block_invoke;
  block[3] = &unk_1E5FFE4B8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__EARSyncPSRAudioProcessor_endAudio__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = mach_absolute_time();
  quasar::SyncPSRAudioProcessor::endAudio(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8));
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8), (uint64_t)v12);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v12))
  {
    int v3 = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8));
    uint64_t v4 = _getNSDataForLastRowInMatrix((uint64_t)v12);
    *(void *)(*(void *)(a1 + 32) + 1592) += mach_absolute_time() - v2;
    int v5 = *(void **)(a1 + 32);
    id v6 = objc_initWeak(&v11, v5);
    uint64_t v7 = [v5 delegate];

    if (objc_opt_respondsToSelector())
    {
      id v8 = objc_loadWeakRetained(&v11);
      [v7 psrAudioProcessor:v8 finishedWithFinalSpeakerVector:v4 speakerVectorSize:(int)kaldi::MatrixBase<float>::NumCols((uint64_t)v12) processedAudioDurationMs:v3];
    }
    double v9 = earPSRLog;
    if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v3;
      _os_log_impl(&dword_1B1A86000, v9, OS_LOG_TYPE_DEFAULT, "End audio: Processed %d ms of audio so far", buf, 8u);
    }

    objc_destroyWeak(&v11);
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 1592) += mach_absolute_time() - v2;
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v12);
}

- (id)getLatestSuperVector
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__14;
  double v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__EARSyncPSRAudioProcessor_getLatestSuperVector__block_invoke;
  v5[3] = &unk_1E5FFE198;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__EARSyncPSRAudioProcessor_getLatestSuperVector__block_invoke(uint64_t a1)
{
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8), (uint64_t)v6);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v6))
  {
    uint64_t v2 = _getNSDataForLastRowInMatrix((uint64_t)v6);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v6);
}

- (unint64_t)getProcessedAudioDurationMs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__EARSyncPSRAudioProcessor_getProcessedAudioDurationMs__block_invoke;
  v5[3] = &unk_1E5FFE550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__EARSyncPSRAudioProcessor_getProcessedAudioDurationMs__block_invoke(uint64_t a1)
{
  uint64_t result = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)result;
  return result;
}

- (unint64_t)getAccmulatedProcessingTime
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__EARSyncPSRAudioProcessor_getAccmulatedProcessingTime__block_invoke;
  v5[3] = &unk_1E5FFE550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__EARSyncPSRAudioProcessor_getAccmulatedProcessingTime__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1592);
  return result;
}

- (EARSyncPSRAudioProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EARSyncPSRAudioProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)configRoot
{
  return self->_configRoot;
}

- (void)setConfigRoot:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configRoot, 0);
  objc_destroyWeak((id *)&self->_delegate);
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