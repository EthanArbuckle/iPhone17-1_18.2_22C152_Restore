@interface REPHASESoundEvent
+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 normalizationMode:(int)a8 targetLUFS:(double)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 callback:(id)a12;
+ (void)eventWithEngine:(id)a3 streamUUID:(id)a4 maximumFramesToRender:(unsigned int)a5 audioFormat:(id)a6 audioUnit:(id)a7 renderBlock:(id)a8 mixerDefinition:(id)a9 source:(id)a10 listener:(id)a11 group:(id)a12 normalizationMode:(int)a13 calibrationMode:(int)a14 calibrationLevel:(double)a15 audioSession:(id)a16 phaseQueue:(id)a17 callback:(id)a18;
+ (void)eventWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 normalizationMode:(int)a8 targetLUFS:(double)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 audioSession:(id)a12 phaseQueue:(id)a13 callback:(id)a14;
- (AUAudioUnit)audioUnit;
- (AVAudioSession)audioSession;
- (BOOL)_pause;
- (BOOL)_resume;
- (BOOL)_seekToTime:(double)a3;
- (BOOL)_start;
- (BOOL)_stopAndDestroy;
- (BOOL)changeFromExpectedState:(unint64_t)a3 toState:(unint64_t)a4;
- (BOOL)seekToTime:(double)a3;
- (BOOL)soundEventPlayed;
- (PHASEExternalOutputStream)externalStream;
- (PHASEExternalOutputStreamController)externalStreamController;
- (PHASESoundEvent)soundEvent;
- (REPHASESoundEvent)initWithEngine:(id)a3 soundEventAsset:(id)a4 source:(id)a5 listener:(id)a6 mixerParameters:(id)a7 audioSession:(id)a8 phaseQueue:(id)a9 outError:(id *)a10;
- (REPHASESoundEvent)initWithEngine:(id)a3 source:(id)a4 listener:(id)a5 audioSession:(id)a6 phaseQueue:(id)a7;
- (REPHASESoundEvent)initWithSoundEventFactory:(id)a3 phaseQueue:(id)a4;
- (REPHASESoundEventObserver)observer;
- (double)latestSeekTarget;
- (double)sourcePose;
- (float)cachedDirectSendLevel;
- (float)cachedPlaybackSpeed;
- (float)cachedReverbSendLevel;
- (id).cxx_construct;
- (id)description;
- (id)mixer;
- (id)paramForKey:(id)a3;
- (id)playbackStateChangeHandler;
- (id)renderBlock;
- (shared_ptr<re::audio::REPHASESoundPrepareState>)prepareState;
- (unint64_t)changeToState:(unint64_t)a3;
- (unint64_t)state;
- (void)_updateCommandQueue;
- (void)dealloc;
- (void)pause;
- (void)prepareWithCompletion:(id)a3;
- (void)resume;
- (void)setAudioUnit:(id)a3;
- (void)setCachedDirectSendLevel:(float)a3;
- (void)setCachedPlaybackSpeed:(float)a3;
- (void)setCachedReverbSendLevel:(float)a3;
- (void)setExternalStream:(id)a3;
- (void)setObserver:(id)a3;
- (void)setPlaybackStateChangeHandler:(id)a3;
- (void)setPrepareState:(shared_ptr<re::audio::REPHASESoundPrepareState>)a3;
- (void)setRenderBlock:(id)a3;
- (void)setSoundEventPlayed:(BOOL)a3;
- (void)stopAndDestroy;
- (void)stream:(id)a3 didInvalidateWithError:(id)a4;
- (void)updateCommandQueue;
@end

@implementation REPHASESoundEvent

- (REPHASESoundEvent)initWithSoundEventFactory:(id)a3 phaseQueue:(id)a4
{
  v6 = (void (**)(void))a3;
  id v7 = a4;
  v8 = [(REPHASESoundEvent *)self initWithEngine:0 source:0 listener:0 audioSession:0 phaseQueue:v7];
  if (v8)
  {
    uint64_t v9 = v6[2](v6);
    soundEvent = v8->_soundEvent;
    v8->_soundEvent = (PHASESoundEvent *)v9;

    v11 = _Block_copy(v6);
    id soundEventFactory = v8->_soundEventFactory;
    v8->_id soundEventFactory = v11;
  }
  return v8;
}

- (REPHASESoundEvent)initWithEngine:(id)a3 source:(id)a4 listener:(id)a5 audioSession:(id)a6 phaseQueue:(id)a7
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)REPHASESoundEvent;
  v17 = [(REPHASESoundEvent *)&v24 init];
  v18 = v17;
  if (v17)
  {
    atomic_store(0, (unsigned __int8 *)&v17->_isStopping);
    soundEvent = v17->_soundEvent;
    v17->_soundEvent = 0;

    externalStreamController = v18->_externalStreamController;
    v18->_externalStreamController = 0;

    atomic_store(9uLL, &v18->_state.__a_.__a_value);
    objc_storeStrong((id *)&v18->_engine, a3);
    objc_storeStrong((id *)&v18->_source, a4);
    objc_storeStrong((id *)&v18->_listener, a5);
    objc_storeStrong((id *)&v18->_audioSession, a6);
    *(int32x2_t *)&v18->_cachedPlaybackSpeed = vdup_n_s32(0x7FC00000u);
    v18->_cachedDirectSendLevel = NAN;
    v18->_soundEventPlayed = 0;
    re::audio::REPHASESoundPrepareState::create(v21);
  }

  return 0;
}

- (REPHASESoundEvent)initWithEngine:(id)a3 soundEventAsset:(id)a4 source:(id)a5 listener:(id)a6 mixerParameters:(id)a7 audioSession:(id)a8 phaseQueue:(id)a9 outError:(id *)a10
{
  id v16 = a3;
  id v30 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = [(REPHASESoundEvent *)self initWithEngine:v16 source:v17 listener:v18 audioSession:v20 phaseQueue:v21];
  id v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_mixerParameters, a7);
    objc_storeStrong((id *)&v23->_soundEventAsset, a4);
    id v24 = objc_alloc(MEMORY[0x263F14998]);
    v25 = [v30 identifier];
    uint64_t v26 = [v24 initWithEngine:v16 assetIdentifier:v25 mixerParameters:v19 error:a10];
    soundEvent = v23->_soundEvent;
    v23->_soundEvent = (PHASESoundEvent *)v26;

    v28 = [(REPHASESoundEvent *)v23 soundEvent];

    if (!v28)
    {

      id v23 = 0;
    }
  }

  return v23;
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 normalizationMode:(int)a8 targetLUFS:(double)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 callback:(id)a12
{
  id v31 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a12;
  id v24 = (void *)[objc_alloc(MEMORY[0x263F14968]) initWithValue:@"gain" minimum:1.0 maximum:0.0 identifier:4.0];
  uint64_t v25 = objc_opt_respondsToSelector();
  if (v25)
  {
    uint64_t v26 = (void *)MEMORY[0x263F14930];
    v27 = [NSNumber numberWithDouble:a9];
    LOBYTE(v30) = a8 == 1;
    [v26 controllerWithEngine:v31 streamUUID:v19 gainMetaParameterDefinition:v24 mixerDefinition:v20 source:v21 listener:v22 group:a11 normalize:0 targetLKFS:v30 calibrationMode:v27 level:a10 callback:v23];
  }
  else
  {
    v28 = *re::audioLogObjects((re *)v25);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_233120000, v28, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Prepare] PHASEExternalOutputStreamController does not support target LKFS", buf, 2u);
    }
    LOBYTE(v29) = a8 == 1;
    [MEMORY[0x263F14930] controllerWithEngine:v31 streamUUID:v19 gainMetaParameterDefinition:v24 mixerDefinition:v20 source:v21 listener:v22 normalize:a11 calibrationMode:v29 level:a10 callback:v23];
  }
}

+ (void)eventWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 normalizationMode:(int)a8 targetLUFS:(double)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 audioSession:(id)a12 phaseQueue:(id)a13 callback:(id)a14
{
  id v20 = a3;
  id v34 = a4;
  id v33 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  v32 = v23;
  uint64_t v26 = [[REPHASESoundEvent alloc] initWithEngine:v20 source:v21 listener:v22 audioSession:v23 phaseQueue:v24];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __175__REPHASESoundEvent_eventWithEngine_streamUUID_mixerDefinition_source_listener_normalizationMode_targetLUFS_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke;
  aBlock[3] = &unk_264BE2DE8;
  v27 = v26;
  v36 = v27;
  id v28 = v25;
  id v37 = v28;
  uint64_t v29 = _Block_copy(aBlock);
  LODWORD(v30) = a10;
  +[REPHASESoundEvent controllerWithEngine:v20 streamUUID:v34 mixerDefinition:v33 source:v21 listener:v22 normalizationMode:a8 targetLUFS:a9 calibrationMode:a11 calibrationLevel:v30 callback:v29];
}

void __175__REPHASESoundEvent_eventWithEngine_streamUUID_mixerDefinition_source_listener_normalizationMode_targetLUFS_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  v8 = *re::audioLogObjects(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_debug_impl(&dword_233120000, v8, OS_LOG_TYPE_DEBUG, "PHASEExternalOutputStreamController created", v9, 2u);
  }
  [*(id *)(a1 + 32) setExternalStream:0];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), a2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)eventWithEngine:(id)a3 streamUUID:(id)a4 maximumFramesToRender:(unsigned int)a5 audioFormat:(id)a6 audioUnit:(id)a7 renderBlock:(id)a8 mixerDefinition:(id)a9 source:(id)a10 listener:(id)a11 group:(id)a12 normalizationMode:(int)a13 calibrationMode:(int)a14 calibrationLevel:(double)a15 audioSession:(id)a16 phaseQueue:(id)a17 callback:(id)a18
{
  id v23 = a3;
  id v59 = a4;
  id v55 = a6;
  id v24 = a7;
  unint64_t v25 = (unint64_t)a8;
  id v61 = a9;
  id v26 = a10;
  id v27 = a11;
  id v56 = a12;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  unint64_t v60 = (unint64_t)v24;
  v57 = v27;
  v58 = v26;
  v54 = v29;
  id v52 = v30;
  id v31 = [[REPHASESoundEvent alloc] initWithEngine:v23 source:v26 listener:v27 audioSession:v28 phaseQueue:v29];
  v51 = v31;
  v32 = (std::__shared_weak_count *)operator new(0x48uLL);
  id v33 = v32;
  unsigned int v34 = v24 != 0;
  if (v25) {
    ++v34;
  }
  if (v61) {
    unint64_t v35 = v34 + 1;
  }
  else {
    unint64_t v35 = v34;
  }
  v32->__shared_owners_ = 0;
  v32->__shared_weak_owners_ = 0;
  v32->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E6DA550;
  v36 = v31;
  id v37 = v30;
  v33[1].__vftable = (std::__shared_weak_count_vtbl *)v35;
  v33[1].__shared_weak_owners_ = 0;
  v33[2].__vftable = 0;
  v33[1].__shared_owners_ = 0;
  p_shared_owners = &v33[1].__shared_owners_;
  char v76 = 0;
  if (v35)
  {
    uint64_t v38 = 8 * v35;
    v39 = operator new(8 * v35);
    v33[1].__shared_owners_ = (uint64_t)v39;
    v33[1].__shared_weak_owners_ = (uint64_t)v39;
    v40 = (std::__shared_weak_count_vtbl *)&v39[v35];
    v33[2].__vftable = v40;
    do
    {
      *v39++ = 0;
      v38 -= 8;
    }
    while (v38);
    v33[1].__shared_weak_owners_ = (uint64_t)v40;
  }
  v33[2].__shared_owners_ = (uint64_t)v36;
  v33[2].__shared_weak_owners_ = (uint64_t)_Block_copy(v37);

  id v41 = 0;
  if (v60 | v25)
  {
    v42 = (void *)[objc_alloc(MEMORY[0x263F14938]) initWithStreamType:0 format:v55 maximumFramesToRender:a5];
    if (v60)
    {
      v43 = [(id)v60 renderBlock];
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke;
      aBlock[3] = &unk_264BE2E10;
      id v74 = v43;
      id v44 = v43;
      v45 = _Block_copy(aBlock);

      unint64_t v25 = (unint64_t)v45;
    }
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3321888768;
    v66[2] = __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke_2;
    v66[3] = &unk_26E6DA460;
    id v67 = (id)v60;
    unsigned int v72 = a5;
    v46 = v36;
    v68 = v46;
    id v41 = (id)v25;
    id v69 = v41;
    v70 = v33 + 1;
    v71 = v33;
    atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
    v47 = _Block_copy(v66);
    [MEMORY[0x263F14928] streamWithEngine:v23 uuid:v59 definition:v42 startsPaused:1 delegate:v46 renderBlock:v41 callback:v47];

    if (v71) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v71);
    }
  }
  if (v61)
  {
    v48 = (void *)[objc_alloc(MEMORY[0x263F14968]) initWithValue:@"gain" minimum:1.0 maximum:0.0 identifier:4.0];
    v49 = (void *)MEMORY[0x263F14930];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3321888768;
    v62[2] = __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke_31;
    v62[3] = &unk_26E6DA498;
    v63 = v36;
    v64 = v33 + 1;
    v65 = v33;
    atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
    LOBYTE(v50) = a13 == 1;
    objc_msgSend(v49, "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:calibrationMode:level:callback:", v23, v59, v48, v61, v58, v57, a15, v56, v50, a14, v62, v51, v52);
    if (v65) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v65);
    }
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v33);
}

uint64_t __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke(uint64_t a1, BOOL *a2)
{
  int v4 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a2 = (v4 & 0x10) != 0;
  return result;
}

void __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
LABEL_6:
    if (v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v8 = *(void **)(a1 + 32);
  if (!v8)
  {
    id v7 = 0;
    goto LABEL_11;
  }
  [v8 setMaximumFramesToRender:*(unsigned int *)(a1 + 72)];
  uint64_t v9 = *(void **)(a1 + 32);
  id v16 = 0;
  char v10 = [v9 allocateRenderResourcesAndReturnError:&v16];
  v11 = (re *)v16;
  id v7 = v11;
  if (v10)
  {
LABEL_11:
    [*(id *)(a1 + 40) setExternalStream:v5];
    [*(id *)(a1 + 40) setAudioUnit:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setRenderBlock:*(void *)(a1 + 48)];
    goto LABEL_12;
  }
  v12 = *re::audioLogObjects(v11);
  id v6 = (re *)os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (!v6) {
    goto LABEL_6;
  }
  *(_DWORD *)buf = 138412290;
  id v20 = v7;
  _os_log_error_impl(&dword_233120000, v12, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Prepare] PHASEExternalOutputStream unable to allocate AU: %@", buf, 0xCu);
  if (!v7)
  {
LABEL_7:
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    id v18 = @"unknown error";
    id v14 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v7 = [v13 errorWithDomain:@"com.apple.re.internal" code:-210 userInfo:v14];
  }
LABEL_8:
  id v15 = *re::audioLogObjects(v6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_error_impl(&dword_233120000, v15, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Prepare] PHASEExternalOutputStream failed creation %@", buf, 0xCu);
  }
LABEL_12:
  re::MultipleCallbackManager<REPHASESoundEvent>::complete(*(atomic_ullong **)(a1 + 56), v7);
}

void __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    if (!v7)
    {
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F08320];
      v15[0] = @"unknown error";
      char v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v8 = [v9 errorWithDomain:@"com.apple.re.internal" code:-210 userInfo:v10];
    }
    v11 = *re::audioLogObjects(v7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_error_impl(&dword_233120000, v11, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Prepare] PHASEExternalOutputStreamController failed creation %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), a2);
    v8 = 0;
  }
  re::MultipleCallbackManager<REPHASESoundEvent>::complete(*(atomic_ullong **)(a1 + 40), v8);
}

- (void)dealloc
{
  [(REPHASESoundEvent *)self stopAndDestroy];
  v3.receiver = self;
  v3.super_class = (Class)REPHASESoundEvent;
  [(REPHASESoundEvent *)&v3 dealloc];
}

- (void)stream:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = (re *)a4;
  id v5 = *re::audioLogObjects(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_error_impl(&dword_233120000, v5, OS_LOG_TYPE_ERROR, "Could not create PHASEExternalOutputStream: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (unint64_t)changeToState:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v5 = atomic_load(&self->_state.__a_.__a_value);
  unint64_t v6 = v5;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_state, &v6, a3);
  while (v6 != v5)
  {
    unint64_t v5 = v6;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_state, &v6, a3);
  }
  id v7 = (id)*re::audioLogObjects((re *)self);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    re::audio::nameForPlaybackState(v5, v25);
    int v19 = v26;
    id v20 = (void **)v25[0];
    re::audio::nameForPlaybackState(a3, __p);
    uint64_t v21 = v25;
    if (v19 < 0) {
      uint64_t v21 = v20;
    }
    if (v24 >= 0) {
      id v22 = __p;
    }
    else {
      id v22 = (void **)__p[0];
    }
    *(_DWORD *)block = 138412802;
    *(void *)&block[4] = self;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = v21;
    *(_WORD *)&block[22] = 2080;
    id v28 = v22;
    _os_log_debug_impl(&dword_233120000, v7, OS_LOG_TYPE_DEBUG, "%@ changed state from %s to %s", block, 0x20u);
    if (v24 < 0) {
      operator delete(__p[0]);
    }
    if (v26 < 0) {
      operator delete(v25[0]);
    }
  }

  uint64_t v8 = [(REPHASESoundEvent *)self playbackStateChangeHandler];
  if (v8) {
    BOOL v9 = v5 == a3;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;

  if (v10)
  {
    v11 = [(REPHASESoundEvent *)self playbackStateChangeHandler];
    v11[2](v11, v5, a3);
  }
  if (a3 == 1 && ![(REPHASESoundEvent *)self soundEventPlayed])
  {
    uint64_t Instance = re::AudioManagerTelemetryReporter::getInstance((re::AudioManagerTelemetryReporter *)[(REPHASESoundEvent *)self setSoundEventPlayed:1]);
    *(void *)block = MEMORY[0x263EF8330];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = ___ZN2re29AudioManagerTelemetryReporter22reportSoundEventPlayedEv_block_invoke;
    id v28 = (void **)&__block_descriptor_40_e5_v8__0l;
    uint64_t v29 = Instance;
    dispatch_async((dispatch_queue_t)re::AudioManagerTelemetryReporter::m_managerQueue, block);
    uint64_t v14 = re::AudioManagerTelemetryReporter::getInstance(v13);
    ptr = self->_prepareState.__ptr_;
    int v16 = *((_DWORD *)ptr + 53);
    uint64_t v17 = *((void *)ptr + 27);
    *(void *)block = MEMORY[0x263EF8330];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = ___ZN2re29AudioManagerTelemetryReporter31updateCalibrationModeStatisticsE22REAudioCalibrationModed_block_invoke;
    id v28 = (void **)&__block_descriptor_52_e5_v8__0l;
    uint64_t v29 = v14;
    int v31 = v16;
    uint64_t v30 = v17;
    dispatch_async((dispatch_queue_t)re::AudioManagerTelemetryReporter::m_managerQueue, block);
  }
  return v5;
}

- (BOOL)changeFromExpectedState:(unint64_t)a3 toState:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v7 = a3;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_state, &v7, a4);
  BOOL v8 = v7 == a3;
  BOOL v9 = (id)*re::audioLogObjects((re *)self);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (!v8)
  {
    if (v10)
    {
      re::audio::nameForPlaybackState(v7, v25);
      int v19 = v26;
      id v20 = (void **)v25[0];
      re::audio::nameForPlaybackState(a4, __p);
      uint64_t v21 = v25;
      if (v19 < 0) {
        uint64_t v21 = v20;
      }
      if (v24 >= 0) {
        id v22 = __p;
      }
      else {
        id v22 = (void **)__p[0];
      }
      *(_DWORD *)buf = 138412802;
      id v28 = self;
      __int16 v29 = 2080;
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      uint64_t v32 = v22;
      _os_log_debug_impl(&dword_233120000, v9, OS_LOG_TYPE_DEBUG, "%@ state was not changed from expected state %s to %s", buf, 0x20u);
      if (v24 < 0) {
        operator delete(__p[0]);
      }
      if (v26 < 0) {
        operator delete(v25[0]);
      }
    }
    goto LABEL_12;
  }
  if (v10)
  {
    re::audio::nameForPlaybackState(a3, v25);
    int v15 = v26;
    int v16 = (void **)v25[0];
    re::audio::nameForPlaybackState(a4, __p);
    uint64_t v17 = v25;
    if (v15 < 0) {
      uint64_t v17 = v16;
    }
    if (v24 >= 0) {
      id v18 = __p;
    }
    else {
      id v18 = (void **)__p[0];
    }
    *(_DWORD *)buf = 138412802;
    id v28 = self;
    __int16 v29 = 2080;
    uint64_t v30 = v17;
    __int16 v31 = 2080;
    uint64_t v32 = v18;
    _os_log_debug_impl(&dword_233120000, v9, OS_LOG_TYPE_DEBUG, "%@ changed state from %s to %s", buf, 0x20u);
    if (v24 < 0) {
      operator delete(__p[0]);
    }
    if (v26 < 0) {
      operator delete(v25[0]);
    }
  }

  v11 = [(REPHASESoundEvent *)self playbackStateChangeHandler];
  BOOL v13 = a3 != a4 && v11 != 0;

  if (v13)
  {
    BOOL v9 = [(REPHASESoundEvent *)self playbackStateChangeHandler];
    ((void (*)(NSObject *, unint64_t, unint64_t))v9[2].isa)(v9, a3, a4);
LABEL_12:
  }
  return v8;
}

- (BOOL)_start
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  int v3 = *((unsigned __int8 *)self->_prepareState.__ptr_ + 208);
  int v4 = (id)*re::audioLogObjects((re *)self);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5) {
      goto LABEL_14;
    }
    uint64_t v6 = *((void *)self->_prepareState.__ptr_ + 3);
    [(REPHASESoundEvent *)self sourcePose];
    *(_OWORD *)location = v7;
    *(_OWORD *)&location[16] = v8;
    long long v46 = v9;
    long long v47 = v10;
    re::audio::stringFromPose((re::audio *)location, &__p);
    if (v44 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    int buf = 134218243;
    *(void *)buf_4 = v6;
    *(_WORD *)&buf_4[8] = 2085;
    *(void *)&buf_4[10] = p_p;
    int v12 = "-[REPHASESoundEvent _start] starting event for token %llu, pose=%{sensitive}s";
  }
  else
  {
    if (!v5) {
      goto LABEL_14;
    }
    uint64_t v13 = *((void *)self->_prepareState.__ptr_ + 3);
    [(REPHASESoundEvent *)self sourcePose];
    *(_OWORD *)location = v14;
    *(_OWORD *)&location[16] = v15;
    long long v46 = v16;
    long long v47 = v17;
    re::audio::stringFromPose((re::audio *)location, &__p);
    if (v44 >= 0) {
      id v18 = &__p;
    }
    else {
      id v18 = __p;
    }
    int buf = 134218242;
    *(void *)buf_4 = v13;
    *(_WORD *)&buf_4[8] = 2080;
    *(void *)&buf_4[10] = v18;
    int v12 = "-[REPHASESoundEvent _start] starting event for token %llu, pose=%s";
  }
  _os_log_impl(&dword_233120000, v4, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&buf, 0x16u);
  if (v44 < 0) {
    operator delete(__p);
  }
LABEL_14:

  int v19 = [(REPHASESoundEvent *)self soundEvent];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    int v22 = 0;
  }
  else
  {
    if (re::internal::enableSignposts(0, 0))
    {
      [(REPHASESoundEvent *)self prepareState];
      [(REPHASESoundEvent *)self prepareState];
      [(REPHASESoundEvent *)self prepareState];
      kdebug_trace();
      if (*(void *)&buf_4[4]) {
        std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf_4[4]);
      }
      if (v43) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v43);
      }
      if (*(void *)&location[8]) {
        std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&location[8]);
      }
    }
    objc_initWeak((id *)location, self);
    uint64_t v21 = [(REPHASESoundEvent *)self soundEvent];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __27__REPHASESoundEvent__start__block_invoke;
    v40[3] = &unk_264BE2E88;
    objc_copyWeak(&v41, (id *)location);
    v40[4] = self;
    [v21 startWithCompletion:v40];

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)location);
    int v22 = 1;
  }
  id v23 = [(REPHASESoundEvent *)self externalStreamController];
  int v24 = v22;
  if (v23)
  {

    unint64_t v25 = [(REPHASESoundEvent *)self externalStreamController];
    id v39 = 0;
    char v26 = [v25 startAndReturnError:&v39];
    id v27 = v39;

    if (v26)
    {
      int v22 = 1;
    }
    else
    {
      __int16 v29 = *re::audioLogObjects(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412546;
        *(void *)&location[4] = self;
        *(_WORD *)&location[12] = 2112;
        *(void *)&location[14] = v27;
        _os_log_error_impl(&dword_233120000, v29, OS_LOG_TYPE_ERROR, "%@ start failed with %@", location, 0x16u);
      }
      int v22 = 0;
    }

    int v24 = 1;
  }
  uint64_t v30 = [(REPHASESoundEvent *)self externalStream];
  if (v30)
  {
    if (v22) {
      BOOL v31 = 1;
    }
    else {
      BOOL v31 = v24 == 0;
    }
    char v32 = !v31;

    if ((v32 & 1) == 0)
    {
      uint64_t v33 = [(REPHASESoundEvent *)self externalStream];
      [v33 resume];

LABEL_42:
      if (self->_stationaryTime.__engaged_) {
        self->_stationaryTime.__engaged_ = 0;
      }
      [(REPHASESoundEvent *)self changeToState:1];
      unsigned int v34 = [(REPHASESoundEvent *)self observer];
      [(REPHASESoundEvent *)self prepareState];
      LODWORD(v35) = *(_DWORD *)(*(void *)location + 200);
      [v34 soundDidStartOrResume:self withGain:v35];
      if (*(void *)&location[8]) {
        std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&location[8]);
      }

      LOBYTE(v36) = 1;
      return v36;
    }
  }
  else if (v22 && v24)
  {
    goto LABEL_42;
  }
  id v37 = *re::audioLogObjects((re *)v30);
  BOOL v36 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
  if (v36)
  {
    *(_DWORD *)location = 138412290;
    *(void *)&location[4] = self;
    _os_log_error_impl(&dword_233120000, v37, OS_LOG_TYPE_ERROR, "Failed to start %@", location, 0xCu);
    LOBYTE(v36) = 0;
  }
  return v36;
}

void __27__REPHASESoundEvent__start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v4 = (id *)(a1 + 40);
  WeakRetained = (re *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    long long v7 = *re::audioLogObjects(WeakRetained);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      long long v15 = a2;
      _os_log_debug_impl(&dword_233120000, v7, OS_LOG_TYPE_DEBUG, "%@ received sound event completion callback with reason %ld", buf, 0x16u);
    }
    long long v8 = *((void *)v6 + 26);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__REPHASESoundEvent__start__block_invoke_34;
    block[3] = &unk_264BE2E60;
    objc_copyWeak(v11, v4);
    uint64_t v9 = *(void *)(a1 + 32);
    v11[1] = a2;
    block[4] = v9;
    dispatch_async(v8, block);
    objc_destroyWeak(v11);
  }
}

void __27__REPHASESoundEvent__start__block_invoke_34(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_38;
  }
  atomic_store(0, WeakRetained + 65);
  uint64_t v4 = *(void *)(a1 + 48);
  switch(v4)
  {
    case 2:
      long long v8 = *re::audioLogObjects((re *)WeakRetained);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int buf = 138412290;
        *(void *)buf_4 = v3;
        _os_log_impl(&dword_233120000, v8, OS_LOG_TYPE_DEFAULT, "%@ killed.", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_15;
    case 1:
      unsigned __int8 v9 = atomic_load(WeakRetained + 64);
      long long v10 = *re::audioLogObjects((re *)WeakRetained);
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if ((v9 & 1) == 0)
      {
        if (v11)
        {
          int buf = 138412290;
          *(void *)buf_4 = v3;
          uint64_t v7 = 2;
          _os_log_debug_impl(&dword_233120000, v10, OS_LOG_TYPE_DEBUG, "%@ finished playing.", (uint8_t *)&buf, 0xCu);
          int v6 = 1;
          goto LABEL_16;
        }
        break;
      }
      if (v11)
      {
        int buf = 138412290;
        *(void *)buf_4 = v3;
        _os_log_debug_impl(&dword_233120000, v10, OS_LOG_TYPE_DEBUG, "%@ stopped.", (uint8_t *)&buf, 0xCu);
      }
LABEL_15:
      int v6 = 0;
      uint64_t v7 = 0;
      goto LABEL_16;
    case 0:
      BOOL v5 = *re::audioLogObjects((re *)WeakRetained);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int buf = 138412290;
        *(void *)buf_4 = v3;
        _os_log_error_impl(&dword_233120000, v5, OS_LOG_TYPE_ERROR, "%@ finished with error.", (uint8_t *)&buf, 0xCu);
      }
      int v6 = 0;
      uint64_t v7 = 5;
      goto LABEL_16;
  }
  int v6 = 1;
  uint64_t v7 = 2;
LABEL_16:
  if (re::internal::enableSignposts(0, 0))
  {
    [*(id *)(a1 + 32) prepareState];
    int v12 = [*(id *)(a1 + 32) soundEvent];
    [v12 ioStartHostTime];
    uint64_t v13 = [*(id *)(a1 + 32) soundEvent];
    [v13 preparedHostTime];
    [*(id *)(a1 + 32) prepareState];
    kdebug_trace();
    if (v30) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v30);
    }

    if (*(void *)&buf_4[4]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
  if (re::internal::enableSignposts(0, 0))
  {
    [*(id *)(a1 + 32) prepareState];
    [*(id *)(a1 + 32) prepareState];
    kdebug_trace();
    if (v30) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v30);
    }
    if (*(void *)&buf_4[4]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
  [v3 changeToState:v7];
  if (!v6) {
    goto LABEL_37;
  }
  if (!*(unsigned char *)(*((void *)v3 + 37) + 103))
  {
    uint64_t v14 = *((void *)v3 + 25);
    if (v14)
    {
      uint64_t v15 = (*(void (**)(void))(v14 + 16))();
      id v16 = 0;
      long long v17 = (void *)*((void *)v3 + 30);
      *((void *)v3 + 30) = v15;
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x263F14998]);
      uint64_t v19 = *((void *)v3 + 9);
      long long v17 = [*((id *)v3 + 13) identifier];
      uint64_t v20 = *((void *)v3 + 12);
      id v29 = 0;
      uint64_t v21 = [v18 initWithEngine:v19 assetIdentifier:v17 mixerParameters:v20 error:&v29];
      id v16 = v29;
      int v22 = (void *)*((void *)v3 + 30);
      *((void *)v3 + 30) = v21;
    }
    id v23 = [v3 soundEvent];
    BOOL v24 = v23 == 0;

    if (v24)
    {
      char v26 = *re::audioLogObjects(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int buf = 138412546;
        *(void *)buf_4 = v3;
        *(_WORD *)&buf_4[8] = 2112;
        *(void *)&buf_4[10] = v16;
        _os_log_error_impl(&dword_233120000, v26, OS_LOG_TYPE_ERROR, "%@ failed to re-create after completion, error: %@", (uint8_t *)&buf, 0x16u);
      }
      [v3 changeToState:5];
    }
    else
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __27__REPHASESoundEvent__start__block_invoke_35;
      v27[3] = &unk_264BE2E38;
      id v28 = v3;
      [v28 prepareWithCompletion:v27];
    }
LABEL_37:
    atomic_store(1u, v3 + 65);
  }
LABEL_38:
}

void __27__REPHASESoundEvent__start__block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = *re::audioLogObjects(v3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      long long v10 = v4;
      _os_log_error_impl(&dword_233120000, v5, OS_LOG_TYPE_ERROR, "%@ failed to re-prepare after completion: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (BOOL)_resume
{
  v2 = self;
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v3 = atomic_load(&self->_state.__a_.__a_value);
  switch(v3)
  {
    case 0uLL:
    case 2uLL:
    case 5uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
      uint64_t v4 = (id)*re::audioLogObjects((re *)self);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        [(REPHASESoundEvent *)v2 prepareState];
        uint64_t v17 = *(void *)(v21 + 24);
        *(_DWORD *)int buf = 134218240;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v3;
        _os_log_error_impl(&dword_233120000, v4, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Resume] REPHASESoundEvent: playbackToken %llu, can't resume from this state %llu: ", buf, 0x16u);
        if (v22) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v22);
        }
      }

      LOBYTE(self) = 0;
      break;
    case 1uLL:
    case 0xBuLL:
      BOOL v5 = (id)*re::audioLogObjects((re *)self);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
      [(REPHASESoundEvent *)v2 prepareState];
      uint64_t v18 = *(void *)(v21 + 24);
      *(_DWORD *)int buf = 134218240;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v3;
      _os_log_debug_impl(&dword_233120000, v5, OS_LOG_TYPE_DEBUG, "[RE/PHASE] [Resume] REPHASESoundEvent: playbackToken %llu, do nothing for redundant calls to resume, just report success. state %llu: ", buf, 0x16u);
      uint64_t v14 = v22;
      if (!v22) {
        goto LABEL_15;
      }
      goto LABEL_14;
    case 3uLL:
      uint64_t v6 = (id)*re::audioLogObjects((re *)self);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        [(REPHASESoundEvent *)v2 prepareState];
        uint64_t v19 = *(void *)(v21 + 24);
        *(_DWORD *)int buf = 134218240;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 3;
        _os_log_debug_impl(&dword_233120000, v6, OS_LOG_TYPE_DEBUG, "[RE/PHASE] [Resume] REPHASESoundEvent: playbackToken %llu, resume the sound event. state %llu: ", buf, 0x16u);
        if (v22) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v22);
        }
      }

      int v7 = [(REPHASESoundEvent *)v2 soundEvent];
      BOOL v8 = v7 == 0;

      if (!v8)
      {
        __int16 v9 = [(REPHASESoundEvent *)v2 soundEvent];
        [v9 resume];
      }
      long long v10 = [(REPHASESoundEvent *)v2 externalStream];
      BOOL v11 = v10 == 0;

      if (!v11)
      {
        int v12 = [(REPHASESoundEvent *)v2 externalStream];
        [v12 resume];
      }
      if (v2->_stationaryTime.__engaged_) {
        v2->_stationaryTime.__engaged_ = 0;
      }
      [(REPHASESoundEvent *)v2 changeToState:1];
      BOOL v5 = [(REPHASESoundEvent *)v2 observer];
      [(REPHASESoundEvent *)v2 prepareState];
      LODWORD(v13) = *(_DWORD *)(*(void *)buf + 200);
      [v5 soundDidStartOrResume:v2 withGain:v13];
      uint64_t v14 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8]) {
LABEL_14:
      }
        std::__shared_weak_count::__release_shared[abi:nn180100](v14);
LABEL_15:

      LOBYTE(self) = 1;
      break;
    case 4uLL:
      uint64_t v15 = (id)*re::audioLogObjects((re *)self);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        [(REPHASESoundEvent *)v2 prepareState];
        uint64_t v20 = *(void *)(v21 + 24);
        *(_DWORD *)int buf = 134218240;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 4;
        _os_log_debug_impl(&dword_233120000, v15, OS_LOG_TYPE_DEBUG, "[RE/PHASE] [Resume] REPHASESoundEvent: playbackToken %llu, start the sound event. state %llu: ", buf, 0x16u);
        if (v22) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v22);
        }
      }

      LOBYTE(self) = [(REPHASESoundEvent *)v2 _start];
      break;
    default:
      return self & 1;
  }
  return self & 1;
}

- (BOOL)_pause
{
  unint64_t v2 = atomic_load(&self->_state.__a_.__a_value);
  if (v2 - 3 < 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t v4 = [(REPHASESoundEvent *)self soundEvent];

    if (v4)
    {
      BOOL v5 = [(REPHASESoundEvent *)self soundEvent];
      [v5 pause];
    }
    uint64_t v6 = [(REPHASESoundEvent *)self externalStream];

    if (v6)
    {
      int v7 = [(REPHASESoundEvent *)self externalStream];
      [v7 pause];
    }
    [(REPHASESoundEvent *)self changeToState:3];
    BOOL v8 = [(REPHASESoundEvent *)self observer];
    [v8 soundDidPause:self];

    return 1;
  }
  return 0;
}

- (BOOL)_stopAndDestroy
{
  atomic_store(1u, (unsigned __int8 *)&self->_isStopping);
  unint64_t v3 = [(REPHASESoundEvent *)self soundEvent];

  if (v3)
  {
    uint64_t v4 = [(REPHASESoundEvent *)self soundEvent];
    [v4 stopAndInvalidate];

    soundEvent = self->_soundEvent;
    self->_soundEvent = 0;
  }
  if (self->_soundEventAsset)
  {
    uint64_t v6 = [(PHASEEngine *)self->_engine assetRegistry];
    int v7 = [(PHASESoundEventNodeAsset *)self->_soundEventAsset identifier];
    [v6 unregisterAssetWithIdentifier:v7 completion:0];
  }
  BOOL v8 = [(REPHASESoundEvent *)self externalStreamController];

  if (v8)
  {
    __int16 v9 = [(REPHASESoundEvent *)self externalStreamController];
    [v9 stopAndInvalidate];

    externalStreamController = self->_externalStreamController;
    self->_externalStreamController = 0;
  }
  BOOL v11 = [(REPHASESoundEvent *)self externalStream];

  if (v11)
  {
    int v12 = [(REPHASESoundEvent *)self externalStream];
    char v13 = objc_opt_respondsToSelector();

    uint64_t v14 = [(REPHASESoundEvent *)self externalStream];
    uint64_t v15 = v14;
    if (v13) {
      [v14 stopAndInvalidate];
    }
    else {
      [v14 pause];
    }

    externalStream = self->_externalStream;
    self->_externalStream = 0;
  }
  [(REPHASESoundEvent *)self changeToState:0];
  return 1;
}

- (BOOL)_seekToTime:(double)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = atomic_load(&self->_state.__a_.__a_value);
  if (v5 > 0xD) {
    goto LABEL_7;
  }
  if (((1 << v5) & 0x3E25) != 0) {
    return 0;
  }
  if (((1 << v5) & 0x18) == 0
    || !self->_stationaryTime.__engaged_
    || vabdd_f64(self->_stationaryTime.var0.__val_, a3) >= 0.0000208333333)
  {
LABEL_7:
    int v7 = [(REPHASESoundEvent *)self soundEvent];

    if (v7)
    {
      __int16 v9 = *re::audioLogObjects(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        uint64_t v15 = self;
        __int16 v16 = 2048;
        double v17 = a3;
        _os_log_impl(&dword_233120000, v9, OS_LOG_TYPE_INFO, "%@ seeking to %5.3f", buf, 0x16u);
      }
      long long v10 = [(REPHASESoundEvent *)self changeToState:12];
      atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_latestSeekTarget);
      objc_initWeak((id *)buf, self);
      BOOL v11 = [(REPHASESoundEvent *)self soundEvent];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __33__REPHASESoundEvent__seekToTime___block_invoke;
      v12[3] = &unk_264BE2EB0;
      objc_copyWeak(v13, (id *)buf);
      v13[1] = *(id *)&a3;
      v13[2] = v10;
      [v11 seekToTime:v12 completion:a3];

      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
      return 0;
    }
  }
  return 1;
}

void __33__REPHASESoundEvent__seekToTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_21;
  }
  if (a2 != 2)
  {
    uint64_t v14 = *re::audioLogObjects((re *)WeakRetained);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v27 = 138412290;
      *(void *)&void v27[4] = v5;
      _os_log_error_impl(&dword_233120000, v14, OS_LOG_TYPE_ERROR, "%@ failed to seek.", v27, 0xCu);
    }
    goto LABEL_16;
  }
  std::recursive_mutex::lock((std::recursive_mutex *)(WeakRetained + 112));
  uint64_t v7 = *((void *)v5 + 6);
  if (v7)
  {
    BOOL v8 = (void **)*((void *)v5 + 2);
    unint64_t v9 = *((void *)v5 + 5);
    uint64_t v10 = *(uint64_t *)((char *)v8 + ((v9 >> 5) & 0x7FFFFFFFFFFFFF8));
    uint64_t v11 = v9;
    int v12 = (int *)(v10 + 16 * v9);
    if (*v12 == 2 && *(double *)(v10 + 16 * v9 + 8) == *(double *)(a1 + 40))
    {
      unint64_t v13 = v9 + 1;
      *((void *)v5 + 5) = v13;
      *((void *)v5 + 6) = v7 - 1;
      if (v13 >= 0x200)
      {
        operator delete(*v8);
        *((void *)v5 + 2) += 8;
        *((void *)v5 + 5) -= 256;
      }
      if (*(void *)(a1 + 48) != 1)
      {
        *((void *)v5 + 22) = *(void *)(a1 + 40);
        v5[184] = 1;
      }
      goto LABEL_15;
    }
    uint64_t v15 = *re::audioLogObjects(v6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *v12;
      uint64_t v17 = *(void *)(v10 + 16 * v11 + 8);
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)id v27 = 138413058;
      *(void *)&void v27[4] = v5;
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = v16;
      *(_WORD *)&v27[18] = 2048;
      *(void *)&v27[20] = v17;
      *(_WORD *)&v27[28] = 2048;
      *(void *)&v27[30] = v18;
      uint64_t v19 = "%@ unexpected command %d, %0.2f at front of queue after seek to %0.2f";
      uint64_t v20 = v15;
      uint32_t v21 = 38;
LABEL_23:
      _os_log_error_impl(&dword_233120000, v20, OS_LOG_TYPE_ERROR, v19, v27, v21);
    }
  }
  else
  {
    int v22 = *re::audioLogObjects(v6);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v27 = 138412290;
      *(void *)&void v27[4] = v5;
      uint64_t v19 = "%@ unexpectedly empty command queue after seek";
      uint64_t v20 = v22;
      uint32_t v21 = 12;
      goto LABEL_23;
    }
  }
LABEL_15:
  std::recursive_mutex::unlock((std::recursive_mutex *)(v5 + 112));
LABEL_16:
  id v23 = (re *)objc_msgSend(v5, "changeToState:", *(void *)(a1 + 48), *(_OWORD *)v27, *(void *)&v27[16], *(_OWORD *)&v27[24], v28);
  uint64_t v24 = v23;
  if (v23 != (re *)12)
  {
    unint64_t v25 = *re::audioLogObjects(v23);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v27 = 138412546;
      *(void *)&void v27[4] = v5;
      *(_WORD *)&v27[12] = 2048;
      *(void *)&v27[14] = v24;
      _os_log_error_impl(&dword_233120000, v25, OS_LOG_TYPE_ERROR, "%@ finished seeking in unexpected state %llu", v27, 0x16u);
    }
  }
  if (a2 == 2)
  {
    char v26 = [v5 observer];
    [v26 soundDidSeek:v5 toTime:*(double *)(a1 + 40)];

    [v5 updateCommandQueue];
  }
LABEL_21:
}

- (id)mixer
{
  unint64_t v2 = [(PHASESoundEvent *)self->_soundEvent mixers];
  unint64_t v3 = [v2 allValues];

  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndex:0];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)updateCommandQueue
{
  p_commandQueueMutex = &self->_commandQueueMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  [(REPHASESoundEvent *)self _updateCommandQueue];
  std::recursive_mutex::unlock((std::recursive_mutex *)p_commandQueueMutex);
}

- (void)_updateCommandQueue
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldExecuteCommand);
  if ((v2 & 1) != 0 && self->_commandQueue.c.__size_.__value_)
  {
    unint64_t start = self->_commandQueue.c.__start_;
    do
    {
      uint64_t v5 = *(uint64_t *)((char *)self->_commandQueue.c.__map_.__begin_ + ((start >> 5) & 0x7FFFFFFFFFFFFF8));
      int v6 = *(_DWORD *)(v5 + 16 * start);
      if (v6)
      {
        if (v6 == 2)
        {
          if (![(REPHASESoundEvent *)self _seekToTime:*(double *)(v5 + 16 * start + 8)])return; {
        }
          }
        else if (v6 != 1 || ![(REPHASESoundEvent *)self _pause])
        {
          return;
        }
      }
      else if (![(REPHASESoundEvent *)self _resume])
      {
        return;
      }
      unint64_t value = self->_commandQueue.c.__size_.__value_ - 1;
      unint64_t start = self->_commandQueue.c.__start_ + 1;
      self->_commandQueue.c.__start_ = start;
      self->_commandQueue.c.__size_.__value_ = value;
      if (start >= 0x200)
      {
        operator delete(*(void **)self->_commandQueue.c.__map_.__begin_);
        ++self->_commandQueue.c.__map_.__begin_;
        unint64_t value = self->_commandQueue.c.__size_.__value_;
        unint64_t start = self->_commandQueue.c.__start_ - 256;
        self->_commandQueue.c.__start_ = start;
      }
    }
    while (value);
  }
}

- (void)prepareWithCompletion:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v50 = a3;
  uint64_t v4 = [(REPHASESoundEvent *)self playbackStateChangeHandler];

  if (!v4)
  {
    [(REPHASESoundEvent *)self prepareState];
    [(REPHASESoundEvent *)self setPlaybackStateChangeHandler:*(void *)(*(void *)buf + 328)];
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  objc_initWeak(&location, self);
  if (re::internal::enableSignposts(0, 0))
  {
    [(REPHASESoundEvent *)self prepareState];
    [(REPHASESoundEvent *)self prepareState];
    [(REPHASESoundEvent *)self prepareState];
    kdebug_trace();
    if (v65) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v65);
    }
    if (v79) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v79);
    }
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__REPHASESoundEvent_prepareWithCompletion___block_invoke;
  aBlock[3] = &unk_264BE2ED8;
  v49 = v64;
  objc_copyWeak(v64, &location);
  void aBlock[4] = self;
  id v5 = v50;
  id v63 = v5;
  v51 = _Block_copy(aBlock);
  [(REPHASESoundEvent *)self prepareState];
  float v6 = __exp10f(*(float *)(*(void *)buf + 188) / 20.0);
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
  }
  [(REPHASESoundEvent *)self prepareState];
  float v7 = __exp10f(*(float *)(*(void *)buf + 192) / 20.0);
  BOOL v8 = *(re **)&buf[8];
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
  }
  unint64_t v9 = (id)*re::audioLogObjects(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [(REPHASESoundEvent *)self prepareState];
    float v10 = *(float *)(v78 + 200);
    [(REPHASESoundEvent *)self prepareState];
    float v11 = *((float *)v64[1] + 49);
    [(REPHASESoundEvent *)self prepareState];
    uint64_t v12 = *(void *)(v60 + 24);
    [(REPHASESoundEvent *)self prepareState];
    uint64_t v13 = *(void *)(v58 + 64);
    *(_DWORD *)int buf = 134219264;
    *(double *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v6;
    __int16 v70 = 2048;
    double v71 = v7;
    __int16 v72 = 2048;
    double v73 = v11;
    __int16 v74 = 2048;
    uint64_t v75 = v12;
    __int16 v76 = 2048;
    uint64_t v77 = v13;
    _os_log_impl(&dword_233120000, v9, OS_LOG_TYPE_DEFAULT, "[RE/PHASE] [Prepare] REPHASESoundEvent preparing with gain=%.2f, reverb=%.2f, direct=%.2f, rate=%.2f for token=%llu, assetID=%llu", buf, 0x3Eu);
    if (v59) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v59);
    }
    if (v61) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v61);
    }
    if (v65) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v65);
    }
    if (v79) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v79);
    }
  }

  uint64_t v14 = [(REPHASESoundEvent *)self paramForKey:@"reverbSend"];
  long long v47 = v14;
  if (v14)
  {
    [(REPHASESoundEvent *)self prepareState];
    LODWORD(v15) = *(_DWORD *)(*(void *)buf + 188);
    [(REPHASESoundEvent *)self setCachedReverbSendLevel:v15];
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
    [v14 fadeToValue:v6 duration:0.0];
  }
  int v16 = [(REPHASESoundEvent *)self paramForKey:@"directSend", v47];
  if (v16)
  {
    [(REPHASESoundEvent *)self prepareState];
    LODWORD(v17) = *(_DWORD *)(*(void *)buf + 192);
    [(REPHASESoundEvent *)self setCachedDirectSendLevel:v17];
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
    [v16 fadeToValue:v7 duration:0.0];
  }
  uint64_t v18 = [(REPHASESoundEvent *)self paramForKey:@"rate"];
  if (v18)
  {
    [(REPHASESoundEvent *)self prepareState];
    LODWORD(v19) = *(_DWORD *)(*(void *)buf + 196);
    [(REPHASESoundEvent *)self setCachedPlaybackSpeed:v19];
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
    [(REPHASESoundEvent *)self prepareState];
    [v18 fadeToValue:*(float *)(*(void *)buf + 196) duration:0.0];
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  uint64_t v20 = [(REPHASESoundEvent *)self paramForKey:@"gain"];
  if (v20)
  {
    [(REPHASESoundEvent *)self prepareState];
    [v20 fadeToValue:*(float *)(*(void *)buf + 200) duration:0.0];
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  [(REPHASESoundEvent *)self prepareState];
  int v21 = *(unsigned __int8 *)(*(void *)buf + 102);
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
  }
  int v22 = [(REPHASESoundEvent *)self soundEvent];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    [(REPHASESoundEvent *)self changeToState:10];
    uint64_t v24 = [(REPHASESoundEvent *)self soundEvent];
    [v24 prepareWithCompletion:v51];

    [(REPHASESoundEvent *)self prepareState];
    CMTimeValue v78 = *(void *)(*(void *)buf + 224);
    CMTimeFlags v25 = *(_DWORD *)(*(void *)buf + 236);
    LODWORD(v79) = *(_DWORD *)(*(void *)buf + 232);
    CMTimeEpoch v26 = *(void *)(*(void *)buf + 240);
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
    if (v25)
    {
      time1.unint64_t value = v78;
      time1.timescale = (int)v79;
      time1.flags = v25;
      time1.epoch = v26;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
      BOOL v27 = CMTimeCompare(&time1, &time2) != 0;
      if (v21) {
        goto LABEL_58;
      }
    }
    else
    {
      BOOL v27 = 0;
      if (v21) {
        goto LABEL_58;
      }
    }
    if (!v27)
    {
LABEL_69:
      id v31 = 0;
      goto LABEL_77;
    }
LABEL_58:
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
    if (v27)
    {
      time.unint64_t value = v78;
      time.timescale = (int)v79;
      time.flags = v25;
      time.epoch = v26;
      double Seconds = CMTimeGetSeconds(&time);
      id v37 = *re::audioLogObjects(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = Seconds;
        _os_log_impl(&dword_233120000, v37, OS_LOG_TYPE_DEFAULT, "%@ seeking to initial target %0.2f", buf, 0x16u);
      }
      atomic_store(*(unint64_t *)&Seconds, (unint64_t *)&self->_latestSeekTarget);
      uint64_t v38 = [(REPHASESoundEvent *)self soundEvent];
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __43__REPHASESoundEvent_prepareWithCompletion___block_invoke_53;
      v53[3] = &unk_264BE2F00;
      objc_copyWeak(v54, &location);
      v54[1] = *(id *)&Seconds;
      [v38 seekToTime:v53 completion:Seconds];

      objc_destroyWeak(v54);
    }
    if (v21)
    {
      [(REPHASESoundEvent *)self prepareState];
      id v39 = *(std::__shared_weak_count **)&buf[8];
      *(unsigned char *)(*(void *)buf + 102) = 0;
      if (v39) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v39);
      }
      v40 = *re::audioLogObjects((re *)v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_233120000, v40, OS_LOG_TYPE_DEFAULT, "%@ force start", buf, 0xCu);
      }
      [(REPHASESoundEvent *)self _start];
    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_commandQueueMutex);
    goto LABEL_69;
  }
  uint64_t v28 = [(REPHASESoundEvent *)self externalStreamController];

  if (v28)
  {
    id v29 = [(REPHASESoundEvent *)self externalStreamController];
    id v52 = 0;
    int v30 = [v29 prepareAndReturnError:&v52];
    id v31 = v52;

    if (!v30)
    {
      v43 = (id)*re::audioLogObjects(v32);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        [(REPHASESoundEvent *)self prepareState];
        uint64_t v46 = *(void *)(v78 + 24);
        *(_DWORD *)int buf = 134218242;
        *(void *)&uint8_t buf[4] = v46;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        _os_log_error_impl(&dword_233120000, v43, OS_LOG_TYPE_ERROR, "external stream controller %llu failed with error: %@", buf, 0x16u);
        if (v79) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v79);
        }
      }

      (*((void (**)(id, id))v5 + 2))(v5, v31);
      goto LABEL_77;
    }
    if (v21)
    {
      [(REPHASESoundEvent *)self prepareState];
      uint64_t v33 = *(std::__shared_weak_count **)&buf[8];
      *(unsigned char *)(*(void *)buf + 102) = 0;
      if (v33) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v33);
      }
      unsigned int v34 = *re::audioLogObjects((re *)v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_233120000, v34, OS_LOG_TYPE_DEFAULT, "%@ force start", buf, 0xCu);
      }
      [(REPHASESoundEvent *)self _start];
    }
  }
  else
  {
    id v31 = 0;
  }
  id v41 = [(REPHASESoundEvent *)self externalStream];
  BOOL v42 = v41 == 0;

  if (!v42)
  {
    [(REPHASESoundEvent *)self changeToState:4];
    [(REPHASESoundEvent *)self updateCommandQueue];
LABEL_76:
    [(REPHASESoundEvent *)self changeToState:4];
    [(REPHASESoundEvent *)self updateCommandQueue];
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    goto LABEL_77;
  }
  if (v28) {
    goto LABEL_76;
  }
  if (!v31)
  {
    char v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v67 = *MEMORY[0x263F08320];
    v68 = @"unknown error preparing REPHASESoundEvent";
    v45 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    id v31 = [v44 errorWithDomain:@"com.apple.re.internal" code:-210 userInfo:v45];
  }
  (*((void (**)(id, id))v5 + 2))(v5, v31);
LABEL_77:

  objc_destroyWeak(v49);
  objc_destroyWeak(&location);
}

void __43__REPHASESoundEvent_prepareWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  WeakRetained = (re *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    float v6 = *re::audioLogObjects(WeakRetained);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*((void *)v5 + 37) + 24);
      int buf = 134217984;
      *(void *)buf_4 = v7;
      _os_log_impl(&dword_233120000, v6, OS_LOG_TYPE_DEFAULT, "[RE/PHASE] [Prepare] REPHASESoundEvent prepareWithCompletion callback invoked for token=%llu", (uint8_t *)&buf, 0xCu);
    }
    if (a2 == 1)
    {
      BOOL v8 = (re *)re::internal::enableSignposts(0, 0);
      if (v8)
      {
        [*(id *)(a1 + 32) prepareState];
        unint64_t v9 = [(re *)v5 soundEvent];
        [v9 preparedHostTime];
        [*(id *)(a1 + 32) prepareState];
        [*(id *)(a1 + 32) prepareState];
        kdebug_trace();
        if (v16) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v16);
        }
        if (v17) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v17);
        }

        BOOL v8 = *(re **)&buf_4[4];
        if (*(void *)&buf_4[4]) {
          std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf_4[4]);
        }
      }
      float v10 = *re::audioLogObjects(v8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*((void *)v5 + 37) + 24);
        int buf = 134217984;
        *(void *)buf_4 = v11;
        _os_log_impl(&dword_233120000, v10, OS_LOG_TYPE_DEFAULT, "[RE/PHASE] [Prepare] REPHASESoundEvent prepareWithCompletion success for token=%llu", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v12 = 0;
      if ([(re *)v5 changeFromExpectedState:10 toState:4])
      {
        *((void *)v5 + 22) = 0;
        *((unsigned char *)v5 + 184) = 1;
      }
    }
    else
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"failed to prepare PHASESoundEvent with reason %ld", a2);
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08320];
      double v19 = v13;
      double v15 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      uint64_t v12 = [v14 errorWithDomain:@"com.apple.re.internal" code:-210 userInfo:v15];

      [(re *)v5 changeToState:5];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (!v12) {
      [(re *)v5 updateCommandQueue];
    }
  }
}

void __43__REPHASESoundEvent_prepareWithCompletion___block_invoke_53(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      float v6 = [WeakRetained observer];
      [v6 soundDidSeek:v5 toTime:*(double *)(a1 + 40)];
    }
    else
    {
      uint64_t v7 = *re::audioLogObjects((re *)WeakRetained);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412546;
        unint64_t v9 = v5;
        __int16 v10 = 2048;
        uint64_t v11 = a2;
        _os_log_error_impl(&dword_233120000, v7, OS_LOG_TYPE_ERROR, "%@ failed to seek from: %ld", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (void)pause
{
  p_commandQueueMutex = &self->_commandQueueMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  int v4 = 1;
  std::deque<REPHASESoundEventCommandState>::emplace_back<REPHASESoundEventCommand>(&self->_commandQueue.c.__map_.__first_, &v4);
  [(REPHASESoundEvent *)self _updateCommandQueue];
  std::recursive_mutex::unlock((std::recursive_mutex *)p_commandQueueMutex);
}

- (void)resume
{
  p_commandQueueMutex = &self->_commandQueueMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  int v4 = 0;
  std::deque<REPHASESoundEventCommandState>::emplace_back<REPHASESoundEventCommand>(&self->_commandQueue.c.__map_.__first_, &v4);
  [(REPHASESoundEvent *)self _updateCommandQueue];
  std::recursive_mutex::unlock((std::recursive_mutex *)p_commandQueueMutex);
}

- (void)stopAndDestroy
{
  p_commandQueueMutex = &self->_commandQueueMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  [(REPHASESoundEvent *)self _stopAndDestroy];
  std::recursive_mutex::unlock((std::recursive_mutex *)p_commandQueueMutex);
}

- (BOOL)seekToTime:(double)a3
{
  double v3 = a3;
  if (a3 < 0.0)
  {
    id v5 = *re::audioLogObjects((re *)self);
    double v3 = 0.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl(&dword_233120000, v5, OS_LOG_TYPE_ERROR, "PHASE Seeking < 0, not supported. Capping to 0", v13, 2u);
    }
  }
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  end = self->_commandQueue.c.__map_.__end_;
  begin = self->_commandQueue.c.__map_.__begin_;
  if (end == begin) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 32 * ((char *)end - (char *)begin) - 1;
  }
  unint64_t value = self->_commandQueue.c.__size_.__value_;
  unint64_t v10 = value + self->_commandQueue.c.__start_;
  if (v8 == v10)
  {
    std::deque<REPHASESoundEventCommandState>::__add_back_capacity(&self->_commandQueue.c.__map_.__first_);
    unint64_t value = self->_commandQueue.c.__size_.__value_;
    begin = self->_commandQueue.c.__map_.__begin_;
    unint64_t v10 = self->_commandQueue.c.__start_ + value;
  }
  uint64_t v11 = *(uint64_t *)((char *)begin + ((v10 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v10;
  *(_DWORD *)uint64_t v11 = 2;
  *(double *)(v11 + 8) = v3;
  self->_commandQueue.c.__size_.__value_ = value + 1;
  [(REPHASESoundEvent *)self _updateCommandQueue];
  std::recursive_mutex::unlock((std::recursive_mutex *)&self->_commandQueueMutex);
  return 1;
}

- (unint64_t)state
{
  return atomic_load(&self->_state.__a_.__a_value);
}

- (double)latestSeekTarget
{
  return COERCE_DOUBLE(atomic_load((unint64_t *)&self->_latestSeekTarget));
}

- (id)paramForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(REPHASESoundEvent *)self soundEvent];

  if (v5) {
    [(REPHASESoundEvent *)self soundEvent];
  }
  else {
  float v6 = [(REPHASESoundEvent *)self externalStreamController];
  }
  uint64_t v7 = [v6 metaParameters];
  uint64_t v8 = [v7 objectForKey:v4];

  return v8;
}

- (id)description
{
  uint64_t v3 = [(REPHASESoundEvent *)self externalStream];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(REPHASESoundEvent *)self externalStreamController];

    if (v5)
    {
      float v6 = NSString;
      uint64_t v7 = [(REPHASESoundEvent *)self externalStream];
      uint64_t v8 = [(REPHASESoundEvent *)self externalStreamController];
      [(REPHASESoundEvent *)self prepareState];
      uint64_t v9 = *(void *)(v19 + 24);
      [(REPHASESoundEvent *)self prepareState];
      unint64_t v10 = [v6 stringWithFormat:@"<REPHASESoundEvent: %p, stream=%@, controller=%@, token=%llu, assetID=%llu>", self, v7, v8, v9, *(void *)(v17 + 64)];
      if (v18) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v18);
      }
      if (v20) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v20);
      }

      goto LABEL_19;
    }
  }
  uint64_t v11 = [(REPHASESoundEvent *)self soundEvent];

  if (v11)
  {
    uint64_t v12 = [(REPHASESoundEvent *)self soundEvent];
LABEL_14:
    uint64_t v7 = (void *)v12;
    goto LABEL_15;
  }
  uint64_t v13 = [(REPHASESoundEvent *)self externalStreamController];

  if (v13)
  {
    uint64_t v12 = [(REPHASESoundEvent *)self externalStreamController];
    goto LABEL_14;
  }
  uint64_t v7 = [(REPHASESoundEvent *)self externalStream];

  if (v7)
  {
    uint64_t v12 = [(REPHASESoundEvent *)self externalStream];
    goto LABEL_14;
  }
LABEL_15:
  uint64_t v14 = NSString;
  [(REPHASESoundEvent *)self prepareState];
  uint64_t v15 = *(void *)(v19 + 24);
  [(REPHASESoundEvent *)self prepareState];
  unint64_t v10 = [v14 stringWithFormat:@"<REPHASESoundEvent: %p, object=%@, token=%llu, assetID=%llu>", self, v7, v15, *(void *)(v17 + 64)];
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v18);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v20);
  }
LABEL_19:

  return v10;
}

- (double)sourcePose
{
  v1 = *(void **)(a1 + 80);
  if (!v1) {
    return 0.0;
  }
  [v1 worldTransform];
  return result;
}

- (REPHASESoundEventObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (REPHASESoundEventObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (shared_ptr<re::audio::REPHASESoundPrepareState>)prepareState
{
  cntrl = self->_prepareState.__cntrl_;
  void *v2 = self->_prepareState.__ptr_;
  v2[1] = (REPHASESoundPrepareState *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (REPHASESoundPrepareState *)self;
  return result;
}

- (void)setPrepareState:(shared_ptr<re::audio::REPHASESoundPrepareState>)a3
{
  id v4 = *(REPHASESoundPrepareState **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_prepareState.__cntrl_;
  self->_prepareState.__ptr_ = v4;
  self->_prepareState.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (PHASESoundEvent)soundEvent
{
  return self->_soundEvent;
}

- (PHASEExternalOutputStreamController)externalStreamController
{
  return self->_externalStreamController;
}

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)objc_getProperty(self, a2, 256, 1);
}

- (float)cachedPlaybackSpeed
{
  return self->_cachedPlaybackSpeed;
}

- (void)setCachedPlaybackSpeed:(float)a3
{
  self->_cachedPlaybackSpeed = a3;
}

- (float)cachedReverbSendLevel
{
  return self->_cachedReverbSendLevel;
}

- (void)setCachedReverbSendLevel:(float)a3
{
  self->_cachedReverbSendLevel = a3;
}

- (float)cachedDirectSendLevel
{
  return self->_cachedDirectSendLevel;
}

- (void)setCachedDirectSendLevel:(float)a3
{
  self->_cachedDirectSendLevel = a3;
}

- (BOOL)soundEventPlayed
{
  return self->_soundEventPlayed;
}

- (void)setSoundEventPlayed:(BOOL)a3
{
  self->_soundEventPlayed = a3;
}

- (PHASEExternalOutputStream)externalStream
{
  return self->_externalStream;
}

- (void)setExternalStream:(id)a3
{
}

- (AUAudioUnit)audioUnit
{
  return self->_audioUnit;
}

- (void)setAudioUnit:(id)a3
{
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (void)setRenderBlock:(id)a3
{
}

- (id)playbackStateChangeHandler
{
  return self->_playbackStateChangeHandler;
}

- (void)setPlaybackStateChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->_prepareState.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong(&self->_playbackStateChangeHandler, 0);
  objc_storeStrong(&self->_renderBlock, 0);
  objc_storeStrong((id *)&self->_audioUnit, 0);
  objc_storeStrong((id *)&self->_externalStream, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_externalStreamController, 0);
  objc_storeStrong((id *)&self->_soundEvent, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_phaseQueue, 0);
  objc_storeStrong(&self->_soundEventFactory, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_commandQueueMutex);
  objc_storeStrong((id *)&self->_soundEventAsset, 0);
  objc_storeStrong((id *)&self->_mixerParameters, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  begin = self->_commandQueue.c.__map_.__begin_;
  end = self->_commandQueue.c.__map_.__end_;
  self->_commandQueue.c.__size_.__value_ = 0;
  unint64_t v6 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_commandQueue.c.__map_.__end_;
      begin = self->_commandQueue.c.__map_.__begin_ + 1;
      self->_commandQueue.c.__map_.__begin_ = begin;
      unint64_t v6 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  unint64_t v7 = v6 >> 3;
  if (v7 == 1)
  {
    unint64_t v8 = 128;
    goto LABEL_9;
  }
  if (v7 == 2)
  {
    unint64_t v8 = 256;
LABEL_9:
    self->_commandQueue.c.__start_ = v8;
  }
  if (begin != end)
  {
    do
    {
      uint64_t v9 = *begin++;
      operator delete(v9);
    }
    while (begin != end);
    uint64_t v11 = self->_commandQueue.c.__map_.__begin_;
    unint64_t v10 = self->_commandQueue.c.__map_.__end_;
    if (v10 != v11) {
      self->_commandQueue.c.__map_.__end_ = (REPHASESoundEventCommandState **)((char *)v10
    }
                                                                             + (((char *)v11 - (char *)v10 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_commandQueue.c.__map_.__first_;
  if (first)
  {
    operator delete(first);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)&self->_commandQueue.c.__start_ = 0u;
  *(_OWORD *)&self->_commandQueue.c.__map_.__end_ = 0u;
  *(_OWORD *)&self->_commandQueue.c.__map_.__first_ = 0u;
  MEMORY[0x237DBC860](&self->_commandQueueMutex, a2);
  self->_stationaryTime.var0.__null_state_ = 0;
  self->_stationaryTime.__engaged_ = 0;
  self->_prepareState.__ptr_ = 0;
  self->_prepareState.__cntrl_ = 0;
  return self;
}

@end