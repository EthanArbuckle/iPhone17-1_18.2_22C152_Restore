@interface EARAudioResultsGenerator
+ (void)initialize;
- (EARAudioResultsGenerator)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7;
- (EARAudioResultsGeneratorDelegate)delegate;
- (NSString)configRoot;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (id)audioResultLastVector;
- (id)audioResultMatrix;
- (void)addAudio:(id)a3;
- (void)endAudio;
- (void)resetForNewRequest;
- (void)setConfigRoot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation EARAudioResultsGenerator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.ear", "EARAudioResultsGenerator");
    v3 = (void *)earARGLog;
    earARGLog = (uint64_t)v2;
  }
}

- (EARAudioResultsGenerator)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v33.receiver = self;
  v33.super_class = (Class)EARAudioResultsGenerator;
  v16 = [(EARAudioResultsGenerator *)&v33 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_17;
  }
  v16->_sampleRate = a5;
  objc_storeStrong((id *)&v16->_configRoot, a4);
  objc_storeWeak((id *)&v17->_delegate, v14);
  objc_storeStrong((id *)&v17->_queue, a7);
  v17->_isAudioSessionLive = 0;
  uint64_t v18 = [MEMORY[0x1E4F1CA58] data];
  entireResultMatrix = v17->_entireResultMatrix;
  v17->_entireResultMatrix = (NSMutableData *)v18;

  v17->_sessionFrameCount = 0;
  *(_OWORD *)&v17->_globalNumVectors = 0u;
  v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v21 = [v20 fileExistsAtPath:v12];

  if (v21)
  {
    if (v12)
    {
      objc_msgSend(v12, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v32 = 0;
    }
    memset(v30, 0, sizeof(v30));
    *(_OWORD *)buf = 0u;
    long long v35 = 0u;
    int v36 = 1065353216;
    int JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v17->_sysConfig, (uint64_t)__p, v30, (uint64_t)buf, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
    *(void *)buf = v30;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (SHIBYTE(v32) < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(buf, "psr");
    quasar::SystemConfig::enforceMinVersion((uint64_t)&v17->_sysConfig, 62, 0, (uint64_t)buf);
    if (SBYTE7(v35) < 0) {
      operator delete(*(void **)buf);
    }
    if (JsonFile == 2)
    {
      uint64_t v27 = earARGLog;
      if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "ARG: ERR: AudioProcessorPipeline created with incorrect version";
        v24 = v27;
        uint32_t v25 = 2;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
LABEL_17:
    v28 = v17;
    goto LABEL_18;
  }
  uint64_t v22 = earARGLog;
  if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v12;
    v23 = "Config file does not exist at %{public}@";
    v24 = v22;
    uint32_t v25 = 12;
LABEL_15:
    _os_log_impl(&dword_1B1A86000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
  }
LABEL_16:
  v28 = 0;
LABEL_18:

  return v28;
}

- (void)resetForNewRequest
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EARAudioResultsGenerator_resetForNewRequest__block_invoke;
  block[3] = &unk_1E5FFE4B8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __46__EARAudioResultsGenerator_resetForNewRequest__block_invoke(uint64_t a1)
{
  os_log_t v2 = earARGLog;
  if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_1B1A86000, v2, OS_LOG_TYPE_DEFAULT, "Resetting audio result generator", (uint8_t *)__p, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(quasar::SyncPSRAudioProcessor **)(v3 + 8);
  if (!v4)
  {
    v5 = (quasar::SystemConfig *)(v3 + 24);
    v6 = *(void **)(v3 + 1624);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v12 = 0;
    }
    std::allocate_shared[abi:ne180100]<quasar::SyncPSRAudioProcessor,std::allocator<quasar::SyncPSRAudioProcessor>,quasar::SystemConfig &,std::string,unsigned long &,void>(v5, (uint64_t)__p, (int *)(v3 + 1568), &v13);
    uint64_t v7 = *(void *)(a1 + 32);
    long long v8 = v13;
    long long v13 = 0uLL;
    v9 = *(std::__shared_weak_count **)(v7 + 16);
    *(_OWORD *)(v7 + 8) = v8;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    if (*((void *)&v13 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v13 + 1));
    }
    if (SHIBYTE(v12) < 0) {
      operator delete(__p[0]);
    }
    v4 = *(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8);
  }
  quasar::SyncPSRAudioProcessor::reset(v4);
  *(unsigned char *)(*(void *)(a1 + 32) + 1576) = 0;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1584) setLength:0];
  *(void *)(*(void *)(a1 + 32) + 1592) = 0;
  *(void *)(*(void *)(a1 + 32) + 1600) = 0;
  *(void *)(*(void *)(a1 + 32) + 1608) = 0;
  return result;
}

- (id)audioResultMatrix
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__EARAudioResultsGenerator_audioResultMatrix__block_invoke;
  v6[3] = &unk_1E5FFFCB8;
  v6[4] = self;
  v6[5] = &v15;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(queue, v6);
  uint64_t v3 = [EARAudioResult alloc];
  v4 = [(EARAudioResult *)v3 initWithAudioResultMat:v16[5] vectorSize:v8[3] numVectors:v12[3]];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v4;
}

void __45__EARAudioResultsGenerator_audioResultMatrix__block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  if (*(void *)(v1 + 1592) && !*(unsigned char *)(v1 + 1576))
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(v1 + 1584));
    *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 1592);
    *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 1600);
    uint64_t v3 = earARGLog;
    if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 24);
      uint64_t v5 = *(void *)(*(void *)(a1[7] + 8) + 24);
      int v6 = 134218240;
      uint64_t v7 = v4;
      __int16 v8 = 2048;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1B1A86000, v3, OS_LOG_TYPE_DEFAULT, "Got valid result mat in sync fashion with numRows:%lu and numCols:%lu", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (id)audioResultLastVector
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__EARAudioResultsGenerator_audioResultLastVector__block_invoke;
  v6[3] = &unk_1E5FFFCB8;
  v6[4] = self;
  v6[5] = &v15;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(queue, v6);
  uint64_t v3 = [EARAudioResult alloc];
  uint64_t v4 = [(EARAudioResult *)v3 initWithAudioResultMat:v16[5] vectorSize:v8[3] numVectors:v12[3]];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v4;
}

uint64_t __49__EARAudioResultsGenerator_audioResultLastVector__block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(a1[4] + 8), (uint64_t)v8);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v8))
  {
    if (!*(unsigned char *)(a1[4] + 1576))
    {
      uint64_t v2 = _getNSDataForLastRowInMatrix((uint64_t)v8);
      uint64_t v3 = *(void *)(a1[5] + 8);
      uint64_t v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;

      *(void *)(*(void *)(a1[6] + 8) + 24) = 1;
      *(void *)(*(void *)(a1[7] + 8) + 24) = (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v8);
      uint64_t v5 = earARGLog;
      if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(*(void *)(a1[7] + 8) + 24);
        *(_DWORD *)buf = 134217984;
        uint64_t v10 = v6;
        _os_log_impl(&dword_1B1A86000, v5, OS_LOG_TYPE_DEFAULT, "Got valid result row in sync fashion with numCols:%lu", buf, 0xCu);
      }
    }
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v8);
}

- (void)addAudio:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__EARAudioResultsGenerator_addAudio___block_invoke;
  v7[3] = &unk_1E5FFE528;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __37__EARAudioResultsGenerator_addAudio___block_invoke(uint64_t a1)
{
  quasar::SyncPSRAudioProcessor::addAudio(*(quasar::SyncRecogAudioBuffer ***)(*(void *)(a1 + 40) + 8), (const __int16 *)[*(id *)(a1 + 32) bytes], (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >> 1, 0);
  *(unsigned char *)(*(void *)(a1 + 40) + 1576) = 1;
  int v2 = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 40)
                                                                                                 + 8));
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 40) + 8), (uint64_t)v16);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v16))
  {
    unint64_t v3 = v2 / 10;
    unint64_t v4 = *(void *)(*(void *)(a1 + 40) + 1608);
    if (v3 > v4)
    {
      uint64_t v5 = _getNSDataForLastNRowsInMatrix((uint64_t)v16, v3 - v4);
      [*(id *)(*(void *)(a1 + 40) + 1584) appendData:v5];
      *(void *)(*(void *)(a1 + 40) + 1592) = *(void *)(*(void *)(a1 + 40) + 1592)
                                                 + v3
                                                 - *(void *)(*(void *)(a1 + 40) + 1608);
      *(void *)(*(void *)(a1 + 40) + 1600) = (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v16);
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1616));
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [[EARAudioResult alloc] initWithAudioResultMat:v5 vectorSize:(int)kaldi::MatrixBase<float>::NumCols((uint64_t)v16) numVectors:v3 - *(void *)(*(void *)(a1 + 40) + 1608)];
        id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1616));
        [v9 hasEARAudioResultMatrix:v8];
      }
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1616));
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        uint64_t v12 = _getNSDataForLastRowInMatrix((uint64_t)v16);
        uint64_t v13 = [[EARAudioResult alloc] initWithAudioResultMat:v12 vectorSize:(int)kaldi::MatrixBase<float>::NumCols((uint64_t)v16) numVectors:1];
        id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1616));
        [v14 hasEARAudioResultLastVector:v13];
      }
      *(void *)(*(void *)(a1 + 40) + 1608) = v3;
    }
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v16);
}

- (void)endAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EARAudioResultsGenerator_endAudio__block_invoke;
  block[3] = &unk_1E5FFE4B8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__EARAudioResultsGenerator_endAudio__block_invoke(uint64_t a1)
{
  int v2 = earARGLog;
  if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1B1A86000, v2, OS_LOG_TYPE_DEFAULT, "Ending audio", v17, 2u);
  }
  quasar::SyncPSRAudioProcessor::endAudio(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 1576) = 0;
  int v3 = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32)
                                                                                                 + 8));
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(void *)(a1 + 32) + 8), (uint64_t)v17);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v17))
  {
    unint64_t v4 = v3 / 10;
    unint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1608);
    if (v4 > v5)
    {
      id v6 = _getNSDataForLastNRowsInMatrix((uint64_t)v17, v4 - v5);
      [*(id *)(*(void *)(a1 + 32) + 1584) appendData:v6];
      *(void *)(*(void *)(a1 + 32) + 1592) = *(void *)(*(void *)(a1 + 32) + 1592)
                                                 + v4
                                                 - *(void *)(*(void *)(a1 + 32) + 1608);
      *(void *)(*(void *)(a1 + 32) + 1600) = (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v17);
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1616));
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [[EARAudioResult alloc] initWithAudioResultMat:v6 vectorSize:(int)kaldi::MatrixBase<float>::NumCols((uint64_t)v17) numVectors:v4 - *(void *)(*(void *)(a1 + 32) + 1608)];
        id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1616));
        [v10 hasEARAudioResultMatrix:v9];
      }
      id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1616));
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        uint64_t v13 = _getNSDataForLastRowInMatrix((uint64_t)v17);
        id v14 = [[EARAudioResult alloc] initWithAudioResultMat:v13 vectorSize:(int)kaldi::MatrixBase<float>::NumCols((uint64_t)v17) numVectors:1];
        id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1616));
        [v15 hasEARAudioResultLastVector:v14];
      }
      *(void *)(*(void *)(a1 + 32) + 1608) = v4;
    }
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v17);
}

- (EARAudioResultsGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EARAudioResultsGeneratorDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_entireResultMatrix, 0);
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