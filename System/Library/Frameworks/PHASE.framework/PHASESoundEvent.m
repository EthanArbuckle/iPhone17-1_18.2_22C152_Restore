@interface PHASESoundEvent
+ (PHASESoundEvent)new;
- (AVAudioSession)audioSession;
- (BOOL)indefinite;
- (BOOL)internalPrepareActionTreeWithCompletionBlock:(id)a3;
- (BOOL)internalStartActionTreeWithCompletionBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndefinite;
- (BOOL)prepareAndReturnError:(id *)a3;
- (BOOL)seekToTime:(double)a3 completionBlock:(id)a4;
- (BOOL)seekToTime:(double)a3 completionHandler:(id)a4;
- (BOOL)startAndReturnError:(id *)a3;
- (BOOL)startWithCompletionBlock:(id)a3;
- (BOOL)startWithCompletionHandler:(id)a3;
- (BOOL)validateAudioSessionWithError:(id *)a3;
- (NSDictionary)metaParameters;
- (NSDictionary)mixers;
- (NSDictionary)pullStreamNodes;
- (NSDictionary)pushStreamNodes;
- (PHASERenderingState)renderingState;
- (PHASESoundEvent)init;
- (PHASESoundEvent)initWithEngine:(PHASEEngine *)engine assetIdentifier:(NSString *)assetIdentifier error:(NSError *)error;
- (PHASESoundEvent)initWithEngine:(PHASEEngine *)engine assetIdentifier:(NSString *)assetIdentifier mixerParameters:(PHASEMixerParameters *)mixerParameters error:(NSError *)error;
- (PHASESoundEvent)initWithEngine:(id)a3 assetIdentifier:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7;
- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 mixerParameters:(id)a5 outError:(id *)a6;
- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 outError:(id *)a5;
- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 source:(id)a5 listener:(id)a6 outError:(id *)a7;
- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 error:(id *)a5;
- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 mixerParameters:(id)a5 error:(id *)a6;
- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7;
- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 error:(id *)a5;
- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 mixerParameters:(id)a5 error:(id *)a6;
- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7;
- (PHASESoundEventPrepareState)prepareState;
- (id).cxx_construct;
- (id)description;
- (id)engine;
- (id)getActionTreeMetaParameterNames;
- (id)internalGetActionTreeMetaParameters;
- (id)internalGetActionTreeMixersWithMixerParameters:(id)a3 actionTreeAsset:(const void *)a4 outError:(id *)a5;
- (id)internalGetActionTreePullStreamNodes:(id)a3;
- (id)internalGetActionTreePushStreamNodes:(id)a3;
- (uint64_t)pause;
- (uint64_t)resume;
- (uint64_t)stopAndInvalidate;
- (unint64_t)hash;
- (unint64_t)ioStartHostTime;
- (unint64_t)preparedHostTime;
- (void)getActionTreeObject;
- (void)internalCleanup;
- (void)internalPrepareActionTreeWithCompletionBlock:(uint64_t)a3;
- (void)internalStartActionTreeWithCompletionBlock:(uint64_t)a3;
- (void)pause;
- (void)prepareWithCompletion:(void *)handler;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)prepareWithSessionIOBinding:(id)a3 completion:(id)a4;
- (void)registerTapSources;
- (void)resume;
- (void)seekToTime:(double)time completion:(void *)handler;
- (void)seekToTime:(uint64_t)a3 completion:(void *)(a4;
- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5;
- (void)setMetaParameter:(id)a3 value:(id)a4;
- (void)setPrepareState:(int64_t)a3;
- (void)setRenderingState:(int64_t)a3;
- (void)startWithCompletion:(void *)handler;
- (void)stopAndInvalidate;
- (void)unregisterTapSources;
@end

@implementation PHASESoundEvent

- (PHASESoundEvent)init
{
  return 0;
}

+ (PHASESoundEvent)new
{
  return 0;
}

- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 mixerParameters:(id)a5 error:(id *)a6
{
  v162[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v133 = a4;
  id v135 = a4;
  id v134 = a5;
  if (a6) {
    *a6 = 0;
  }
  v136 = a6;
  v137 = v10;
  v146.receiver = self;
  v146.super_class = (Class)PHASESoundEvent;
  v11 = [(PHASESoundEvent *)&v146 init];
  v12 = v11;
  if (!v11)
  {
    uint64_t v87 = *MEMORY[0x263F08320];
    uint64_t v149 = *MEMORY[0x263F08320];
    v88 = [NSString stringWithFormat:@"PHASESoundEventNodeAsset not registered"];
    v150 = v88;
    v138 = [NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];

    v90 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v89)
                                                                                        + 432)));
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      id v91 = [(PHASESoundEventNodeAsset *)v138 objectForKeyedSubscript:v87];
      uint64_t v92 = [v91 UTF8String];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "PHASESoundEvent.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 270;
      __int16 v152 = 2080;
      unint64_t v153 = v92;
      _os_log_impl(&dword_221E5E000, v90, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (!v136) {
      goto LABEL_89;
    }
    id v93 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925665 userInfo:v138];
    goto LABEL_72;
  }
  location = (id *)&v11->_engine;
  objc_storeWeak((id *)&v11->_engine, v10);
  v12->_startCalled = 0;
  v12->_renderingState = 0;
  v12->_prepareState = 0;
  audioSession = v12->_audioSession;
  v12->_audioSession = 0;

  if (!v10)
  {
    uint64_t v94 = *MEMORY[0x263F08320];
    uint64_t v161 = *MEMORY[0x263F08320];
    v95 = [NSString stringWithFormat:@"PHASE not initialized"];
    v162[0] = v95;
    v138 = [NSDictionary dictionaryWithObjects:v162 forKeys:&v161 count:1];

    v97 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v96)
                                                                                        + 432)));
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      id v98 = [(PHASESoundEventNodeAsset *)v138 objectForKeyedSubscript:v94];
      uint64_t v99 = [v98 UTF8String];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "PHASESoundEvent.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 144;
      __int16 v152 = 2080;
      unint64_t v153 = v99;
      _os_log_impl(&dword_221E5E000, v97, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (!v136) {
      goto LABEL_89;
    }
    id v93 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925669 userInfo:v138];
LABEL_72:
    v100 = 0;
    id *v136 = v93;
    goto LABEL_90;
  }
  uint64_t v14 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v10 implementation] + 48), 7);
  v15 = [v10 assetRegistry];
  v16 = [v135 assetIdentifier];
  v132 = (Phase::ActionTreeManager *)v14;
  v138 = [v15 assetForIdentifier:v16];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v101 = *MEMORY[0x263F08320];
    uint64_t v159 = *MEMORY[0x263F08320];
    v102 = [NSString stringWithFormat:@"SoundEventNodeAsset not registered"];
    v160 = v102;
    v103 = [NSDictionary dictionaryWithObjects:&v160 forKeys:&v159 count:1];

    v105 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v104)
                                                                                         + 432)));
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      id v106 = [v103 objectForKeyedSubscript:v101];
      uint64_t v107 = [v106 UTF8String];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "PHASESoundEvent.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 158;
      __int16 v152 = 2080;
      unint64_t v153 = v107;
      _os_log_impl(&dword_221E5E000, v105, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (v136)
    {
      id *v136 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925665 userInfo:v103];
    }

    goto LABEL_89;
  }
  Phase::ActionTreeManager::AllocateActionTreeObject(v138, v12, buf);
  shared_ptr<Phase::ActionTreeObject> v17 = *(shared_ptr<Phase::ActionTreeObject> *)buf;
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  cntrl = (std::__shared_weak_count *)v12->_actionTreeObject.__cntrl_;
  v12->_actionTreeObject = v17;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  uint64_t v19 = [(PHASESoundEvent *)v12 internalGetActionTreeMixersWithMixerParameters:v134 actionTreeAsset:*((void *)v12->_actionTreeObject.__ptr_ + 3) outError:v136];
  mixers = v12->_mixers;
  v12->_mixers = (NSDictionary *)v19;

  v21 = v12->_mixers;
  if (!v21)
  {
LABEL_89:
    v100 = 0;
    goto LABEL_90;
  }
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  v22 = [(NSDictionary *)v21 allValues];
  id obj = v22;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v142 objects:v158 count:16];
  if (!v23) {
    goto LABEL_61;
  }
  uint64_t v24 = *(void *)v143;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v143 != v24) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v142 + 1) + 8 * i);
      v27 = (std::__shared_weak_count *)v12->_actionTreeObject.__cntrl_;
      ptr = v12->_actionTreeObject.__ptr_;
      v141 = v27;
      if (v27) {
        atomic_fetch_add_explicit(&v27->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      [v26 setWeakActionTreeObject:&ptr];
      if (v141) {
        std::__shared_weak_count::__release_weak(v141);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v26;
        v29 = [v28 identifier];
        uint64_t StringHashId = Phase::GetStringHashId(v29, v30);

        v32 = v12->_actionTreeObject.__ptr_;
        v33 = [v28 source];
        uint64_t v34 = [v33 geoEntityHandle];
        uint64_t v35 = *((void *)v32 + 3);
        uint64_t v36 = *(unsigned int *)(v35 + 96);
        if (v36)
        {
          uint64_t v37 = 0;
          v38 = *(void **)(v35 + 104);
          uint64_t v39 = 96 * v36;
          while (*v38 != StringHashId)
          {
            v38 += 743;
            v37 += 96;
            if (v39 == v37) {
              goto LABEL_32;
            }
          }
          *(void *)(*((void *)v32 + 10) + v37 + 24) = v34;
        }
LABEL_32:

        v52 = v12->_actionTreeObject.__ptr_;
        v53 = [v28 listener];
        uint64_t v54 = [v53 geoEntityHandle];
        uint64_t v55 = *((void *)v52 + 3);
        uint64_t v56 = *(unsigned int *)(v55 + 96);
        if (v56)
        {
          uint64_t v57 = 0;
          v58 = *(void **)(v55 + 104);
          uint64_t v59 = 96 * v56;
          while (*v58 != StringHashId)
          {
            v58 += 743;
            v57 += 96;
            if (v59 == v57) {
              goto LABEL_38;
            }
          }
          *(void *)(*((void *)v52 + 10) + v57 + 32) = v54;
        }
LABEL_38:

        v60 = v12->_actionTreeObject.__ptr_;
        uint64_t v61 = [v28 sourceDirectivityModel];
        uint64_t v62 = *((void *)v60 + 3);
        uint64_t v63 = *(unsigned int *)(v62 + 96);
        if (v63)
        {
          uint64_t v64 = 0;
          v65 = *(void **)(v62 + 104);
          uint64_t v66 = 96 * v63;
          while (*v65 != StringHashId)
          {
            v65 += 743;
            v64 += 96;
            if (v66 == v64) {
              goto LABEL_44;
            }
          }
          *(void *)(*((void *)v60 + 10) + v64 + 40) = v61;
        }
LABEL_44:
        v67 = v12->_actionTreeObject.__ptr_;
        uint64_t v68 = [v28 listenerDirectivityModel];
        uint64_t v69 = *((void *)v67 + 3);
        uint64_t v70 = *(unsigned int *)(v69 + 96);
        if (v70)
        {
          uint64_t v71 = 0;
          v72 = *(void **)(v69 + 104);
          uint64_t v73 = 96 * v70;
          while (*v72 != StringHashId)
          {
            v72 += 743;
            v71 += 96;
            if (v73 == v71) {
              goto LABEL_50;
            }
          }
          *(void *)(*((void *)v67 + 10) + v71 + 48) = v68;
        }
LABEL_50:
        v74 = v12->_actionTreeObject.__ptr_;
        uint64_t v75 = [v28 distanceModel];
        uint64_t v76 = *((void *)v74 + 3);
        uint64_t v77 = *(unsigned int *)(v76 + 96);
        if (v77)
        {
          uint64_t v78 = 0;
          v79 = *(void **)(v76 + 104);
          uint64_t v80 = 96 * v77;
          while (*v79 != StringHashId)
          {
            v79 += 743;
            v78 += 96;
            if (v80 == v78) {
              goto LABEL_58;
            }
          }
          *(void *)(*((void *)v74 + 10) + v78 + 56) = v75;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        id v40 = v26;
        v41 = [v40 identifier];
        uint64_t v43 = Phase::GetStringHashId(v41, v42);

        v44 = v12->_actionTreeObject.__ptr_;
        v45 = [v40 listener];
        uint64_t v46 = [v45 geoEntityHandle];
        uint64_t v47 = *((void *)v44 + 3);
        uint64_t v48 = *(unsigned int *)(v47 + 96);
        if (v48)
        {
          uint64_t v49 = 0;
          v50 = *(void **)(v47 + 104);
          uint64_t v51 = 96 * v48;
          while (*v50 != v43)
          {
            v50 += 743;
            v49 += 96;
            if (v51 == v49) {
              goto LABEL_57;
            }
          }
          *(void *)(*((void *)v44 + 10) + v49 + 32) = v46;
        }
LABEL_57:

        uint64_t v81 = (uint64_t)v12->_actionTreeObject.__ptr_;
        [v40 orientation];
        *(_OWORD *)buf = v82;
        Phase::ActionTreeObject::SetAmbientOrientation(v81, v43, buf);
      }
LABEL_58:
    }
    v22 = obj;
    uint64_t v23 = [obj countByEnumeratingWithState:&v142 objects:v158 count:16];
  }
  while (v23);
LABEL_61:

  v83 = v12->_actionTreeObject.__ptr_;
  v84 = (std::__shared_weak_count *)v12->_actionTreeObject.__cntrl_;
  if (v84)
  {
    atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
    v85 = v132;
    if (*((int *)v132 + 4) > 0)
    {
      uint64_t v86 = **((void **)v132 + 1);
      atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_80;
    }
LABEL_91:
    v126 = **((id **)v85 + 3);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "Commandable.hpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 132;
      _os_log_impl(&dword_221E5E000, v126, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C380] + 16);
  }
  v85 = v132;
  if (*((int *)v132 + 4) <= 0) {
    goto LABEL_91;
  }
  uint64_t v86 = **((void **)v132 + 1);
LABEL_80:
  unint64_t v148 = 0;
  BOOL v147 = 1;
  v108 = (void *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v86, 48, &v148, &v147);
  if (!v108)
  {
    Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v129 = **(id **)(v86 + 48);
    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "CommandQueue.hpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 100;
      _os_log_impl(&dword_221E5E000, v129, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    v130 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v130, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v147)
  {
    v109 = **(id **)(v86 + 48);
    v85 = v132;
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "CommandQueue.hpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 89;
      __int16 v152 = 2048;
      unint64_t v153 = v148;
      __int16 v154 = 2048;
      uint64_t v155 = 48;
      _os_log_impl(&dword_221E5E000, v109, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  void *v108 = &unk_26D479398;
  v108[1] = v85;
  v108[2] = Phase::ActionTreeManager::RegisterActionTreeInstance;
  v108[3] = 0;
  v108[4] = v83;
  v108[5] = v84;
  Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v86, 48);
  atomic_store(0, (unsigned __int8 *)(v86 + 40));
  if (v84)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v84);
    std::__shared_weak_count::__release_shared[abi:ne180100](v84);
  }
  id WeakRetained = objc_loadWeakRetained(location);
  [WeakRetained addSoundEvent:v12];

  objc_storeStrong((id *)&v12->_protoType, v133);
  uint64_t v111 = [(PHASESoundEvent *)v12 internalGetActionTreeMetaParameters];
  metaParameters = v12->_metaParameters;
  v12->_metaParameters = (NSDictionary *)v111;

  uint64_t v113 = [(PHASESoundEvent *)v12 internalGetActionTreePushStreamNodes:v135];
  pushStreamNodes = v12->_pushStreamNodes;
  v12->_pushStreamNodes = (NSDictionary *)v113;

  uint64_t v115 = [(PHASESoundEvent *)v12 internalGetActionTreePullStreamNodes:v135];
  pullStreamNodes = v12->_pullStreamNodes;
  v12->_pullStreamNodes = (NSDictionary *)v115;

  v118 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v117)
                                                                                       + 432)));
  if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v119 = *(void *)v12->_actionTreeObject.__ptr_;
    id v120 = [(PHASEAsset *)v138 identifier];
    uint64_t v121 = [v120 UTF8String];
    v122 = [(PHASEAsset *)v138 identifier];
    uint64_t v124 = Phase::GetStringHashId(v122, v123);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "PHASESoundEvent.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 264;
    __int16 v152 = 2048;
    unint64_t v153 = v119;
    __int16 v154 = 2080;
    uint64_t v155 = v121;
    __int16 v156 = 2048;
    uint64_t v157 = v124;
    _os_log_impl(&dword_221E5E000, v118, OS_LOG_TYPE_DEFAULT, "%25s:%-5d (sound event: %llu) - initialized (asset: %s (%llu))", buf, 0x30u);
  }
  v100 = v12;
LABEL_90:

  return v100;
}

- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(PHASEMixerParameters);
  v11 = [(PHASESoundEvent *)self initWithEngine:v8 soundPrototype:v9 mixerParameters:v10 error:a5];

  return v11;
}

- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7
{
  uint64_t v23 = self;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_alloc_init(PHASEMixerParameters);
  [v11 mixerInformation];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v19, "mixerType", v23) == 1)
        {
          v20 = [v19 identifier];
          [(PHASEMixerParameters *)v14 addSpatialMixerParametersWithIdentifier:v20 source:v12 listener:v13];
        }
        else
        {
          if ([v19 mixerType] != 2) {
            continue;
          }
          v20 = [v19 identifier];
          [(PHASEMixerParameters *)v14 addAmbientMixerParametersWithIdentifier:v20 listener:v13];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  v21 = [(PHASESoundEvent *)v23 initWithEngine:v24 soundPrototype:v11 mixerParameters:v14 error:a7];
  return v21;
}

- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 mixerParameters:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [[PHASESoundPrototype alloc] initWithEngine:v10 actionTreeRootNode:v11 error:a6];
  uint64_t v14 = [(PHASESoundEvent *)self initWithEngine:v10 soundPrototype:v13 mixerParameters:v12 error:a6];

  return v14;
}

- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [[PHASESoundPrototype alloc] initWithEngine:v8 actionTreeRootNode:v9 error:a5];
  id v11 = [(PHASESoundEvent *)self initWithEngine:v8 soundPrototype:v10 error:a5];

  return v11;
}

- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [[PHASESoundPrototype alloc] initWithEngine:v12 actionTreeRootNode:v13 error:a7];
  uint64_t v17 = [(PHASESoundEvent *)self initWithEngine:v12 soundPrototype:v16 source:v14 listener:v15 error:a7];

  return v17;
}

- (PHASESoundEvent)initWithEngine:(PHASEEngine *)engine assetIdentifier:(NSString *)assetIdentifier mixerParameters:(PHASEMixerParameters *)mixerParameters error:(NSError *)error
{
  id v10 = engine;
  id v11 = assetIdentifier;
  id v12 = mixerParameters;
  id v13 = [[PHASESoundPrototype alloc] initWithEngine:v10 registeredActionTreeIdentifier:v11 error:error];
  id v14 = [(PHASESoundEvent *)self initWithEngine:v10 soundPrototype:v13 mixerParameters:v12 error:error];

  return v14;
}

- (PHASESoundEvent)initWithEngine:(PHASEEngine *)engine assetIdentifier:(NSString *)assetIdentifier error:(NSError *)error
{
  id v8 = engine;
  id v9 = assetIdentifier;
  id v10 = [[PHASESoundPrototype alloc] initWithEngine:v8 registeredActionTreeIdentifier:v9 error:error];
  id v11 = [(PHASESoundEvent *)self initWithEngine:v8 soundPrototype:v10 error:error];

  return v11;
}

- (PHASESoundEvent)initWithEngine:(id)a3 assetIdentifier:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [[PHASESoundPrototype alloc] initWithEngine:v12 registeredActionTreeIdentifier:v13 error:a7];
  uint64_t v17 = [(PHASESoundEvent *)self initWithEngine:v12 soundPrototype:v16 source:v14 listener:v15 error:a7];

  return v17;
}

- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 mixerParameters:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [a4 identifier];
  id v13 = [(PHASESoundEvent *)self initWithEngine:v10 assetIdentifier:v12 mixerParameters:v11 error:a6];

  return v13;
}

- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 identifier];
  id v10 = [(PHASESoundEvent *)self initWithEngine:v8 assetIdentifier:v9 error:a5];

  return v10;
}

- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 source:(id)a5 listener:(id)a6 outError:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = [a4 identifier];
  uint64_t v16 = [(PHASESoundEvent *)self initWithEngine:v12 registeredSoundEventNodeAssetUID:v15 source:v13 listener:v14 outError:a7];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    && (ptr = self->_actionTreeObject.__ptr_, v6 = (void *)v4[4], *(void *)ptr == *v6)
    && *((void *)ptr + 1) == v6[1];

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2 = 0;
  ptr = self->_actionTreeObject.__ptr_;
  unint64_t result = 0xCBF29CE484222325;
  do
    unint64_t result = 0x100000001B3 * (result ^ *((char *)ptr + v2++));
  while (v2 != 16);
  return result;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PHASESoundEvent_prepareWithCompletionHandler___block_invoke;
  v6[3] = &unk_2645F78E0;
  id v7 = v4;
  id v5 = v4;
  [(PHASESoundEvent *)self prepareWithCompletion:v6];
}

uint64_t __48__PHASESoundEvent_prepareWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)prepareWithCompletion:(void *)handler
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = handler;
  if ([(PHASESoundEvent *)self prepareState])
  {
    uint64_t v5 = *MEMORY[0x263F08320];
    uint64_t v26 = *MEMORY[0x263F08320];
    v6 = NSString;
    id v7 = [(PHASESoundPrototype *)self->_protoType assetIdentifier];
    id v8 = [v6 stringWithFormat:@"prepare called multiple times on %@ asset %@:", self, v7];
    v27[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];

    id v11 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v10)
                                                                                        + 432)));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v9 objectForKeyedSubscript:v5];
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = (PHASESoundEvent *)"PHASESoundEvent.mm";
      __int16 v24 = 1024;
      *(_DWORD *)long long v25 = 506;
      *(_WORD *)&v25[4] = 2080;
      *(void *)&v25[6] = [v12 UTF8String];
      _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else if ([(PHASESoundEvent *)self validateAudioSessionWithError:0])
  {
    Instance = (Phase::Logger *)Phase::Logger::GetInstance((Phase::Logger *)[(PHASESoundEvent *)self setPrepareState:1]);
    if (*((unsigned char *)Instance + 440))
    {
      id v14 = (Phase::Logger *)objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(Instance)
                                                                                               + 432)));
      uint64_t v15 = Phase::Logger::GetInstance(v14);
      os_signpost_id_t v16 = os_signpost_id_generate(**(os_log_t **)(v15 + 432));
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled((os_log_t)v14))
        {
          uint64_t v18 = *(void *)self->_actionTreeObject.__ptr_;
          int v19 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
          *(_DWORD *)buf = 134218496;
          uint64_t v23 = self;
          __int16 v24 = 2048;
          *(void *)long long v25 = v18;
          *(_WORD *)&v25[8] = 1024;
          *(_DWORD *)&v25[10] = v19;
          _os_signpost_emit_with_name_impl(&dword_221E5E000, (os_log_t)v14, OS_SIGNPOST_EVENT, v17, "Phase_SoundEvent_Prepare", "SoundEvent@%p: %llu Prepare Called on AudioSessionId 0x%x", buf, 0x1Cu);
        }
      }
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __41__PHASESoundEvent_prepareWithCompletion___block_invoke;
    v20[3] = &unk_2645F7908;
    v20[4] = self;
    v21 = v4;
    [(PHASESoundEvent *)self internalPrepareActionTreeWithCompletionBlock:v20];
  }
  else
  {
    if (v4) {
      v4[2](v4, 0);
    }
    [(PHASESoundEvent *)self stopAndInvalidate];
  }
}

void __41__PHASESoundEvent_prepareWithCompletion___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    [v5 setPrepareState:2];
    if (a2 == 1 && (a3 & 1) == 0) {
      [*(id *)(a1 + 32) registerTapSources];
    }
  }
  id v7 = *(Phase::Logger **)(a1 + 40);
  if (v7) {
    id v7 = (Phase::Logger *)(*((uint64_t (**)(Phase::Logger *, uint64_t))v7 + 2))(v7, a2);
  }
  id v8 = **(id **)(Phase::Logger::GetInstance(v7) + 432);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 136315906;
    id v11 = "PHASESoundEvent.mm";
    __int16 v12 = 1024;
    int v13 = 555;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ prepare completed with result: %ld", (uint8_t *)&v10, 0x26u);
  }
}

- (BOOL)prepareAndReturnError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  [(PHASESoundEvent *)self prepareWithCompletion:0];
  return 1;
}

- (void)startWithCompletion:(void *)handler
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = handler;
  uint64_t v5 = (void (**)(void, void))v4;
  if (self->_startCalled)
  {
    v6 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)v4)
                                                                                       + 432)));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(PHASESoundPrototype *)self->_protoType assetIdentifier];
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = (PHASESoundEvent *)"PHASESoundEvent.mm";
      __int16 v19 = 1024;
      *(_DWORD *)v20 = 584;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = self;
      __int16 v21 = 2080;
      uint64_t v22 = [v7 UTF8String];
      _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Start called multiple times for %@ with asset %s already", buf, 0x26u);
    }
    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    if (!self->_prepareState) {
      [(PHASESoundEvent *)self prepareWithCompletion:0];
    }
    self->_startCalled = 1;
    Instance = (Phase::Logger *)Phase::Logger::GetInstance((Phase::Logger *)[(PHASESoundEvent *)self setRenderingState:1]);
    if (*((unsigned char *)Instance + 440))
    {
      uint64_t v9 = (Phase::Logger *)objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(Instance)
                                                                                              + 432)));
      uint64_t v10 = Phase::Logger::GetInstance(v9);
      os_signpost_id_t v11 = os_signpost_id_generate(**(os_log_t **)(v10 + 432));
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled((os_log_t)v9))
        {
          uint64_t v13 = *(void *)self->_actionTreeObject.__ptr_;
          int v14 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
          *(_DWORD *)buf = 134218496;
          uint64_t v18 = self;
          __int16 v19 = 2048;
          *(void *)v20 = v13;
          *(_WORD *)&v20[8] = 1024;
          *(_DWORD *)&v20[10] = v14;
          _os_signpost_emit_with_name_impl(&dword_221E5E000, (os_log_t)v9, OS_SIGNPOST_EVENT, v12, "Phase_SoundEvent_Start", "SoundEvent@%p: %llu Start Called on AudioSessionId 0x%x", buf, 0x1Cu);
        }
      }
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__PHASESoundEvent_startWithCompletion___block_invoke;
    v15[3] = &unk_2645F7930;
    v15[4] = self;
    __int16 v16 = v5;
    [(PHASESoundEvent *)self internalStartActionTreeWithCompletionBlock:v15];
  }
}

void __39__PHASESoundEvent_startWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setRenderingState:0];
  id v4 = *(Phase::Logger **)(a1 + 40);
  if (v4) {
    id v4 = (Phase::Logger *)(*((uint64_t (**)(Phase::Logger *, uint64_t))v4 + 2))(v4, a2);
  }
  uint64_t v5 = **(id **)(Phase::Logger::GetInstance(v4) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315906;
    id v8 = "PHASESoundEvent.mm";
    __int16 v9 = 1024;
    int v10 = 620;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = a2;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ completed with result: %ld", (uint8_t *)&v7, 0x26u);
  }
}

- (BOOL)startAndReturnError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  [(PHASESoundEvent *)self startWithCompletion:0];
  return 1;
}

- (BOOL)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__PHASESoundEvent_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_2645F78E0;
  id v8 = v4;
  id v5 = v4;
  [(PHASESoundEvent *)self startWithCompletion:v7];

  return 1;
}

uint64_t __46__PHASESoundEvent_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)startWithCompletionBlock:(id)a3
{
  return 1;
}

- (void)prepareWithSessionIOBinding:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (Phase::Logger *)a4;
  id v8 = v7;
  audioSession = self->_audioSession;
  if (!audioSession
    || ([v6 session],
        int v10 = (AVAudioSession *)objc_claimAutoreleasedReturnValue(),
        v10,
        audioSession == v10))
  {
    __int16 v13 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v6 session];
      int v17 = 136315906;
      uint64_t v18 = "PHASESoundEvent.mm";
      __int16 v19 = 1024;
      int v20 = 666;
      __int16 v21 = 2112;
      uint64_t v22 = self;
      __int16 v23 = 1024;
      int v24 = [v14 opaqueSessionID];
      _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Preparing %@, associated with audio sessionId 0x%x", (uint8_t *)&v17, 0x22u);
    }
    uint64_t v15 = [v6 session];
    __int16 v16 = self->_audioSession;
    self->_audioSession = v15;

    [(PHASESoundEvent *)self prepareWithCompletion:v8];
  }
  else
  {
    __int16 v11 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
      int v17 = 136315906;
      uint64_t v18 = "PHASESoundEvent.mm";
      __int16 v19 = 1024;
      int v20 = 657;
      __int16 v21 = 2112;
      uint64_t v22 = self;
      __int16 v23 = 1024;
      int v24 = v12;
      _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %@ already assigned an audio sessionId 0x%x", (uint8_t *)&v17, 0x22u);
    }

    if (v8) {
      (*((void (**)(Phase::Logger *, void))v8 + 2))(v8, 0);
    }
  }
}

- (void)pause
{
}

- (void)resume
{
}

- (void)stopAndInvalidate
{
}

- (void)registerTapSources
{
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    id v20 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)p_engine);
    if ([v5 implementation])
    {
      id v6 = objc_loadWeakRetained((id *)p_engine);
      int v7 = *(unsigned __int8 *)([v6 implementation] + 528);

      if (!v7)
      {
        id v8 = objc_loadWeakRetained((id *)p_engine);
        uint64_t v9 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v8 implementation] + 48), 7);

        Phase::ActionTreeManager::GetAllValidSubmixIds(v9, *(void *)self->_actionTreeObject.__ptr_, *((void *)self->_actionTreeObject.__ptr_ + 1), (char **)&v21);
        p_submixIds = &self->_submixIds;
        begin = self->_submixIds.__begin_;
        if (begin)
        {
          self->_submixIds.__end_ = begin;
          operator delete(begin);
          p_submixIds->__begin_ = 0;
          self->_submixIds.__end_ = 0;
          self->_submixIds.__end_cap_.__value_ = 0;
        }
        int v12 = v21;
        self->_submixIds.__begin_ = v21;
        __int16 v13 = (UniqueObjectId *)v22;
        *(_OWORD *)&self->_submixIds.__end_ = v22;
        if (v12 != v13)
        {
          if (self->_prepareState != 2) {
            std::terminate();
          }
          id v14 = objc_loadWeakRetained((id *)p_engine);
          uint64_t v15 = [v14 implementation];
          __int16 v16 = (Phase::TapSourceRegistry *)Phase::Controller::TaskManager::GetService<Phase::TapSourceRegistry>(*(Phase::Logger **)(v15 + 96), *(void *)(v15 + 104));

          if (v16)
          {
            pid_t v17 = getpid();
            audioSession = self->_audioSession;
            p_cachedTapInfo = &self->_cachedTapInfo;
            Phase::TapSourceRegistry::CacheTapInfo(v16, v17, audioSession, p_cachedTapInfo);
            Phase::TapSourceRegistry::RegisterTapSource(v16, 0, p_submixIds, (void **)p_cachedTapInfo);
            Phase::TapSourceRegistry::RegisterTapSource(v16, 1, p_submixIds, (void **)p_cachedTapInfo);
          }
        }
      }
    }
    else
    {
    }
  }
}

- (void)unregisterTapSources
{
  p_submixIds = &self->_submixIds;
  if (self->_submixIds.__begin_ != self->_submixIds.__end_)
  {
    p_engine = &self->_engine;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    if (WeakRetained)
    {
      id v12 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)p_engine);
      if ([v6 implementation])
      {
        id v7 = objc_loadWeakRetained((id *)p_engine);
        int v8 = *(unsigned __int8 *)([v7 implementation] + 528);

        if (!v8)
        {
          id v13 = objc_loadWeakRetained((id *)p_engine);
          uint64_t v9 = [v13 implementation];
          int v10 = (Phase::Logger *)Phase::Controller::TaskManager::GetService<Phase::TapSourceRegistry>(*(Phase::Logger **)(v9 + 96), *(void *)(v9 + 104));

          if (v10)
          {
            p_cachedTapInfo = (void **)&self->_cachedTapInfo;
            Phase::TapSourceRegistry::UnregisterTapSource(v10, 0, p_submixIds, p_cachedTapInfo);
            Phase::TapSourceRegistry::UnregisterTapSource(v10, 1, p_submixIds, p_cachedTapInfo);
          }
        }
      }
      else
      {
      }
    }
  }
}

- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (*((unsigned char *)self->_actionTreeObject.__ptr_ + 144))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

    if (WeakRetained)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_engine);
      uint64_t v11 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v10 implementation] + 48), 7);

      ptr = self->_actionTreeObject.__ptr_;
      uint64_t v13 = *(void *)ptr;
      uint64_t v14 = *((void *)ptr + 1);
      uint64_t v15 = (unsigned char *)[v8 UTF8String];
      if (v15 && (unsigned int v16 = *v15, *v15))
      {
        pid_t v17 = v15 + 1;
        uint64_t v18 = 0xCBF29CE484222325;
        do
        {
          uint64_t v18 = 0x100000001B3 * (v18 ^ v16);
          unsigned int v19 = *v17++;
          unsigned int v16 = v19;
        }
        while (v19);
      }
      else
      {
        uint64_t v18 = 0;
      }
      uint64_t v20 = Phase::Commandable<128,Phase::LockFreeQueueMPSC>::CallAsync<Phase::ActionTreeManager,BOOL,Phase::UniqueObjectId,unsigned long long,Phase::InputMetaParamType,Phase::MetaParamValue,double>(v11, v13, v14, v18, 1, *(uint64_t *)&a4, a5);
      if ((v20 & 1) == 0)
      {
        __int16 v21 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v20) + 432);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136315650;
          __int16 v23 = "PHASESoundEvent.mm";
          __int16 v24 = 1024;
          int v25 = 825;
          __int16 v26 = 2112;
          long long v27 = self;
          _os_log_impl(&dword_221E5E000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %@ Command buffer full.  Unable to set MetaParameter.  Consider having fewer sound event API calls in a given frame", (uint8_t *)&v22, 0x1Cu);
        }
      }
    }
  }
}

- (void)setMetaParameter:(id)a3 value:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (*((unsigned char *)self->_actionTreeObject.__ptr_ + 144))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

    if (WeakRetained)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_engine);
      uint64_t v10 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v9 implementation] + 48), 7);

      uint64_t v11 = (unsigned char *)[v7 UTF8String];
      if (v11 && (unsigned int v12 = *v11, *v11))
      {
        uint64_t v13 = 0xCBF29CE484222325;
        uint64_t v14 = v11 + 1;
        do
        {
          uint64_t v13 = 0x100000001B3 * (v13 ^ v12);
          unsigned int v15 = *v14++;
          unsigned int v12 = v15;
        }
        while (v15);
      }
      else
      {
        uint64_t v13 = 0;
      }
      ptr = self->_actionTreeObject.__ptr_;
      uint64_t v17 = *(void *)ptr;
      uint64_t v18 = *((void *)ptr + 1);
      unsigned int v19 = (unsigned char *)[v6 UTF8String];
      if (v19 && (unsigned int v20 = *v19, *v19))
      {
        uint64_t v21 = 0xCBF29CE484222325;
        int v22 = v19 + 1;
        do
        {
          uint64_t v21 = 0x100000001B3 * (v21 ^ v20);
          unsigned int v23 = *v22++;
          unsigned int v20 = v23;
        }
        while (v23);
      }
      else
      {
        uint64_t v21 = 0;
      }
      uint64_t v24 = Phase::Commandable<128,Phase::LockFreeQueueMPSC>::CallAsync<Phase::ActionTreeManager,BOOL,Phase::UniqueObjectId,unsigned long long,Phase::InputMetaParamType,Phase::MetaParamValue,double>(v10, v17, v18, v21, 2, v13, 0.0);
      if ((v24 & 1) == 0)
      {
        int v25 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v24) + 432);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v26 = 136315650;
          long long v27 = "PHASESoundEvent.mm";
          __int16 v28 = 1024;
          int v29 = 846;
          __int16 v30 = 2112;
          v31 = self;
          _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %@ Command buffer full.  Unable to set MetaParameter.  Consider having fewer sound event API calls in a given frame", (uint8_t *)&v26, 0x1Cu);
        }
      }
    }
  }
}

- (PHASERenderingState)renderingState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained) {
    return self->_renderingState;
  }
  else {
    return 0;
  }
}

- (PHASESoundEventPrepareState)prepareState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained) {
    return self->_prepareState;
  }
  else {
    return 2;
  }
}

- (BOOL)indefinite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return WeakRetained && (uint64_t v4 = *((void *)self->_actionTreeObject.__ptr_ + 3)) != 0 && *(unsigned char *)(v4 + 112) == 0;
}

- (void)internalCleanup
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v4 = [(NSDictionary *)self->_mixers allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            if ([v9 sourceDirectivityModel])
            {
              uint64_t v10 = *(void *)([WeakRetained implementation] + 368);
              (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 312))(v10, [v9 sourceDirectivityModel]);
            }
            if ([v9 listenerDirectivityModel])
            {
              uint64_t v11 = *(void *)([WeakRetained implementation] + 368);
              (*(void (**)(uint64_t, uint64_t))(*(void *)v11 + 312))(v11, [v9 listenerDirectivityModel]);
            }
            if ([v9 distanceModel])
            {
              uint64_t v12 = *(void *)([WeakRetained implementation] + 368);
              (*(void (**)(uint64_t, uint64_t))(*(void *)v12 + 320))(v12, [v9 distanceModel]);
            }
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v5);
    }

    uint64_t v13 = [(PHASESoundEvent *)self renderingState];
    if (v13)
    {
      uint64_t v14 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                          + 432)));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)self->_actionTreeObject.__ptr_;
        PHASERenderingState v16 = [(PHASESoundEvent *)self renderingState];
        if ((unint64_t)v16 > PHASERenderingStatePaused) {
          uint64_t v17 = "<not found>";
        }
        else {
          uint64_t v17 = off_2645F79B8[v16];
        }
        *(_DWORD *)buf = 136315906;
        unsigned int v23 = "PHASESoundEvent.mm";
        __int16 v24 = 1024;
        int v25 = 930;
        __int16 v26 = 2048;
        uint64_t v27 = v15;
        __int16 v28 = 2080;
        int v29 = v17;
        _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d (sound event: %llu) - the sound event state should be stopped prior to its teardown. (rendering state: %s)", buf, 0x26u);
      }

      [(PHASESoundEvent *)self setRenderingState:0];
    }
    [(PHASESoundEvent *)self unregisterTapSources];
    [WeakRetained removeSoundEvent:self];
  }
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (BOOL)validateAudioSessionWithError:(id *)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v5 = self->_audioSession;
  if (a3) {
    *a3 = 0;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v6 = self->_mixers;
  uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (!v7)
  {
LABEL_21:

    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x263EF93E0] sharedInstance];
    }
    uint64_t v5 = v5;
    audioSession = self->_audioSession;
    self->_audioSession = v5;
    BOOL v22 = 1;
    goto LABEL_33;
  }
  v44 = a3;
  id obj = v6;
  uint64_t v8 = *(void *)v47;
LABEL_5:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v47 != v8) {
      objc_enumerationMutation(obj);
    }
    uint64_t v10 = [(NSDictionary *)self->_mixers objectForKey:*(void *)(*((void *)&v46 + 1) + 8 * v9)];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 source];
      uint64_t v12 = [v11 parent];

      if (v12) {
        break;
      }
    }
LABEL_19:

    if (++v9 == v7)
    {
      uint64_t v6 = obj;
      uint64_t v7 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v60 count:16];
      if (!v7) {
        goto LABEL_21;
      }
      goto LABEL_5;
    }
  }
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v13 = [v12 session];
    BOOL v14 = v13 == 0;

    if (v14) {
      goto LABEL_18;
    }
    if (v5) {
      break;
    }
    uint64_t v5 = [v12 session];
LABEL_18:
    uint64_t v20 = [v12 parent];

    uint64_t v12 = (void *)v20;
    if (!v20) {
      goto LABEL_19;
    }
  }
  uint64_t v15 = self->_audioSession;
  if (v15)
  {
    PHASERenderingState v16 = [v12 session];
    BOOL v17 = v15 == v16;

    if (!v17)
    {
      uint64_t v34 = *MEMORY[0x263F08320];
      uint64_t v58 = *MEMORY[0x263F08320];
      uint64_t v35 = NSString;
      uint64_t v36 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
      uint64_t v37 = [v12 session];
      v38 = objc_msgSend(v35, "stringWithFormat:", @"A PHASESoundEvent cannot prepare with a session IO binding (sessionID=%u) that disagrees with its PHASESource's root object's audio session (sessionID=%u)", v36, objc_msgSend(v37, "opaqueSessionID"));
      uint64_t v59 = v38;
      __int16 v28 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];

      id v40 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v39)
                                                                                          + 432)));
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        id v41 = [v28 objectForKeyedSubscript:v34];
        uint64_t v42 = [v41 UTF8String];
        *(_DWORD *)buf = 136315650;
        v53 = "PHASESoundEvent.mm";
        __int16 v54 = 1024;
        int v55 = 993;
        __int16 v56 = 2080;
        uint64_t v57 = v42;
        _os_log_impl(&dword_221E5E000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
      }
      if (v44) {
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  long long v18 = [v12 session];
  BOOL v19 = v5 == v18;

  if (v19) {
    goto LABEL_18;
  }
  uint64_t v23 = *MEMORY[0x263F08320];
  uint64_t v50 = *MEMORY[0x263F08320];
  __int16 v24 = NSString;
  uint64_t v25 = [(AVAudioSession *)v5 opaqueSessionID];
  __int16 v26 = [v12 session];
  uint64_t v27 = objc_msgSend(v24, "stringWithFormat:", @"A PHASESoundEvent cannot have multiple PHASESources with different session root objects (sessionIDs %u and %u)", v25, objc_msgSend(v26, "opaqueSessionID"));
  uint64_t v51 = v27;
  __int16 v28 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];

  __int16 v30 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v29)
                                                                                      + 432)));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    id v32 = [v28 objectForKeyedSubscript:v23];
    uint64_t v33 = [v32 UTF8String];
    *(_DWORD *)buf = 136315650;
    v53 = "PHASESoundEvent.mm";
    __int16 v54 = 1024;
    int v55 = 1012;
    __int16 v56 = 2080;
    uint64_t v57 = v33;
    _os_log_impl(&dword_221E5E000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
  }
  if (v44)
  {
LABEL_31:
    id *v44 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925668 userInfo:v28];
  }
LABEL_32:

  BOOL v22 = 0;
  audioSession = (AVAudioSession *)obj;
LABEL_33:

  return v22;
}

- (BOOL)internalPrepareActionTreeWithCompletionBlock:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    audioSession = self->_audioSession;
    if (!audioSession) {
      std::terminate();
    }
    *((_DWORD *)self->_actionTreeObject.__ptr_ + 81) = [(AVAudioSession *)audioSession opaqueSessionID];
    *(void *)uint64_t v33 = 0;
    *(void *)&v33[8] = v33;
    *(void *)&v33[16] = 0x3032000000;
    *(void *)&v33[24] = __Block_byref_object_copy__0;
    uint64_t v34 = __Block_byref_object_dispose__0;
    id v35 = (id)[v4 copy];
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = &self->_preparedHostTime;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PHASESoundEvent_internalPrepareActionTreeWithCompletionBlock___block_invoke;
    aBlock[3] = &unk_2645F7958;
    aBlock[4] = v30;
    aBlock[5] = v33;
    uint64_t v7 = _Block_copy(aBlock);
    id v8 = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v9 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v8 implementation] + 48), 7);

    long long v28 = *(_OWORD *)self->_actionTreeObject.__ptr_;
    uint64_t v10 = _Block_copy(v7);
    if (*(int *)(v9 + 16) <= 0)
    {
      uint64_t v23 = **(id **)(v9 + 24);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v39 = "Commandable.hpp";
        __int16 v40 = 1024;
        int v41 = 132;
        _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.", buf, 0x12u);
      }
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.");
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C380] + 16);
    }
    uint64_t v11 = v10;
    uint64_t v12 = **(void **)(v9 + 8);
    unint64_t v32 = 0;
    BOOL v31 = 1;
    uint64_t v13 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v12, 64, &v32, &v31);
    if (!v13)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      __int16 v26 = **(id **)(v12 + 48);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v39 = "CommandQueue.hpp";
        __int16 v40 = 1024;
        int v41 = 100;
        _os_log_impl(&dword_221E5E000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      uint64_t v27 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v27, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v31)
    {
      BOOL v14 = **(id **)(v12 + 48);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = "CommandQueue.hpp";
        __int16 v40 = 1024;
        int v41 = 89;
        __int16 v42 = 2048;
        unint64_t v43 = v32;
        __int16 v44 = 2048;
        uint64_t v45 = 64;
        _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)uint64_t v13 = &unk_26D479460;
    *(void *)(v13 + 8) = v9;
    *(void *)(v13 + 16) = Phase::ActionTreeManager::PrepareActionTree;
    *(void *)(v13 + 24) = 0;
    *(_OWORD *)(v13 + 32) = v28;
    *(void *)(v13 + 48) = -[PHASESoundEvent internalPrepareActionTreeWithCompletionBlock:]::$_3::__invoke;
    *(void *)(v13 + 56) = v11;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v12, 64);
    atomic_store(0, (unsigned __int8 *)(v12 + 40));
    BOOL v15 = 1;

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v33, 8);
  }
  else
  {
    uint64_t v16 = *MEMORY[0x263F08320];
    uint64_t v36 = *MEMORY[0x263F08320];
    BOOL v17 = [NSString stringWithFormat:@"PHASE not initialized"];
    uint64_t v37 = v17;
    long long v18 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

    uint64_t v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v19)
                                                                                        + 432)));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = [v18 objectForKeyedSubscript:v16];
      *(_DWORD *)uint64_t v33 = 136315650;
      *(void *)&v33[4] = "PHASESoundEvent.mm";
      *(_WORD *)&v33[12] = 1024;
      *(_DWORD *)&v33[14] = 1049;
      *(_WORD *)&v33[18] = 2080;
      *(void *)&v33[20] = [v21 UTF8String];
      _os_log_impl(&dword_221E5E000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", v33, 0x1Cu);
    }
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0, 1);

    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __64__PHASESoundEvent_internalPrepareActionTreeWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

- (BOOL)internalStartActionTreeWithCompletionBlock:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    *(void *)unint64_t v32 = 0;
    *(void *)&v32[8] = v32;
    *(void *)&v32[16] = 0x3032000000;
    *(void *)&v32[24] = __Block_byref_object_copy__0;
    uint64_t v33 = __Block_byref_object_dispose__0;
    id v34 = (id)[v4 copy];
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = &self->_ioStartHostTime;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PHASESoundEvent_internalStartActionTreeWithCompletionBlock___block_invoke;
    aBlock[3] = &unk_2645F7980;
    aBlock[4] = v29;
    aBlock[5] = v32;
    uint64_t v6 = _Block_copy(aBlock);
    id v7 = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v8 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v7 implementation] + 48), 7);

    long long v27 = *(_OWORD *)self->_actionTreeObject.__ptr_;
    uint64_t v9 = _Block_copy(v6);
    if (*(int *)(v8 + 16) <= 0)
    {
      BOOL v22 = **(id **)(v8 + 24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "Commandable.hpp";
        __int16 v39 = 1024;
        int v40 = 132;
        _os_log_impl(&dword_221E5E000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.", buf, 0x12u);
      }
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.");
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C380] + 16);
    }
    uint64_t v10 = v9;
    uint64_t v11 = **(void **)(v8 + 8);
    unint64_t v31 = 0;
    BOOL v30 = 1;
    uint64_t v12 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v11, 64, &v31, &v30);
    if (!v12)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      uint64_t v25 = **(id **)(v11 + 48);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "CommandQueue.hpp";
        __int16 v39 = 1024;
        int v40 = 100;
        _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      __int16 v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v26, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v30)
    {
      uint64_t v13 = **(id **)(v11 + 48);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v38 = "CommandQueue.hpp";
        __int16 v39 = 1024;
        int v40 = 89;
        __int16 v41 = 2048;
        unint64_t v42 = v31;
        __int16 v43 = 2048;
        uint64_t v44 = 64;
        _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)uint64_t v12 = &unk_26D479488;
    *(void *)(v12 + 8) = v8;
    *(void *)(v12 + 16) = Phase::ActionTreeManager::StartActionTree;
    *(void *)(v12 + 24) = 0;
    *(_OWORD *)(v12 + 32) = v27;
    *(void *)(v12 + 48) = -[PHASESoundEvent internalStartActionTreeWithCompletionBlock:]::$_4::__invoke;
    *(void *)(v12 + 56) = v10;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v11, 64);
    atomic_store(0, (unsigned __int8 *)(v11 + 40));
    BOOL v14 = 1;

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    uint64_t v15 = *MEMORY[0x263F08320];
    uint64_t v35 = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithFormat:@"PHASE not initialized"];
    uint64_t v36 = v16;
    BOOL v17 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

    BOOL v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                        + 432)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v17 objectForKeyedSubscript:v15];
      *(_DWORD *)unint64_t v32 = 136315650;
      *(void *)&v32[4] = "PHASESoundEvent.mm";
      *(_WORD *)&v32[12] = 1024;
      *(_DWORD *)&v32[14] = 1106;
      *(_WORD *)&v32[18] = 2080;
      *(void *)&v32[20] = [v20 UTF8String];
      _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", v32, 0x1Cu);
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);

    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __62__PHASESoundEvent_internalStartActionTreeWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *a2;
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

- (id)getActionTreeMetaParameterNames
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = [WeakRetained assetRegistry];

  uint64_t v6 = *((void *)self->_actionTreeObject.__ptr_ + 3);
  if (*(_DWORD *)(v6 + 64))
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v5 getString:*(void *)(*(void *)(v6 + 72) + v7)];
      if (v9)
      {
        uint64_t v10 = [NSString stringWithUTF8String:v9];
        [v3 addObject:v10];
      }
      ++v8;
      uint64_t v6 = *((void *)self->_actionTreeObject.__ptr_ + 3);
      v7 += 464;
    }
    while (v8 < *(unsigned int *)(v6 + 64));
  }

  return v3;
}

- (id)internalGetActionTreeMetaParameters
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = [WeakRetained assetRegistry];

  uint64_t v6 = *((void *)self->_actionTreeObject.__ptr_ + 3);
  if (*(_DWORD *)(v6 + 64))
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v5 getStringEmpty:*(void *)(*(void *)(v6 + 72) + v7)];
      ptr = self->_actionTreeObject.__ptr_;
      if (!v9) {
        goto LABEL_16;
      }
      uint64_t v11 = *(void *)(*((void *)ptr + 3) + 72);
      if (*(_DWORD *)(v11 + v7 + 8) != 1) {
        goto LABEL_16;
      }
      int v12 = *(_DWORD *)(v11 + v7 + 12);
      if (v12 == 2) {
        break;
      }
      if (v12 == 1)
      {
        uint64_t v13 = [PHASENumberMetaParameter alloc];
        BOOL v14 = [NSString stringWithUTF8String:v9];
        uint64_t v15 = [(PHASENumberMetaParameter *)v13 initWithUID:v14 value:self rangeMin:*(double *)(v11 + v7 + 48) rangeMax:*(double *)(v11 + v7 + 32) delegate:*(double *)(v11 + v7 + 40)];

        uint64_t v16 = v15;
        BOOL v17 = [(PHASEMetaParameter *)v16 identifier];
        [v3 setObject:v16 forKeyedSubscript:v17];
LABEL_15:

        ptr = self->_actionTreeObject.__ptr_;
      }
LABEL_16:
      ++v8;
      uint64_t v6 = *((void *)ptr + 3);
      v7 += 464;
      if (v8 >= *(unsigned int *)(v6 + 64)) {
        goto LABEL_17;
      }
    }
    if (*(void *)(v11 + v7 + 48)) {
      long long v18 = (const char *)objc_msgSend(v5, "getStringEmpty:");
    }
    else {
      long long v18 = "";
    }
    if (v18) {
      BOOL v19 = v18;
    }
    else {
      BOOL v19 = "";
    }
    id v20 = [PHASEStringMetaParameter alloc];
    id v21 = [NSString stringWithUTF8String:v9];
    BOOL v22 = [NSString stringWithUTF8String:v19];
    uint64_t v23 = [(PHASEStringMetaParameter *)v20 initWithUID:v21 value:v22 delegate:self];

    uint64_t v16 = v23;
    BOOL v17 = [(PHASEMetaParameter *)v16 identifier];
    [v3 setObject:v16 forKeyedSubscript:v17];
    goto LABEL_15;
  }
LABEL_17:
  __int16 v24 = [NSDictionary dictionaryWithDictionary:v3];

  return v24;
}

- (id)internalGetActionTreeMixersWithMixerParameters:(id)a3 actionTreeAsset:(const void *)a4 outError:(id *)a5
{
  v188[1] = *MEMORY[0x263EF8340];
  id v145 = a3;
  v151 = [v145 parameterDictionary];
  if (a5) {
    *a5 = 0;
  }
  long long v144 = a5;
  if (v145 && [v151 count] || (uint64_t v7 = *((unsigned int *)a4 + 24), !v7))
  {
LABEL_9:
    v150 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v151, "count"));
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    uint64_t v9 = [v151 allKeys];
    uint64_t v149 = v9;
    uint64_t v147 = [v9 countByEnumeratingWithState:&v156 objects:v180 count:16];
    if (v147)
    {
      uint64_t v148 = *(void *)v157;
      location = (id *)&self->_engine;
      while (2)
      {
        for (uint64_t i = 0; i != v147; ++i)
        {
          if (*(void *)v157 != v148) {
            objc_enumerationMutation(v9);
          }
          uint64_t v10 = *(Phase **)(*((void *)&v156 + 1) + 8 * i);
          uint64_t v11 = [v151 objectForKeyedSubscript:v10];
          __int16 v154 = v11;
          uint64_t v12 = [v11 mixerType];
          if (v12 == 1)
          {
            long long v28 = [v11 source];
            if (!v28
              || ([v11 listener],
                  int v29 = objc_claimAutoreleasedReturnValue(),
                  BOOL v30 = v29 == 0,
                  v29,
                  v28,
                  v30))
            {
              uint64_t v88 = *MEMORY[0x263F08320];
              uint64_t v178 = *MEMORY[0x263F08320];
              v89 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: Sound instance spatial mixer dictionary not complete for mixer %@", v10];
              v179 = v89;
              v90 = [NSDictionary dictionaryWithObjects:&v179 forKeys:&v178 count:1];

              uint64_t v92 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v91)
                                                                                                  + 432)));
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                id v93 = [v90 objectForKeyedSubscript:v88];
                uint64_t v94 = [v93 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1285;
                __int16 v185 = 2080;
                uint64_t v186 = v94;
                _os_log_impl(&dword_221E5E000, v92, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144)
              {
LABEL_104:
                *long long v144 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925668 userInfo:v90];
              }
LABEL_105:

              uint64_t v81 = 0;
              uint64_t v73 = v154;
              goto LABEL_106;
            }
            unint64_t v31 = [v154 listener];
            id v32 = [v31 engine];
            id WeakRetained = objc_loadWeakRetained(location);
            BOOL v34 = v32 == WeakRetained;

            if (!v34)
            {
              uint64_t v113 = *MEMORY[0x263F08320];
              uint64_t v176 = *MEMORY[0x263F08320];
              v114 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: PHASEListener on mixer %@ is from a different engine instance", v10];
              v177 = v114;
              v90 = [NSDictionary dictionaryWithObjects:&v177 forKeys:&v176 count:1];

              v116 = **(id **)(Phase::Logger::GetInstance(v115) + 432);
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
              {
                id v117 = [v90 objectForKeyedSubscript:v113];
                uint64_t v118 = [v117 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1300;
                __int16 v185 = 2080;
                uint64_t v186 = v118;
                _os_log_impl(&dword_221E5E000, v116, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144) {
                goto LABEL_104;
              }
              goto LABEL_105;
            }
            uint64_t v35 = [v154 source];
            id v36 = [v35 engine];
            id v37 = objc_loadWeakRetained(location);
            BOOL v38 = v36 == v37;

            if (!v38)
            {
              uint64_t v125 = *MEMORY[0x263F08320];
              uint64_t v174 = *MEMORY[0x263F08320];
              v126 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: PHASESource on mixer %@ is from a different engine instance", v10];
              v175 = v126;
              v90 = [NSDictionary dictionaryWithObjects:&v175 forKeys:&v174 count:1];

              v128 = **(id **)(Phase::Logger::GetInstance(v127) + 432);
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                id v129 = [v90 objectForKeyedSubscript:v125];
                uint64_t v130 = [v129 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1315;
                __int16 v185 = 2080;
                uint64_t v186 = v130;
                _os_log_impl(&dword_221E5E000, v128, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144) {
                goto LABEL_104;
              }
              goto LABEL_105;
            }
            __int16 v39 = [v154 source];
            char v40 = [v39 isConnectedToRoot];

            if ((v40 & 1) == 0)
            {
              uint64_t v131 = *MEMORY[0x263F08320];
              uint64_t v172 = *MEMORY[0x263F08320];
              v132 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: PHASESource on mixer %@ is not connected to the scene", v10];
              v173 = v132;
              v90 = [NSDictionary dictionaryWithObjects:&v173 forKeys:&v172 count:1];

              id v134 = **(id **)(Phase::Logger::GetInstance(v133) + 432);
              if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
              {
                id v135 = [v90 objectForKeyedSubscript:v131];
                uint64_t v136 = [v135 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1330;
                __int16 v185 = 2080;
                uint64_t v186 = v136;
                _os_log_impl(&dword_221E5E000, v134, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144) {
                goto LABEL_104;
              }
              goto LABEL_105;
            }
            __int16 v41 = [v154 listener];
            int v42 = [v41 isConnectedToRoot];

            if (!v42)
            {
              uint64_t v137 = *MEMORY[0x263F08320];
              uint64_t v170 = *MEMORY[0x263F08320];
              v138 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: PHASEListener on mixer %@ is not connected to the scene", v10];
              v171 = v138;
              v90 = [NSDictionary dictionaryWithObjects:&v171 forKeys:&v170 count:1];

              v140 = **(id **)(Phase::Logger::GetInstance(v139) + 432);
              if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
              {
                id v141 = [v90 objectForKeyedSubscript:v137];
                uint64_t v142 = [v141 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1345;
                __int16 v185 = 2080;
                uint64_t v186 = v142;
                _os_log_impl(&dword_221E5E000, v140, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144) {
                goto LABEL_104;
              }
              goto LABEL_105;
            }
            if (*((_DWORD *)a4 + 24))
            {
              unint64_t v44 = 0;
              uint64_t v45 = 0;
              uint64_t v46 = 0;
              uint64_t v47 = 0;
              uint64_t v48 = 1456;
              do
              {
                uint64_t v49 = *((void *)a4 + 13);
                if (*(void *)(v49 + v48 - 1448) == 1)
                {
                  uint64_t v50 = *(void *)(v49 + v48 - 1456);
                  if (v50 == Phase::GetStringHashId(v10, v43))
                  {
                    uint64_t v51 = (unsigned char *)(v49 + v48);
                    if (*v51)
                    {
                      id v52 = objc_loadWeakRetained(location);
                      uint64_t v53 = [v52 implementation];
                      uint64_t v45 = (*(uint64_t (**)(void, unsigned char *, void))(**(void **)(v53 + 368) + 48))(*(void *)(v53 + 368), v51, 0);
                    }
                    if (*(v51 - 1008))
                    {
                      id v54 = objc_loadWeakRetained(location);
                      uint64_t v55 = [v54 implementation];
                      uint64_t v47 = (*(uint64_t (**)(void, unsigned char *, uint64_t))(**(void **)(v55 + 368) + 48))(*(void *)(v55 + 368), v51 - 1008, 1);
                    }
                    __int16 v56 = v51 - 1424;
                    if (*(v51 - 1424))
                    {
                      id v57 = objc_loadWeakRetained(location);
                      uint64_t v58 = [v57 implementation];
                      uint64_t v46 = (*(uint64_t (**)(void, unsigned char *))(**(void **)(v58 + 368) + 56))(*(void *)(v58 + 368), v56);
                    }
                  }
                }
                ++v44;
                v48 += 5944;
              }
              while (v44 < *((unsigned int *)a4 + 24));
            }
            else
            {
              uint64_t v47 = 0;
              uint64_t v46 = 0;
              uint64_t v45 = 0;
            }
            uint64_t v63 = [PHASESpatialMixer alloc];
            id v64 = objc_alloc_init(MEMORY[0x263EFF8C0]);
            v65 = [v154 source];
            uint64_t v66 = [v154 listener];
            __int16 v24 = [(PHASESpatialMixer *)v63 initWithIdentifier:v10 spatialModelerSends:v64 source:v65 listener:v66 sourceDirectivityModel:v45 listenerDirectivityModel:v47 distanceModel:v46];

            [v150 setObject:v24 forKey:v10];
          }
          else
          {
            if (v12 != 2)
            {
              uint64_t v95 = *MEMORY[0x263F08320];
              uint64_t v162 = *MEMORY[0x263F08320];
              v96 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: Sound instance invalid spatial mixer type for mixer %@", v10];
              v163 = v96;
              v90 = [NSDictionary dictionaryWithObjects:&v163 forKeys:&v162 count:1];

              id v98 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v97)
                                                                                                  + 432)));
              if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
              {
                id v99 = [v90 objectForKeyedSubscript:v95];
                uint64_t v100 = [v99 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1469;
                __int16 v185 = 2080;
                uint64_t v186 = v100;
                _os_log_impl(&dword_221E5E000, v98, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144) {
                goto LABEL_104;
              }
              goto LABEL_105;
            }
            uint64_t v13 = [v11 listener];
            id v14 = [v13 engine];
            id v15 = objc_loadWeakRetained(location);
            BOOL v16 = v14 == v15;

            if (!v16)
            {
              uint64_t v101 = *MEMORY[0x263F08320];
              uint64_t v168 = *MEMORY[0x263F08320];
              v102 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: PHASEListener on mixer %@ is from a different engine instance", v10];
              v169 = v102;
              v90 = [NSDictionary dictionaryWithObjects:&v169 forKeys:&v168 count:1];

              v104 = **(id **)(Phase::Logger::GetInstance(v103) + 432);
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                id v105 = [v90 objectForKeyedSubscript:v101];
                uint64_t v106 = [v105 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1401;
                __int16 v185 = 2080;
                uint64_t v186 = v106;
                _os_log_impl(&dword_221E5E000, v104, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144) {
                goto LABEL_104;
              }
              goto LABEL_105;
            }
            BOOL v17 = [v154 listener];
            BOOL v18 = v17 == 0;

            if (v18)
            {
              uint64_t v107 = *MEMORY[0x263F08320];
              uint64_t v166 = *MEMORY[0x263F08320];
              v108 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: Sound instance ambient mixer dictionary not complete for mixer %@", v10];
              v167 = v108;
              v90 = [NSDictionary dictionaryWithObjects:&v167 forKeys:&v166 count:1];

              v110 = **(id **)(Phase::Logger::GetInstance(v109) + 432);
              if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
              {
                id v111 = [v90 objectForKeyedSubscript:v107];
                uint64_t v112 = [v111 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1416;
                __int16 v185 = 2080;
                uint64_t v186 = v112;
                _os_log_impl(&dword_221E5E000, v110, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144) {
                goto LABEL_104;
              }
              goto LABEL_105;
            }
            BOOL v19 = [v154 listener];
            int v20 = [v19 isConnectedToRoot];

            if (!v20)
            {
              uint64_t v119 = *MEMORY[0x263F08320];
              uint64_t v164 = *MEMORY[0x263F08320];
              id v120 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: PHASEListener on mixer %@ is not connected to the scene", v10];
              v165 = v120;
              v90 = [NSDictionary dictionaryWithObjects:&v165 forKeys:&v164 count:1];

              v122 = **(id **)(Phase::Logger::GetInstance(v121) + 432);
              if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
              {
                id v123 = [v90 objectForKeyedSubscript:v119];
                uint64_t v124 = [v123 UTF8String];
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                __int16 v183 = 1024;
                int v184 = 1431;
                __int16 v185 = 2080;
                uint64_t v186 = v124;
                _os_log_impl(&dword_221E5E000, v122, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
              }
              if (v144) {
                goto LABEL_104;
              }
              goto LABEL_105;
            }
            if (*((_DWORD *)a4 + 24))
            {
              uint64_t v22 = 0;
              unint64_t v23 = 0;
              __int16 v24 = 0;
              *(void *)&long long v153 = 0;
              do
              {
                uint64_t v25 = *((void *)a4 + 13);
                if (*(void *)(v25 + v22 + 8) == 2)
                {
                  uint64_t v26 = *(void *)(v25 + v22);
                  if (v26 == Phase::GetStringHashId(v10, v21))
                  {
                    uint64_t v27 = [objc_alloc(MEMORY[0x263EF9328]) initWithLayoutTag:*(unsigned int *)(v25 + v22 + 32)];

                    long long v153 = *(_OWORD *)(v25 + v22 + 36);
                    __int16 v24 = (PHASESpatialMixer *)v27;
                  }
                }
                ++v23;
                v22 += 5944;
              }
              while (v23 < *((unsigned int *)a4 + 24));
            }
            else
            {
              __int16 v24 = 0;
              *(void *)&long long v153 = 0;
            }
            uint64_t v59 = [PHASEAmbientMixer alloc];
            v60 = [v154 listener];
            id v61 = objc_loadWeakRetained(location);
            uint64_t v62 = -[PHASEAmbientMixer initWithIdentifier:listener:inputChannelLayout:orientation:engine:actionTreeObjectId:](v59, "initWithIdentifier:listener:inputChannelLayout:orientation:engine:actionTreeObjectId:", v10, v60, v24, v61, *(void *)self->_actionTreeObject.__ptr_, *((void *)self->_actionTreeObject.__ptr_ + 1), *(double *)&v153);

            [v150 setObject:v62 forKey:v10];
          }

          uint64_t v9 = v149;
        }
        uint64_t v147 = [v149 countByEnumeratingWithState:&v156 objects:v180 count:16];
        if (v147) {
          continue;
        }
        break;
      }
    }

    id v67 = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v149 = [v67 assetRegistry];

    if (v149)
    {
      unint64_t v68 = *((unsigned int *)a4 + 24);
      if (v68)
      {
        uint64_t v69 = 0;
        unint64_t v70 = 0;
        uint64_t v71 = 0;
        do
        {
          uint64_t v72 = *((void *)a4 + 13);
          if (*(void *)(v72 + v69 + 8) == 3)
          {
            uint64_t v73 = (void *)[objc_alloc(MEMORY[0x263EF9328]) initWithLayoutTag:*(unsigned int *)(v72 + v69 + 32)];

            v74 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v149, "getStringEmpty:", *(void *)(v72 + v69)));
            uint64_t v75 = [[PHASEChannelMixer alloc] initWithIdentifier:v74 inputChannelLayout:v73];
            [v150 setObject:v75 forKey:v74];

            unint64_t v68 = *((unsigned int *)a4 + 24);
            uint64_t v71 = v73;
          }
          else
          {
            uint64_t v73 = v71;
          }
          ++v70;
          v69 += 5944;
        }
        while (v70 < v68);
      }
      else
      {
        uint64_t v73 = 0;
      }
      uint64_t v81 = [NSDictionary dictionaryWithDictionary:v150];
    }
    else
    {
      uint64_t v82 = *MEMORY[0x263F08320];
      uint64_t v160 = *MEMORY[0x263F08320];
      v83 = [NSString stringWithFormat:@"PHASE Engine initialization error"];
      uint64_t v161 = v83;
      uint64_t v73 = [NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];

      v85 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v84)
                                                                                          + 432)));
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        id v86 = [v73 objectForKeyedSubscript:v82];
        uint64_t v87 = [v86 UTF8String];
        *(_DWORD *)buf = 136315650;
        v182 = "PHASESoundEvent.mm";
        __int16 v183 = 1024;
        int v184 = 1484;
        __int16 v185 = 2080;
        uint64_t v186 = v87;
        _os_log_impl(&dword_221E5E000, v85, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
      }
      if (v144)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925669 userInfo:v73];
        uint64_t v149 = 0;
        uint64_t v81 = 0;
        *long long v144 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v149 = 0;
        uint64_t v81 = 0;
      }
    }
LABEL_106:
  }
  else
  {
    unint64_t v8 = (void *)(*((void *)a4 + 13) + 8);
    while ((unint64_t)(*v8 - 1) > 1)
    {
      v8 += 743;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    uint64_t v76 = *MEMORY[0x263F08320];
    uint64_t v187 = *MEMORY[0x263F08320];
    uint64_t v77 = [NSString stringWithFormat:@"Failed to initialize PHASESoundEvent: Missing required spatial/ambient mixer parameters"];
    v188[0] = v77;
    v150 = [NSDictionary dictionaryWithObjects:v188 forKeys:&v187 count:1];

    v79 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v78)
                                                                                        + 432)));
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      id v80 = [v150 objectForKeyedSubscript:v76];
      *(_DWORD *)buf = 136315650;
      v182 = "PHASESoundEvent.mm";
      __int16 v183 = 1024;
      int v184 = 1256;
      __int16 v185 = 2080;
      uint64_t v186 = [v80 UTF8String];
      _os_log_impl(&dword_221E5E000, v79, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (v144)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925668 userInfo:v150];
      uint64_t v81 = 0;
      *long long v144 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v81 = 0;
    }
  }

  return v81;
}

- (id)internalGetActionTreePushStreamNodes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  location = (id *)&self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  id v37 = [WeakRetained assetRegistry];

  ptr = self->_actionTreeObject.__ptr_;
  uint64_t v8 = *((void *)ptr + 3);
  if (*(_DWORD *)(v8 + 40))
  {
    unint64_t v9 = 0;
    id v33 = v4;
    BOOL v34 = v5;
    do
    {
      uint64_t v10 = *(unsigned int *)(*(void *)(v8 + 56) + 4 * v9);
      if (*(_DWORD *)(*(void *)(v8 + 88) + v10) == 9)
      {
        uint64_t v11 = *(void *)(*(void *)(v8 + 48) + 8 * v9);
        char v40 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v37, "getString:", v11));
        uint64_t v12 = v10 + *(void *)(*((void *)self->_actionTreeObject.__ptr_ + 3) + 88);
        uint64_t v39 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v37, "getString:", *(void *)(v12 + 16)));
        uint64_t v13 = [(PHASESoundEvent *)self mixers];
        BOOL v38 = [v13 objectForKeyedSubscript:v39];

        id v14 = objc_loadWeakRetained(location);
        id v15 = [v14 assetRegistry];
        BOOL v16 = [v4 assetIdentifier];
        BOOL v17 = [v15 assetForIdentifier:v16];

        objc_opt_class();
        BOOL v18 = (void *)v39;
        if (objc_opt_isKindOfClass())
        {
          BOOL v19 = [v17 streamNodeFormats];
          uint64_t v35 = [v19 objectForKeyedSubscript:v40];

          int v20 = [PHASEPushStreamNode alloc];
          uint64_t v21 = v12 + 8;
          id v22 = objc_loadWeakRetained(location);
          unint64_t v23 = self;
          __int16 v24 = self->_actionTreeObject.__ptr_;
          uint64_t v26 = *(void *)v24;
          uint64_t v25 = *((void *)v24 + 1);
          int v27 = *(unsigned __int8 *)(v21 + 56);
          long long v28 = [NSNumber numberWithDouble:*(double *)(v21 + 64)];
          LOBYTE(v32) = v27 != 0;
          int v29 = -[PHASEStreamNode initWithEngine:actionTreeUniqueId:nodeStringHashId:mixer:format:normalize:targetLKFS:](v20, "initWithEngine:actionTreeUniqueId:nodeStringHashId:mixer:format:normalize:targetLKFS:", v22, v26, v25, v11, v38, v35, v32, v28);

          id v5 = v34;
          [v34 setObject:v29 forKey:v40];
          self = v23;

          id v4 = v33;
          BOOL v18 = (void *)v39;
        }

        ptr = self->_actionTreeObject.__ptr_;
      }
      ++v9;
      uint64_t v8 = *((void *)ptr + 3);
    }
    while (v9 < *(unsigned int *)(v8 + 40));
  }
  BOOL v30 = [NSDictionary dictionaryWithDictionary:v5];

  return v30;
}

- (id)internalGetActionTreePullStreamNodes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  location = (id *)&self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  id v37 = [WeakRetained assetRegistry];

  ptr = self->_actionTreeObject.__ptr_;
  uint64_t v8 = *((void *)ptr + 3);
  if (*(_DWORD *)(v8 + 40))
  {
    unint64_t v9 = 0;
    id v33 = v4;
    BOOL v34 = v5;
    do
    {
      uint64_t v10 = *(unsigned int *)(*(void *)(v8 + 56) + 4 * v9);
      if (*(_DWORD *)(*(void *)(v8 + 88) + v10) == 12)
      {
        uint64_t v11 = *(void *)(*(void *)(v8 + 48) + 8 * v9);
        char v40 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v37, "getString:", v11));
        uint64_t v12 = v10 + *(void *)(*((void *)self->_actionTreeObject.__ptr_ + 3) + 88);
        uint64_t v39 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v37, "getString:", *(void *)(v12 + 16)));
        uint64_t v13 = [(PHASESoundEvent *)self mixers];
        BOOL v38 = [v13 objectForKeyedSubscript:v39];

        id v14 = objc_loadWeakRetained(location);
        id v15 = [v14 assetRegistry];
        BOOL v16 = [v4 assetIdentifier];
        BOOL v17 = [v15 assetForIdentifier:v16];

        objc_opt_class();
        BOOL v18 = (void *)v39;
        if (objc_opt_isKindOfClass())
        {
          BOOL v19 = [v17 streamNodeFormats];
          uint64_t v35 = [v19 objectForKeyedSubscript:v40];

          int v20 = [PHASEPullStreamNode alloc];
          uint64_t v21 = v12 + 8;
          id v22 = objc_loadWeakRetained(location);
          unint64_t v23 = self;
          __int16 v24 = self->_actionTreeObject.__ptr_;
          uint64_t v26 = *(void *)v24;
          uint64_t v25 = *((void *)v24 + 1);
          int v27 = *(unsigned __int8 *)(v21 + 56);
          long long v28 = [NSNumber numberWithDouble:*(double *)(v21 + 64)];
          LOBYTE(v32) = v27 != 0;
          int v29 = -[PHASEStreamNode initWithEngine:actionTreeUniqueId:nodeStringHashId:mixer:format:normalize:targetLKFS:](v20, "initWithEngine:actionTreeUniqueId:nodeStringHashId:mixer:format:normalize:targetLKFS:", v22, v26, v25, v11, v38, v35, v32, v28);

          id v5 = v34;
          [v34 setObject:v29 forKey:v40];
          self = v23;

          id v4 = v33;
          BOOL v18 = (void *)v39;
        }

        ptr = self->_actionTreeObject.__ptr_;
      }
      ++v9;
      uint64_t v8 = *((void *)ptr + 3);
    }
    while (v9 < *(unsigned int *)(v8 + 40));
  }
  BOOL v30 = [NSDictionary dictionaryWithDictionary:v5];

  return v30;
}

- (BOOL)seekToTime:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__PHASESoundEvent_seekToTime_completionHandler___block_invoke;
  v9[3] = &unk_2645F78E0;
  id v10 = v6;
  id v7 = v6;
  [(PHASESoundEvent *)self seekToTime:v9 completion:a3];

  return 1;
}

uint64_t __48__PHASESoundEvent_seekToTime_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)seekToTime:(double)a3 completionBlock:(id)a4
{
  return 1;
}

- (void)seekToTime:(double)time completion:(void *)handler
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = handler;
  uint64_t v8 = **(id **)(Phase::Logger::GetInstance(v7) + 432);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    *(_DWORD *)buf = 136315906;
    __int16 v41 = "PHASESoundEvent.mm";
    __int16 v42 = 1024;
    int v43 = 1627;
    __int16 v44 = 2112;
    unint64_t v45 = (unint64_t)self;
    __int16 v46 = 2048;
    uint64_t v47 = *(void *)&time;
    _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ seekToTime %f", buf, 0x26u);
  }
  if (!*((unsigned char *)self->_actionTreeObject.__ptr_ + 144))
  {
    if (!v7) {
      goto LABEL_21;
    }
    unint64_t v31 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v9) + 432);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v41 = "PHASESoundEvent.mm";
      __int16 v42 = 1024;
      int v43 = 1633;
      __int16 v44 = 2112;
      unint64_t v45 = (unint64_t)self;
      uint64_t v32 = "%25s:%-5d seekToTime: %@ Invalid sound event instance";
LABEL_19:
      _os_log_impl(&dword_221E5E000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x1Cu);
    }
LABEL_20:
    (*((void (**)(Phase::Logger *, void))v7 + 2))(v7, 0);
    goto LABEL_21;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  BOOL v11 = WeakRetained == 0;

  if (v11)
  {
    if (!v7) {
      goto LABEL_21;
    }
    unint64_t v31 = **(id **)(Phase::Logger::GetInstance(v12) + 432);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v41 = "PHASESoundEvent.mm";
      __int16 v42 = 1024;
      int v43 = 1643;
      __int16 v44 = 2112;
      unint64_t v45 = (unint64_t)self;
      uint64_t v32 = "%25s:%-5d seekToTime: %@ PHASE not initialized";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (!self->_prepareState) {
    [(PHASESoundEvent *)self prepareWithCompletion:0];
  }
  uint64_t v13 = (void *)[(Phase::Logger *)v7 copy];
  id v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  BOOL v16 = NSStringFromSelector(a2);
  double v17 = PHASEGetPropertyBounded<double>(v15, v16, time, 0.0, 1.79769313e308);

  id v18 = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v19 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)([v18 implementation] + 48), 7);

  ptr = self->_actionTreeObject.__ptr_;
  uint64_t v21 = *(void *)ptr;
  uint64_t v22 = *((void *)ptr + 1);
  id v23 = objc_loadWeakRetained((id *)&self->_engine);
  [v23 unitsPerSecond];
  double v25 = v24;
  uint64_t v26 = _Block_copy(v13);
  if (*(int *)(v19 + 16) <= 0)
  {
    id v33 = **(id **)(v19 + 24);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v41 = "Commandable.hpp";
      __int16 v42 = 1024;
      int v43 = 132;
      _os_log_impl(&dword_221E5E000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C380] + 16);
  }
  int v27 = v26;
  uint64_t v28 = **(void **)(v19 + 8);
  unint64_t v39 = 0;
  BOOL v38 = 1;
  uint64_t v29 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v28, 72, &v39, &v38);
  if (!v29)
  {
    Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    id v36 = **(id **)(v28 + 48);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v41 = "CommandQueue.hpp";
      __int16 v42 = 1024;
      int v43 = 100;
      _os_log_impl(&dword_221E5E000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    id v37 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v37, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v38)
  {
    BOOL v30 = **(id **)(v28 + 48);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v41 = "CommandQueue.hpp";
      __int16 v42 = 1024;
      int v43 = 89;
      __int16 v44 = 2048;
      unint64_t v45 = v39;
      __int16 v46 = 2048;
      uint64_t v47 = 72;
      _os_log_impl(&dword_221E5E000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *(void *)uint64_t v29 = &unk_26D4794B0;
  *(void *)(v29 + 8) = v19;
  *(void *)(v29 + 16) = Phase::ActionTreeManager::SeekActionTree;
  *(void *)(v29 + 24) = 0;
  *(void *)(v29 + 32) = v21;
  *(void *)(v29 + 40) = v22;
  *(double *)(v29 + 48) = v17 * v25;
  *(void *)(v29 + 56) = -[PHASESoundEvent seekToTime:completion:]::$_5::__invoke;
  *(void *)(v29 + 64) = v27;
  Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v28, 72);
  atomic_store(0, (unsigned __int8 *)(v28 + 40));

LABEL_21:
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<PHASESoundEvent: %p, uniqueID=%llu>", self, *(void *)self->_actionTreeObject.__ptr_];
}

- (id)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return WeakRetained;
}

- (void)setPrepareState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  Instance = (Phase::Logger *)Phase::Logger::GetInstance((Phase::Logger *)self);
  if (*((unsigned char *)Instance + 1556))
  {
    id v6 = **(id **)(Phase::Logger::GetInstance(Instance) + 432);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t prepareState = self->_prepareState;
      if (prepareState > 2) {
        uint64_t v8 = "<not found>";
      }
      else {
        uint64_t v8 = off_2645F79A0[prepareState];
      }
      uint64_t v9 = *(void *)self->_actionTreeObject.__ptr_;
      if ((unint64_t)a3 > 2) {
        id v10 = "<not found>";
      }
      else {
        id v10 = off_2645F79A0[a3];
      }
      int v11 = 136316162;
      uint64_t v12 = "PHASESoundEvent.mm";
      __int16 v13 = 1024;
      int v14 = 1696;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      id v18 = v8;
      __int16 v19 = 2080;
      int v20 = v10;
      _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d (sound event: %llu) - prepare state changed from '%s' to '%s'", (uint8_t *)&v11, 0x30u);
    }
  }
  self->_unint64_t prepareState = a3;
}

- (void)setRenderingState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = self;
  id v5 = (Phase::Logger *)objc_sync_enter(v4);
  Instance = (Phase::Logger *)Phase::Logger::GetInstance(v5);
  if (*((unsigned char *)Instance + 1556))
  {
    if (v4->_renderingState != a3)
    {
      id v7 = **(id **)(Phase::Logger::GetInstance(Instance) + 432);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t renderingState = v4->_renderingState;
        if (renderingState > 2) {
          uint64_t v9 = "<not found>";
        }
        else {
          uint64_t v9 = off_2645F79B8[renderingState];
        }
        uint64_t v10 = *(void *)v4->_actionTreeObject.__ptr_;
        if ((unint64_t)a3 > 2) {
          int v11 = "<not found>";
        }
        else {
          int v11 = off_2645F79B8[a3];
        }
        int v12 = 136316162;
        __int16 v13 = "PHASESoundEvent.mm";
        __int16 v14 = 1024;
        int v15 = 1711;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        __int16 v19 = v9;
        __int16 v20 = 2080;
        uint64_t v21 = v11;
        _os_log_impl(&dword_221E5E000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d (sound event: %llu) - rendering state changed from '%s' to '%s'", (uint8_t *)&v12, 0x30u);
      }
    }
  }
  v4->_unint64_t renderingState = a3;
  objc_sync_exit(v4);
}

- (void)getActionTreeObject
{
  return self->_actionTreeObject.__ptr_;
}

- (unint64_t)preparedHostTime
{
  return self->_preparedHostTime;
}

- (unint64_t)ioStartHostTime
{
  return self->_ioStartHostTime;
}

- (NSDictionary)metaParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSDictionary)mixers
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (NSDictionary)pushStreamNodes
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (NSDictionary)pullStreamNodes
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)isIndefinite
{
  return self->_isIndefinite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pullStreamNodes, 0);
  objc_storeStrong((id *)&self->_pushStreamNodes, 0);
  objc_storeStrong((id *)&self->_mixers, 0);
  objc_storeStrong((id *)&self->_metaParameters, 0);

  objc_storeStrong((id *)&self->_audioSession, 0);
  begin = self->_submixIds.__begin_;
  if (begin)
  {
    self->_submixIds.__end_ = begin;
    operator delete(begin);
  }
  cntrl = self->_actionTreeObject.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_protoType, 0);

  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  return self;
}

- (void)internalPrepareActionTreeWithCompletionBlock:(uint64_t)a3
{
  if (a6)
  {
    a6[2](a6, a3, a4, a5);
  }
}

- (void)internalStartActionTreeWithCompletionBlock:(uint64_t)a3
{
  if (a5)
  {
    a5[2](a5, a3, a4);
  }
}

- (void)seekToTime:(uint64_t)a3 completion:(void *)(a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a4)
  {
    a4[2](a4, a3);
  }
  id v7 = **(id **)(Phase::Logger::GetInstance(a1) + 432);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315906;
    uint64_t v9 = "PHASESoundEvent.mm";
    __int16 v10 = 1024;
    int v11 = 1663;
    __int16 v12 = 2048;
    __int16 v13 = a1;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    _os_log_impl(&dword_221E5E000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d PHASESoundEvent %llu seekToTime completed with result %ld", (uint8_t *)&v8, 0x26u);
  }
}

- (uint64_t)pause
{
  return Phase::ActionTreeManager::PauseActionTree(a1[1], a1[2], a1[3]);
}

- (uint64_t)resume
{
  return Phase::ActionTreeManager::UnPauseActionTree(a1[1], a1[2], a1[3]);
}

- (uint64_t)stopAndInvalidate
{
  return Phase::ActionTreeManager::StopActionTree(a1[1], a1[2], a1[3], PHASESoundEventPrepareHandlerReasonPrepared, PHASESoundEventStartHandlerReasonFinishedPlaying);
}

@end