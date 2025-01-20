@interface REPHASEContext
- (BOOL)addEventIfStillPreparing:(id)a3 forToken:(unint64_t)a4;
- (BOOL)doCleanUpSoundEventForToken:(unint64_t)a3 ifNotInScene:(unint64_t)a4;
- (BOOL)engineShouldBeRunning;
- (BOOL)eventBeingPrepared:(unint64_t)a3;
- (BOOL)getConfigurationForAudioAssetID:(unint64_t)a3 configuration:(void *)a4;
- (BOOL)isListenerCreatedInScene;
- (DynamicArray<re::audio::PHASEOccluderData>)createPHASEOccluders:(SEL)a3;
- (DynamicArray<re::audio::PHASEOccluderUpdateData>)updatePHASEOccluders:(SEL)a3;
- (NSURL)customHRIRURL;
- (PHASECardioidDirectivityModelParameters)humanDirectivity;
- (PHASEEngine)engine;
- (PHASEEngine)maybeEngine;
- (PHASEListener)listener;
- (PHASENumberMetaParameterDefinition)gainLinearParamDefinition;
- (PHASENumberMetaParameterDefinition)rateParamDefinition;
- (PHASEOccluderData)createPHASEOccluderData:(SEL)a3;
- (PHASEOccluderUpdateData)createPHASEOccluderUpdateData:(SEL)a3;
- (REPHASEContext)initWithSampleRate:(double)a3 phaseQueue:(id)a4 audioEngineRunnableManager:(shared_ptr<re::AudioEngineRunnableManager>)a5;
- (double)doubleFromPlistValue:(id)a3 defaultValue:(double)a4;
- (double)sampleRate;
- (float)getSpaceBlendLevel;
- (id).cxx_construct;
- (id)baseMixerDefinitionWith:(const void *)a3;
- (id)createAcousticMaterialsArrayWithAbsorption:(DynamicArray<re:(DynamicArray<re:(DynamicArray<re::AcousticSoundReductionMaterial> *)a5 :AcousticScatteringMaterial> *)a4 :AcousticAbsorptionMaterial> *)a3 scattering:soundReduction:;
- (id)createPHASEShape:(const void *)a3;
- (id)createPHASEShapeAndOccluder:(const void *)a3;
- (id)createPhaseShapeWithMeshID:(unint64_t)a3 materials:(id)a4 mdlMesh:(id)a5 arkitMesh:(BOOL)a6 meshType:(unsigned __int8)a7;
- (id)createSamplerDefinitionForToken:(unint64_t)a3;
- (id)eventFor:(unint64_t)a3;
- (id)fillOutMeshBoundingBoxInformation:;
- (id)getListener;
- (id)getOrCreateSpatialMixerDefinitionUsing:(const void *)a3;
- (id)getPhaseShapeFromCacheWithMeshID:(unint64_t)a3;
- (id)getSessionRoot:(unint64_t)a3;
- (id)mixerParametersForPrepareState:(const void *)a3 source:(id)a4 listener:(id)a5 mixerIdentifiers:(id)a6;
- (id)phaseIDForAssetID:(unint64_t)a3;
- (id)samplerDefForFileAsset:(unint64_t)a3 mixerDefinition:(id)a4 prepareState:(const void *)a5;
- (id)samplerDefForFileAsset:(unint64_t)a3 with:(const void *)a4;
- (id)sourceObjectForEntityID:(unint64_t)a3;
- (int64_t)getReverbPreset;
- (shared_ptr<re::audio::REPHASEAudioScene>)sceneForID:(unint64_t)a3;
- (shared_ptr<re::audio::REPHASEEntity>)_getEntityUnderLock:(unint64_t)a3;
- (shared_ptr<re::audio::REPHASEEntity>)getEntity:(unint64_t)a3;
- (unint64_t)phaseShapeCount;
- (unint64_t)uniqueEventCount;
- (unordered_map<unsigned)copyPhaseShapeCache;
- (unordered_set<unsigned)playbackClientsWithPreparedOrPreparingSounds;
- (unsigned)getPlayingSoundEventsCount;
- (unsigned)getPreparingSoundEventsCount;
- (void)addAudioAssetID:(unint64_t)a3 configuration:(const void *)a4;
- (void)addOccluder:(const void *)a3;
- (void)addOccluder:(id)a3 toScene:(unint64_t)a4 entity:(unint64_t)a5;
- (void)addPhaseShapeToCache:(id)a3 meshID:(unint64_t)a4 mesh:(id)a5;
- (void)applyCustomHRIR;
- (void)applyMeshEvents:(const void *)a3;
- (void)applyMeshRemoval:(const void *)a3;
- (void)applyMeshRemovals:(const void *)a3;
- (void)applyOccluderAdditions:(const void *)a3;
- (void)applyOccluderUpdates:(const void *)a3;
- (void)applyReverbPreset;
- (void)applySpaceBlendLevel;
- (void)clearPhaseShapeCache;
- (void)clearPreparingStateForToken:(unint64_t)a3;
- (void)createListenerIfPending;
- (void)decrementOrDestroyEntityWithZeroCount:(unint64_t)a3;
- (void)fillOutDebugInformation:(id)a3;
- (void)fillOutMeshBoundingBoxInformation:(id)a3;
- (void)getSourceCount:(unsigned int *)a3 occluderCount:(unsigned int *)a4;
- (void)loadHumanDirectivityPlistFromURL:(id)a3;
- (void)prepare:(shared_ptr<re::audio::REPHASESoundPrepareState>)a3;
- (void)prepareExternalType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:;
- (void)prepareFileGroupType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:;
- (void)prepareFileType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:;
- (void)prepareGeneratorType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:;
- (void)removeAudioAssetID:(unint64_t)a3;
- (void)removeEntity:(unint64_t)a3;
- (void)removeListener;
- (void)removeOccluderFromScene:(unint64_t)a3 entity:(unint64_t)a4;
- (void)removePhaseShapeFromCacheWithMeshID:(unint64_t)a3;
- (void)removeSessionRoot:(unint64_t)a3;
- (void)setCustomHRIRURL:(id)a3;
- (void)setPreparingWithData:(RESoundEventPreparingData)a3 forToken:(unint64_t)a4;
- (void)setReverbPreset:(int64_t)a3 allowingSpaceBlend:(BOOL)a4;
- (void)setSpaceBlendLevel:(float)a3;
- (void)setSpaceBlendTargetPresetOrientation:(uint64_t)a1;
- (void)stopAllAndReset;
- (void)update;
- (void)updateOccluder:(const void *)a3;
@end

@implementation REPHASEContext

- (REPHASEContext)initWithSampleRate:(double)a3 phaseQueue:(id)a4 audioEngineRunnableManager:(shared_ptr<re::AudioEngineRunnableManager>)a5
{
  ptr = a5.__ptr_;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)REPHASEContext;
  v10 = [(REPHASEContext *)&v21 init];
  v11 = v10;
  if (v10)
  {
    atomic_store(0, (unsigned __int8 *)&v10->_stoppedAndDestroyed);
    v10->_reverbPreset = -1;
    v10->_allowSpaceBlend = 1;
    v10->_spaceBlendLevel = 0.0;
    v10->_sampleRate = a3;
    uint64_t v12 = [objc_alloc(MEMORY[0x263F14968]) initWithValue:@"gain" minimum:1.0 maximum:0.0 identifier:4.0];
    gainLinearParamDefinition = v11->_gainLinearParamDefinition;
    v11->_gainLinearParamDefinition = (PHASENumberMetaParameterDefinition *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F14968]) initWithValue:@"rate" minimum:1.0 maximum:0.25 identifier:4.0];
    rateParamDefinition = v11->_rateParamDefinition;
    v11->_rateParamDefinition = (PHASENumberMetaParameterDefinition *)v14;

    v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v11->_directpathEnabled = [v16 BOOLForKey:@"com.apple.re.audio.directpathenabled"];
    objc_storeStrong((id *)&v11->_phaseQueue, a4);
    v18 = *(AudioEngineRunnableManager **)ptr;
    uint64_t v17 = *((void *)ptr + 1);
    if (v17) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v11->_audioEngineRunnableManager.__cntrl_;
    v11->_audioEngineRunnableManager.__ptr_ = v18;
    v11->_audioEngineRunnableManager.__cntrl_ = (__shared_weak_count *)v17;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
    }
  }
  return v11;
}

- (void)fillOutMeshBoundingBoxInformation:(id)a3
{
  id v4 = a3;
  [(REPHASEContext *)self copyPhaseShapeCache];
  long long v42 = 0uLL;
  long long v41 = 0uLL;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = v44;
  if (v44)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    do
    {
      uint64_t v7 = (uint64_t)v6[2];
      id v8 = v6[4];
      [v8 boundingBox];
      long long v29 = v10;
      long long v30 = v9;
      [v8 boundingBox];
      int v38 = v11;
      int v40 = v12;
      uint64_t v37 = v13;
      uint64_t v39 = v14;
      [v8 boundingBox];
      int v34 = v15;
      int v36 = v16;
      uint64_t v33 = v17;
      uint64_t v35 = v18;
      v19 = -[REPHASEContext fillOutMeshBoundingBoxInformation:]::$_5::operator()(v7, &v39, &v33);
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"PHASEMesh-%llu", v7);
      [v5 setObject:v19 forKey:v20];

      if (v6 == v44)
      {
        [v8 boundingBox];
        long long v32 = v25;
        long long v42 = v25;
        [v8 boundingBox];
        long long v31 = v26;
        long long v41 = v26;
      }
      else
      {
        HIDWORD(v23) = HIDWORD(v32);
        float v22 = *((float *)&v32 + 2);
        *(int8x8_t *)&long long v21 = vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)&v32, *(float32x2_t *)&v29), *(int8x8_t *)&v29, *(int8x8_t *)&v32);
        *(int8x8_t *)&long long v23 = vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)&v30, *(float32x2_t *)&v31), *(int8x8_t *)&v30, *(int8x8_t *)&v31);
        if (*((float *)&v32 + 2) > *((float *)&v29 + 2)) {
          float v22 = *((float *)&v29 + 2);
        }
        *(void *)&long long v42 = v21;
        *((float *)&v21 + 2) = v22;
        long long v32 = v21;
        *((float *)&v42 + 2) = v22;
        float v24 = *((float *)&v30 + 2);
        if (*((float *)&v31 + 2) >= *((float *)&v30 + 2)) {
          float v24 = *((float *)&v31 + 2);
        }
        *(void *)&long long v41 = v23;
        *((float *)&v23 + 2) = v24;
        long long v31 = v23;
        *((float *)&v41 + 2) = v24;
      }

      v6 = (id *)*v6;
    }
    while (v6);
  }
  v27 = -[REPHASEContext fillOutMeshBoundingBoxInformation:]::$_5::operator()(0, &v42, &v41);
  [v5 setObject:v27 forKey:@"Overall-PHASEMesh"];

  [v4 setObject:v5 forKey:@"PHASEMeshBoundingBoxInfo"];
  std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__deallocate_node(v44);
  v28 = v43;
  v43 = 0;
  if (v28) {
    operator delete(v28);
  }
}

- (id)fillOutMeshBoundingBoxInformation:
{
  v27[3] = *MEMORY[0x263EF8340];
  id v23 = [MEMORY[0x263EFF980] array];
  v26[0] = @"minBounds";
  LODWORD(v6) = *a2;
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  v25[0] = v7;
  LODWORD(v8) = a2[1];
  long long v9 = [NSNumber numberWithFloat:v8];
  v25[1] = v9;
  LODWORD(v10) = a2[2];
  int v11 = [NSNumber numberWithFloat:v10];
  v25[2] = v11;
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  v27[0] = v12;
  v26[1] = @"maxBounds";
  LODWORD(v13) = *a3;
  uint64_t v14 = [NSNumber numberWithFloat:v13];
  v24[0] = v14;
  LODWORD(v15) = a3[1];
  int v16 = [NSNumber numberWithFloat:v15];
  v24[1] = v16;
  LODWORD(v17) = a3[2];
  uint64_t v18 = [NSNumber numberWithFloat:v17];
  v24[2] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  v27[1] = v19;
  v26[2] = @"meshID";
  v20 = [NSNumber numberWithUnsignedLongLong:a1];
  v27[2] = v20;
  long long v21 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  [v23 addObject:v21];

  return v23;
}

- (void)fillOutDebugInformation:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (i = &self->_scenes.__table_.__p1_;
        ;
        re::audio::REPHASEAudioScene::fillOutDebugInformation((re::audio::REPHASEAudioScene *)i[3].__value_.__next_, v4))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
  }
  if (self->_engine)
  {
    uint64_t v7 = *re::audioLogObjects(v5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_233120000, v7, OS_LOG_TYPE_DEFAULT, "Filling out PHASE Mesh Info", v8, 2u);
    }
    [(REPHASEContext *)self fillOutMeshBoundingBoxInformation:v4];
  }
  os_unfair_lock_unlock(&self->_scenesMutex.m_lock);
}

- (PHASEEngine)maybeEngine
{
  p_audioEngineMutex = &self->_audioEngineMutex;
  os_unfair_lock_lock(&self->_audioEngineMutex.m_lock);
  id v4 = self->_engine;
  os_unfair_lock_unlock(&p_audioEngineMutex->m_lock);
  return v4;
}

- (PHASEEngine)engine
{
  p_audioEngineMutex = &self->_audioEngineMutex;
  os_unfair_lock_lock(&self->_audioEngineMutex.m_lock);
  engine = self->_engine;
  if (!engine)
  {
    double v6 = *re::audioLogObjects(v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_233120000, v6, OS_LOG_TYPE_DEFAULT, "Initializing Phase audio engine... update mode = manual", (uint8_t *)v13, 2u);
    }
    pthread_t v7 = pthread_self();
    re::internal::AriadneSignpostScopeGuard::AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v13, 2522, (uint64_t)v7);
    REAudioCreatePHASEEngine();
    double v8 = (PHASEEngine *)objc_claimAutoreleasedReturnValue();
    long long v9 = self->_engine;
    self->_engine = v8;

    re::internal::AriadneSignpostScopeGuard::~AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v13);
    [(REPHASEContext *)self applyCustomHRIR];
    [(REPHASEContext *)self applyReverbPreset];
    [(REPHASEContext *)self applySpaceBlendLevel];
    re::Bundle::coreREFramework(v13);
    double v10 = [v13[0] URLForResource:@"PHASEHumanDirectivity" withExtension:@"plist"];
    [(REPHASEContext *)self loadHumanDirectivityPlistFromURL:v10];

    engine = self->_engine;
  }
  int v11 = engine;
  os_unfair_lock_unlock(&p_audioEngineMutex->m_lock);
  return v11;
}

- (void)update
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  for (i = (id *)self->_soundEvents.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    id v5 = i[3];
    [v5 updateCommandQueue];
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  double v6 = [(PHASEEngine *)self->_engine rootObject];
  pthread_t v7 = re::audioLogObjects(v6);
  double v8 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v7);
  if (v8)
  {
    double v10 = (id)*re::audioLogObjects(v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = [(re *)v6 children];
      int v12 = 138412546;
      double v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = [v11 count];
      _os_log_debug_impl(&dword_233120000, v10, OS_LOG_TYPE_DEBUG, "REPHASEContext update: %@ has %lu children right before PHASEEngine update", (uint8_t *)&v12, 0x16u);
    }
  }
  long long v9 = [(REPHASEContext *)self maybeEngine];
  [v9 update];
}

- (void)clearPhaseShapeCache
{
  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  if (self->_shapes.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__deallocate_node((id *)self->_shapes.__table_.__p1_.__value_.__next_);
    self->_shapes.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        self->_shapes.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_shapes.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
}

- (void)addPhaseShapeToCache:(id)a3 meshID:(unint64_t)a4 mesh:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  double v10 = (re *)a5;
  int v11 = re::audioLogObjects(v10);
  int v12 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v11);
  if (v12)
  {
    long long v32 = *re::audioLogObjects(v12);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v9;
      __int16 v35 = 2048;
      unint64_t v36 = a4;
      _os_log_debug_impl(&dword_233120000, v32, OS_LOG_TYPE_DEBUG, "REPHASEContext:addPhaseShapeToCache: adding PHASEShape(%@) with meshID(%llu) to cache", buf, 0x16u);
    }
  }
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  id v13 = v9;
  __int16 v14 = v10;
  p_shapes = &self->_shapes;
  unint64_t value = self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v5 = a4;
      if (value <= a4) {
        unint64_t v5 = a4 % value;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & a4;
    }
    uint64_t v18 = (void **)p_shapes->__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v18)
    {
      for (uint64_t i = *v18; i; uint64_t i = (void *)*i)
      {
        unint64_t v20 = i[1];
        if (v20 == a4)
        {
          if (i[2] == a4) {
            goto LABEL_41;
          }
        }
        else
        {
          if (v17.u32[0] > 1uLL)
          {
            if (v20 >= value) {
              v20 %= value;
            }
          }
          else
          {
            v20 &= value - 1;
          }
          if (v20 != v5) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x28uLL);
  void *i = 0;
  i[1] = a4;
  i[3] = 0;
  i[4] = 0;
  i[2] = a4;
  float v21 = (float)(self->_shapes.__table_.__p2_.__value_ + 1);
  float v22 = self->_shapes.__table_.__p3_.__value_;
  if (!value || (float)(v22 * (float)value) < v21)
  {
    BOOL v23 = 1;
    if (value >= 3) {
      BOOL v23 = (value & (value - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * value);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__rehash<true>((uint64_t)&self->_shapes, v26);
    unint64_t value = self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if ((value & (value - 1)) != 0)
    {
      if (value <= a4) {
        unint64_t v5 = a4 % value;
      }
      else {
        unint64_t v5 = a4;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & a4;
    }
  }
  v27 = p_shapes->__table_.__bucket_list_.__ptr_.__value_;
  v28 = (void **)p_shapes->__table_.__bucket_list_.__ptr_.__value_[v5];
  if (v28)
  {
    void *i = *v28;
LABEL_39:
    void *v28 = i;
    goto LABEL_40;
  }
  void *i = self->_shapes.__table_.__p1_.__value_.__next_;
  self->_shapes.__table_.__p1_.__value_.__next_ = i;
  v27[v5] = &self->_shapes.__table_.__p1_;
  if (*i)
  {
    unint64_t v29 = *(void *)(*i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v29 >= value) {
        v29 %= value;
      }
    }
    else
    {
      v29 &= value - 1;
    }
    v28 = &p_shapes->__table_.__bucket_list_.__ptr_.__value_[v29];
    goto LABEL_39;
  }
LABEL_40:
  ++self->_shapes.__table_.__p2_.__value_;
LABEL_41:
  long long v30 = (void *)i[3];
  i[3] = v13;

  long long v31 = (void *)i[4];
  i[4] = v14;

  os_unfair_lock_unlock(&self->_shapesMutex.m_lock);
}

- (id)getPhaseShapeFromCacheWithMeshID:(unint64_t)a3
{
  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  double v6 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_shapes.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v6) {
    id v7 = (id)v6[3];
  }
  else {
    id v7 = 0;
  }
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
  return v7;
}

- (void)removePhaseShapeFromCacheWithMeshID:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  p_shapes = &self->_shapes;
  id v7 = (re *)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_shapes.__table_.__bucket_list_.__ptr_.__value_, a3);
  double v8 = re::audioLogObjects(v7);
  if (v7)
  {
    id v9 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v8);
    if (v9)
    {
      float v21 = *re::audioLogObjects(v9);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v22 = *((void *)v7 + 3);
        int v23 = 138412546;
        unint64_t v24 = v22;
        __int16 v25 = 2048;
        unint64_t v26 = a3;
        _os_log_debug_impl(&dword_233120000, v21, OS_LOG_TYPE_DEBUG, "REPHASEContext:removePhaseShapeFromCache: removing PHASEShape(%@) with meshID(%llu) from cache", (uint8_t *)&v23, 0x16u);
      }
    }
    unint64_t value = self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    int v11 = *(objc_class **)v7;
    unint64_t v12 = *((void *)v7 + 1);
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      if (v12 >= value) {
        v12 %= value;
      }
    }
    else
    {
      v12 &= value - 1;
    }
    isa = (REPHASEContext *)p_shapes->__table_.__bucket_list_.__ptr_.__value_[v12];
    do
    {
      uint8x8_t v17 = isa;
      isa = (REPHASEContext *)isa->super.isa;
    }
    while (isa != (REPHASEContext *)v7);
    if (v17 == (REPHASEContext *)&self->_shapes.__table_.__p1_) {
      goto LABEL_23;
    }
    unint64_t engine = (unint64_t)v17->_engine;
    if (v13.u32[0] > 1uLL)
    {
      if (engine >= value) {
        engine %= value;
      }
    }
    else
    {
      engine &= value - 1;
    }
    if (engine != v12)
    {
LABEL_23:
      if (v11)
      {
        unint64_t v19 = *((void *)v11 + 1);
        if (v13.u32[0] > 1uLL)
        {
          unint64_t v20 = *((void *)v11 + 1);
          if (v19 >= value) {
            unint64_t v20 = v19 % value;
          }
        }
        else
        {
          unint64_t v20 = v19 & (value - 1);
        }
        if (v20 == v12) {
          goto LABEL_27;
        }
      }
      p_shapes->__table_.__bucket_list_.__ptr_.__value_[v12] = 0;
      int v11 = *(objc_class **)v7;
    }
    if (!v11)
    {
LABEL_33:
      v17->super.isa = v11;
      *(void *)id v7 = 0;
      --self->_shapes.__table_.__p2_.__value_;
      std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,void *>>>::operator()[abi:ne180100](1, (id *)v7);
      goto LABEL_34;
    }
    unint64_t v19 = *((void *)v11 + 1);
LABEL_27:
    if (v13.u32[0] > 1uLL)
    {
      if (v19 >= value) {
        v19 %= value;
      }
    }
    else
    {
      v19 &= value - 1;
    }
    if (v19 != v12)
    {
      p_shapes->__table_.__bucket_list_.__ptr_.__value_[v19] = v17;
      int v11 = *(objc_class **)v7;
    }
    goto LABEL_33;
  }
  __int16 v14 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v8);
  if (v14)
  {
    uint64_t v15 = *re::audioLogObjects(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 134217984;
      unint64_t v24 = a3;
      _os_log_debug_impl(&dword_233120000, v15, OS_LOG_TYPE_DEBUG, "REPHASEContext:removePhaseShapeFromCache: warning: meshID(%llu) not found in cache", (uint8_t *)&v23, 0xCu);
    }
  }
LABEL_34:
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
}

- (unint64_t)phaseShapeCount
{
  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  unint64_t value = self->_shapes.__table_.__p2_.__value_;
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
  return value;
}

- (unordered_map<unsigned)copyPhaseShapeCache
{
  p_shapesMutex = &self->_shapesMutex;
  os_unfair_lock_lock(&self->_shapesMutex.m_lock);
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = self->_shapes.__table_.__p3_.__value_;
  std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__rehash<true>((uint64_t)retstr, self->_shapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  next = self->_shapes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_p1 = &retstr->__table_.__p1_;
    do
    {
      unint64_t v9 = *((void *)next + 2);
      unint64_t value = retstr->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
        v11.i16[0] = vaddlv_u8(v11);
        if (v11.u32[0] > 1uLL)
        {
          unint64_t v3 = *((void *)next + 2);
          if (value <= v9) {
            unint64_t v3 = v9 % value;
          }
        }
        else
        {
          unint64_t v3 = (value - 1) & v9;
        }
        unint64_t v12 = retstr->__table_.__bucket_list_.__ptr_.__value_[v3];
        if (v12)
        {
          for (uint64_t i = (void *)*v12; i; uint64_t i = (void *)*i)
          {
            unint64_t v14 = i[1];
            if (v14 == v9)
            {
              if (i[2] == v9) {
                goto LABEL_41;
              }
            }
            else
            {
              if (v11.u32[0] > 1uLL)
              {
                if (v14 >= value) {
                  v14 %= value;
                }
              }
              else
              {
                v14 &= value - 1;
              }
              if (v14 != v3) {
                break;
              }
            }
          }
        }
      }
      uint64_t v15 = operator new(0x28uLL);
      *uint64_t v15 = 0;
      v15[1] = v9;
      uint64_t v16 = (void *)*((void *)next + 3);
      v15[2] = *((void *)next + 2);
      v15[3] = v16;
      v15[4] = *((id *)next + 4);
      float v17 = (float)(retstr->__table_.__p2_.__value_ + 1);
      float v18 = retstr->__table_.__p3_.__value_;
      if (!value || (float)(v18 * (float)value) < v17)
      {
        BOOL v19 = (value & (value - 1)) != 0;
        if (value < 3) {
          BOOL v19 = 1;
        }
        unint64_t v20 = v19 | (2 * value);
        unint64_t v21 = vcvtps_u32_f32(v17 / v18);
        if (v20 <= v21) {
          size_t v22 = v21;
        }
        else {
          size_t v22 = v20;
        }
        std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::__rehash<true>((uint64_t)retstr, v22);
        unint64_t value = retstr->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if ((value & (value - 1)) != 0)
        {
          if (value <= v9) {
            unint64_t v3 = v9 % value;
          }
          else {
            unint64_t v3 = v9;
          }
        }
        else
        {
          unint64_t v3 = (value - 1) & v9;
        }
      }
      int v23 = retstr->__table_.__bucket_list_.__ptr_.__value_;
      unint64_t v24 = (void **)retstr->__table_.__bucket_list_.__ptr_.__value_[v3];
      if (v24)
      {
        *uint64_t v15 = *v24;
      }
      else
      {
        *uint64_t v15 = p_p1->__value_.__next_;
        p_p1->__value_.__next_ = v15;
        v23[v3] = p_p1;
        if (!*v15) {
          goto LABEL_40;
        }
        unint64_t v25 = *(void *)(*v15 + 8);
        if ((value & (value - 1)) != 0)
        {
          if (v25 >= value) {
            v25 %= value;
          }
        }
        else
        {
          v25 &= value - 1;
        }
        unint64_t v24 = &retstr->__table_.__bucket_list_.__ptr_.__value_[v25];
      }
      *unint64_t v24 = v15;
LABEL_40:
      ++retstr->__table_.__p2_.__value_;
LABEL_41:
      next = *(void **)next;
    }
    while (next);
  }
  os_unfair_lock_unlock(&p_shapesMutex->m_lock);
  return result;
}

- (void)removeOccluderFromScene:(unint64_t)a3 entity:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  -[REPHASEContext sceneForID:](self, "sceneForID:");
  if (v24)
  {
    re::audio::REPHASEAudioScene::getEntity((os_unfair_lock_s *)v24, a4, &v22);
    uint64_t v7 = v22;
    if (v22)
    {
      uint64_t v8 = *(void *)(v22 + 24);
      unint64_t v9 = re::audioLogObjects(v6);
      if (v8)
      {
        double v10 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v9);
        if (v10)
        {
          BOOL v19 = *re::audioLogObjects(v10);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = *(void *)(v7 + 32);
            *(_DWORD *)buf = 134218498;
            unint64_t v27 = a3;
            __int16 v28 = 2048;
            unint64_t v29 = a4;
            __int16 v30 = 2112;
            uint64_t v31 = v20;
            _os_log_debug_impl(&dword_233120000, v19, OS_LOG_TYPE_DEBUG, "removeOccluderFromScene: sceneID=%llu entityID=%llu entityName='%@'", buf, 0x20u);
          }
        }
        uint8x8_t v11 = [*(id *)(v7 + 24) parent];
        [v11 removeChild:*(void *)(v7 + 24)];
        unint64_t v12 = *(void **)(v7 + 24);
        *(void *)(v7 + 24) = 0;

        if (!*(void *)(v7 + 16))
        {
          unint64_t v14 = re::audioLogObjects(v13);
          uint64_t v15 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v14);
          if (v15)
          {
            unint64_t v21 = *re::audioLogObjects(v15);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              unint64_t v27 = a4;
              _os_log_debug_impl(&dword_233120000, v21, OS_LOG_TYPE_DEBUG, "removeOccluderFromScene: removing entity(%llu) from REAudioScene", buf, 0xCu);
            }
          }
          re::audio::REPHASEAudioScene::removeEntity((os_unfair_lock_s *)v24, a4);
        }

        goto LABEL_9;
      }
      float v17 = *v9;
      if (!os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        if (v23) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v23);
        }
        goto LABEL_11;
      }
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a3;
      __int16 v28 = 2048;
      unint64_t v29 = a4;
      float v18 = "removeOccluderFromScene: occluder not found for sceneID=%llu entityID=%llu";
    }
    else
    {
      float v17 = *re::audioLogObjects(v6);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a3;
      __int16 v28 = 2048;
      unint64_t v29 = a4;
      float v18 = "removeOccluderFromScene: entity not found for sceneID=%llu entityID=%llu";
    }
    _os_log_error_impl(&dword_233120000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    goto LABEL_9;
  }
  uint64_t v16 = *re::audioLogObjects(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v27 = a3;
    __int16 v28 = 2048;
    unint64_t v29 = a4;
    _os_log_error_impl(&dword_233120000, v16, OS_LOG_TYPE_ERROR, "removeOccluderFromScene: scene not found for sceneID=%llu entityID=%llu", buf, 0x16u);
  }
LABEL_11:
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v25);
  }
}

- (void)applyMeshRemoval:(const void *)a3
{
  [(REPHASEContext *)self removePhaseShapeFromCacheWithMeshID:*((void *)a3 + 2)];
  uint64_t v5 = *(void *)a3;
  uint64_t v6 = *((void *)a3 + 1);
  [(REPHASEContext *)self removeOccluderFromScene:v5 entity:v6];
}

- (void)applyMeshRemovals:(const void *)a3
{
  uint64_t v3 = *((void *)a3 + 2);
  if (v3)
  {
    uint64_t v5 = *((void *)a3 + 4);
    uint64_t v6 = 40 * v3;
    do
    {
      [(REPHASEContext *)self applyMeshRemoval:v5];
      v5 += 40;
      v6 -= 40;
    }
    while (v6);
  }
}

- (void)addOccluder:(id)a3 toScene:(unint64_t)a4 entity:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v9 = (re *)a3;
  double v10 = v9;
  if (a4 == -1 || !a5)
  {
    uint64_t v16 = *re::audioLogObjects(v9);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a5;
      __int16 v27 = 2048;
      unint64_t v28 = a4;
      _os_log_error_impl(&dword_233120000, v16, OS_LOG_TYPE_ERROR, "REPhaseContext:addOccluder Can't add occluder to invalid entity(%llu)/scene(%llu)", buf, 0x16u);
    }
  }
  else
  {
    [(REPHASEContext *)self sceneForID:a4];
    if (v23)
    {
      re::audio::REPHASEAudioScene::getOrCreateEntity((os_unfair_lock_s *)v23, a5, &v21);
      uint64_t v12 = v21;
      if (v21)
      {
        uint8x8_t v13 = [(PHASEEngine *)self->_engine rootObject];
        objc_storeStrong((id *)(v12 + 24), a3);
        id v20 = 0;
        [v13 addChild:v10 error:&v20];
        unint64_t v14 = (re *)v20;
        uint64_t v15 = v14;
        if (v14)
        {
          BOOL v19 = *re::audioLogObjects(v14);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            unint64_t v26 = a5;
            __int16 v27 = 2112;
            unint64_t v28 = (unint64_t)v15;
            _os_log_error_impl(&dword_233120000, v19, OS_LOG_TYPE_ERROR, "REPhaseContext:addOccluder Could not add PHASEOccluder for entity %llu. Error %@", buf, 0x16u);
          }
        }
      }
      else
      {
        float v18 = *re::audioLogObjects(v11);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v26 = a4;
          __int16 v27 = 2048;
          unint64_t v28 = a5;
          _os_log_error_impl(&dword_233120000, v18, OS_LOG_TYPE_ERROR, "REPhaseContext:addOccluder failed to find or create REPHASEEntity for sceneID(%llu) entityID(%llu)", buf, 0x16u);
        }
      }
      if (v22) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v22);
      }
    }
    else
    {
      float v17 = *re::audioLogObjects(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v26 = a4;
        _os_log_error_impl(&dword_233120000, v17, OS_LOG_TYPE_ERROR, "REPhaseContext:addOccluder failed to find REPHASEAudioScene for sceneID(%llu)", buf, 0xCu);
      }
    }
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v24);
    }
  }
}

- (void)addOccluder:(const void *)a3
{
}

- (void)applyOccluderAdditions:(const void *)a3
{
  uint64_t v3 = *((void *)a3 + 2);
  if (v3)
  {
    uint64_t v5 = *((void *)a3 + 4);
    uint64_t v6 = 48 * v3;
    do
    {
      [(REPHASEContext *)self addOccluder:v5];
      v5 += 48;
      v6 -= 48;
    }
    while (v6);
  }
}

- (void)updateOccluder:(const void *)a3
{
  long long v14 = *(_OWORD *)a3;
  uint64_t v5 = *((void *)a3 + 5);
  uint64_t v15 = *((void *)a3 + 2);
  uint64_t v16 = v5;
  char v17 = *((unsigned char *)a3 + 48);
  [(REPHASEContext *)self applyMeshRemoval:&v14];
  long long v9 = *(_OWORD *)a3;
  uint64_t v6 = (void *)*((void *)a3 + 4);
  uint64_t v10 = *((void *)a3 + 3);
  id v7 = v6;
  uint64_t v8 = *((void *)a3 + 5);
  id v11 = v7;
  uint64_t v12 = v8;
  char v13 = *((unsigned char *)a3 + 48);
  [(REPHASEContext *)self addOccluder:&v9];
}

- (void)applyOccluderUpdates:(const void *)a3
{
  uint64_t v3 = *((void *)a3 + 2);
  if (v3)
  {
    uint64_t v5 = *((void *)a3 + 4);
    uint64_t v6 = 56 * v3;
    do
    {
      [(REPHASEContext *)self updateOccluder:v5];
      v5 += 56;
      v6 -= 56;
    }
    while (v6);
  }
}

- (void)applyMeshEvents:(const void *)a3
{
  uint64_t v16 = self;
  uint64_t v14 = *((void *)a3 + 2);
  if (v14)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      unint64_t v4 = (unint64_t)(*((void *)a3 + 3) + i) % *((void *)a3 + 1);
      uint64_t v5 = *((void *)a3 + 5);
      uint64_t v6 = *(void *)(v5 + 48 * v4 + 16);
      if (v6)
      {
        uint64_t v7 = 0;
        uint64_t v8 = (void *)(v5 + 48 * v4);
        long long v9 = v8 + 3;
        uint64_t v10 = v8 + 1;
        id v11 = v8 + 5;
        do
        {
          uint64_t v12 = *v11 + 48 * ((unint64_t)(v7 + *v9) % *v10);
          v17[0] = &v16;
          v17[1] = &v16;
          v17[2] = &v16;
          uint64_t v13 = *(unsigned int *)(v12 + 40);
          if (v13 == -1) {
            std::__throw_bad_variant_access[abi:ne180100]();
          }
          float v18 = v17;
          ((void (*)(void **))off_26E6DA038[v13])(&v18);
          ++v7;
        }
        while (v6 != v7);
      }
    }
  }
}

- (id)createAcousticMaterialsArrayWithAbsorption:(DynamicArray<re:(DynamicArray<re:(DynamicArray<re::AcousticSoundReductionMaterial> *)a5 :AcousticScatteringMaterial> *)a4 :AcousticAbsorptionMaterial> *)a3 scattering:soundReduction:
{
  re::internal::AriadneSignpostScopeGuard::AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v12, 2532, (uint64_t)self);
  long long v9 = [(REPHASEContext *)self engine];
  uint64_t v10 = re::REPHASEMaterialCache::getMaterials((re::REPHASEMaterialCache *)&self->_phaseMaterialCache, v9, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);

  re::internal::AriadneSignpostScopeGuard::~AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v12);
  return v10;
}

- (id)createPhaseShapeWithMeshID:(unint64_t)a3 materials:(id)a4 mdlMesh:(id)a5 arkitMesh:(BOOL)a6 meshType:(unsigned __int8)a7
{
  int v7 = a7;
  BOOL v8 = a6;
  v57[2] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = re::internal::AriadneSignpostScopeGuard::AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v41, 2530, (uint64_t)self);
  if (v7 || !v8)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 7;
    if (v7 == 1 && v8)
    {
      BOOL v19 = re::audioLogObjects(v14);
      id v20 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v19);
      if (v20)
      {
        uint64_t v37 = *re::audioLogObjects(v20);
        id v20 = (re *)os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_233120000, v37, OS_LOG_TYPE_DEFAULT, "[AudioManager_PHASE_Async::CreatePhaseShape] PRRMesh being used", buf, 2u);
        }
      }
      if (self->_directpathEnabled)
      {
        uint64_t v17 = 1;
        uint64_t v18 = 7;
      }
      else
      {
        uint64_t v21 = re::audioLogObjects(v20);
        uint64_t v22 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v21);
        if (v22)
        {
          int v38 = *re::audioLogObjects(v22);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_233120000, v38, OS_LOG_TYPE_DEFAULT, "[AudioManager_PHASE_Async::CreatePhaseShape] Removing PHASESpatialPipelineFlagDirectPathTransmission", buf, 2u);
          }
        }
        uint64_t v17 = 1;
        uint64_t v18 = 6;
      }
    }
  }
  else
  {
    uint64_t v15 = re::audioLogObjects(v14);
    uint64_t v16 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v15);
    if (v16)
    {
      unint64_t v36 = *re::audioLogObjects(v16);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233120000, v36, OS_LOG_TYPE_DEFAULT, "[AudioManager_PHASE_Async::CreatePhaseShape] MeshChunks being used", buf, 2u);
      }
      uint64_t v18 = 1;
      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v17 = 1;
      uint64_t v18 = 1;
    }
  }
  v56[0] = @"PHASEShapeCategoriesKey";
  int v23 = [NSNumber numberWithUnsignedInteger:v18];
  v56[1] = @"PHASEShapeIsRealKey";
  v57[0] = v23;
  unint64_t v24 = [NSNumber numberWithBool:v17];
  v57[1] = v24;
  unint64_t v25 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];

  id v26 = objc_alloc(MEMORY[0x263F14990]);
  __int16 v27 = [(REPHASEContext *)self engine];
  unint64_t v28 = (void *)[v26 initWithEngine:v27 mesh:v13 materials:v12 options:v25];

  uint64_t v29 = (re *)[v13 boundingBox];
  long long v39 = v31;
  long long v40 = v30;
  uint64_t v32 = re::audioLogObjects(v29);
  uint64_t v33 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v32);
  if (v33)
  {
    __int16 v35 = *re::audioLogObjects(v33);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219520;
      unint64_t v43 = a3;
      __int16 v44 = 2048;
      double v45 = *(float *)&v39;
      __int16 v46 = 2048;
      double v47 = *((float *)&v39 + 1);
      __int16 v48 = 2048;
      double v49 = *((float *)&v39 + 2);
      __int16 v50 = 2048;
      double v51 = *(float *)&v40;
      __int16 v52 = 2048;
      double v53 = *((float *)&v40 + 1);
      __int16 v54 = 2048;
      double v55 = *((float *)&v40 + 2);
      _os_log_impl(&dword_233120000, v35, OS_LOG_TYPE_DEFAULT, "REPHASEContext:createPhaseShapeWithMeshID: created shape with id %llu, bounding box = [% 4.3f,% 4.3f,% 4.3f|% 4.3f,% 4.3f,% 4.3f]", buf, 0x48u);
    }
  }

  re::internal::AriadneSignpostScopeGuard::~AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)v41);
  return v28;
}

- (id)createPHASEShape:(const void *)a3
{
  id v6 = 0;
  int v7 = self;
  v8[0] = &v7;
  v8[1] = &v6;
  v8[2] = &v6;
  v8[3] = &v7;
  uint64_t v3 = *((unsigned int *)a3 + 38);
  if (v3 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  long long v9 = v8;
  ((void (*)(void **, const void *))off_26E6DA050[v3])(&v9, a3);
  id v4 = v6;

  return v4;
}

- (id)createPHASEShapeAndOccluder:(const void *)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = -[REPHASEContext createPHASEShape:](self, "createPHASEShape:");
  if (v5)
  {
    uint64_t v6 = re::audio::meshID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
    uint64_t v7 = *((unsigned int *)a3 + 38);
    if (v7 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    uint64_t v8 = v6;
    *(void *)buf = &v20;
    long long v9 = ((void (*)(unsigned char *, const void *))off_26E6DA070[v7])(buf, a3);
    [(REPHASEContext *)self addPhaseShapeToCache:v5 meshID:v8 mesh:v9];

    re::audio::meshID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
    re::audio::meshType<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
    re::audio::meshType<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
    re::internal::AriadneSignpostScopeGuard::AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)buf, 2543, (uint64_t)self);
    id v10 = objc_alloc(MEMORY[0x263F14970]);
    unint64_t engine = self->_engine;
    v24[0] = v5;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    id v13 = (void *)[v10 initWithEngine:engine shapes:v12];

    re::internal::AriadneSignpostScopeGuard::~AriadneSignpostScopeGuard((re::internal::AriadneSignpostScopeGuard *)buf);
    uint64_t v15 = re::audioLogObjects(v14);
    uint64_t v16 = (re *)re::AudioLogObjects::loggingEnabled((re::AudioLogObjects *)v15);
    if (v16)
    {
      uint64_t v17 = (id)*re::audioLogObjects(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = re::audio::entityID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a3);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v18;
        __int16 v22 = 2112;
        int v23 = v13;
        _os_log_impl(&dword_233120000, v17, OS_LOG_TYPE_DEFAULT, "REPHASEContext:createPHASEShapeAndOccluder entityId=%llu created PHASEOccluder: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (PHASEOccluderData)createPHASEOccluderData:(SEL)a3
{
  retstr->var3 = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  uint64_t v5 = *((unsigned int *)a4 + 38);
  if (v5 == -1) {
    goto LABEL_4;
  }
  v13[0] = &v11;
  retstr->var0 = ((uint64_t (*)(void *, const void *))off_26E6DA090[v5])(v13, a4);
  retstr->var1 = re::audio::entityID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a4);
  retstr->var2 = re::audio::meshID<std::variant<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>>((uint64_t)a4);
  LOBYTE(v11) = 0;
  LOBYTE(v12) = 0;
  v13[0] = &v11;
  v13[1] = &v11;
  uint64_t v8 = *((unsigned int *)a4 + 38);
  if (v8 == -1) {
LABEL_4:
  }
    std::__throw_bad_variant_access[abi:ne180100]();
  uint64_t v14 = v13;
  ((void (*)(void **, const void *))off_26E6DA0A0[v8])(&v14, a4);
  BOOL v9 = v12;
  retstr->var4.var0.__val_ = v11;
  retstr->var4.__engaged_ = v9;
  result = [(REPHASEContext *)self createPHASEShapeAndOccluder:a4];
  retstr->var3 = result;
  return result;
}

- (DynamicArray<re::audio::PHASEOccluderData>)createPHASEOccluders:(SEL)a3
{
  retstr->var4 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  retstr->var0 = 0;
  retstr->var3 = 0;
  uint64_t v5 = *((void *)a4 + 2);
  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v7 = *((void *)a4 + 4);
    uint64_t v8 = 160 * v5;
    do
    {
      BOOL v9 = (_anonymous_namespace_ *)unk_26E763CE8(v6, "createPHASEOccluderData:", v7);
      unint64_t var1 = retstr->var1;
      unint64_t var2 = retstr->var2;
      if (var2 >= var1)
      {
        unint64_t v12 = var2 + 1;
        if (var1 < var2 + 1)
        {
          if (retstr->var0)
          {
            if (var1) {
              unint64_t v13 = 2 * var1;
            }
            else {
              unint64_t v13 = 8;
            }
            if (v13 <= v12) {
              unint64_t v14 = var2 + 1;
            }
            else {
              unint64_t v14 = v13;
            }
            re::DynamicArray<re::audio::PHASEOccluderData>::setCapacity(retstr, v14);
          }
          else
          {
            re::DynamicArray<re::audio::PHASEOccluderData>::setCapacity(retstr, v12);
            ++retstr->var3;
          }
        }
        unint64_t var2 = retstr->var2;
      }
      uint64_t v15 = &retstr->var4[var2];
      long long v16 = v18;
      v15->unint64_t var2 = v19;
      *(_OWORD *)&v15->var0 = v16;
      id v17 = v20;
      id v20 = 0;
      v15->var3 = v17;
      v15->var4 = v21;
      ++retstr->var2;
      ++retstr->var3;

      v7 += 160;
      v8 -= 160;
    }
    while (v8);
  }
  return self;
}

- (PHASEOccluderUpdateData)createPHASEOccluderUpdateData:(SEL)a3
{
  retstr->var4 = 0;
  retstr->var5.var0.__null_state_ = 0;
  retstr->var5.__engaged_ = 0;
  uint64_t v5 = *((unsigned int *)a4 + 40);
  if (v5 == -1) {
    goto LABEL_7;
  }
  *(void *)&v14[0] = &v15;
  retstr->var0 = ((uint64_t (*)(_OWORD *, const void *))off_26E6DA0B0[v5])(v14, a4);
  uint64_t v8 = *((unsigned int *)a4 + 40);
  if (v8 == -1) {
    goto LABEL_7;
  }
  *(void *)&v14[0] = &v15;
  retstr->unint64_t var1 = ((uint64_t (*)(_OWORD *, const void *))off_26E6DA0C0[v8])(v14, a4);
  uint64_t v9 = *((unsigned int *)a4 + 40);
  if (v9 == -1) {
    goto LABEL_7;
  }
  *(void *)&v14[0] = &v15;
  retstr->unint64_t var2 = ((uint64_t (*)(_OWORD *, const void *))off_26E6DA0D0[v9])(v14, a4);
  uint64_t v10 = *((unsigned int *)a4 + 40);
  if (v10 == -1
    || (*(void *)&v14[0] = &v15,
        retstr->var3 = ((uint64_t (*)(_OWORD *, const void *))off_26E6DA0E0[v10])(v14, a4),
        LOBYTE(v15) = 0,
        LOBYTE(v16) = 0,
        *(void *)&v14[0] = &v15,
        *((void *)&v14[0] + 1) = &v15,
        uint64_t v11 = *((unsigned int *)a4 + 40),
        v11 == -1))
  {
LABEL_7:
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  id v17 = v14;
  ((void (*)(_OWORD **, const void *))off_26E6DA0F0[v11])(&v17, a4);
  BOOL v12 = v16;
  retstr->var5.var0.__val_ = v15;
  retstr->var5.__engaged_ = v12;
  re::audio::convertToAcousticMeshAddition((uint64_t)a4, v14);
  retstr->var4 = [(REPHASEContext *)self createPHASEShapeAndOccluder:v14];
  return (PHASEOccluderUpdateData *)std::__variant_detail::__dtor<std::__variant_detail::__traits<re::audio::AcousticMeshData,re::audio::AcousticARKitMeshData>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v14);
}

- (DynamicArray<re::audio::PHASEOccluderUpdateData>)updatePHASEOccluders:(SEL)a3
{
  retstr->var4 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  retstr->var0 = 0;
  retstr->var3 = 0;
  uint64_t v5 = *((void *)a4 + 2);
  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v7 = *((void *)a4 + 4);
    uint64_t v8 = 168 * v5;
    do
    {
      uint64_t v9 = (_anonymous_namespace_ *)unk_26E763D18(v6, "createPHASEOccluderUpdateData:", v7);
      unint64_t var1 = retstr->var1;
      unint64_t var2 = retstr->var2;
      if (var2 >= var1)
      {
        unint64_t v12 = var2 + 1;
        if (var1 < var2 + 1)
        {
          if (retstr->var0)
          {
            if (var1) {
              unint64_t v13 = 2 * var1;
            }
            else {
              unint64_t v13 = 8;
            }
            if (v13 <= v12) {
              unint64_t v14 = var2 + 1;
            }
            else {
              unint64_t v14 = v13;
            }
            re::DynamicArray<re::audio::PHASEOccluderUpdateData>::setCapacity(retstr, v14);
          }
          else
          {
            re::DynamicArray<re::audio::PHASEOccluderUpdateData>::setCapacity(retstr, v12);
            ++retstr->var3;
          }
        }
        unint64_t var2 = retstr->var2;
      }
      double v15 = &retstr->var4[var2];
      long long v16 = v19;
      *(_OWORD *)&v15->var0 = v18;
      *(_OWORD *)&v15->unint64_t var2 = v16;
      id v17 = v20;
      id v20 = 0;
      v15->var4 = v17;
      v15->var5 = v21;
      ++retstr->var2;
      ++retstr->var3;

      v7 += 168;
      v8 -= 168;
    }
    while (v8);
  }
  return self;
}

- (void)stopAllAndReset
{
  atomic_store(1u, (unsigned __int8 *)&self->_stoppedAndDestroyed);
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  for (uint64_t i = (id *)self->_soundEvents.__table_.__p1_.__value_.__next_; i; uint64_t i = (id *)*i)
  {
    id v5 = i[3];
    [v5 stopAndDestroy];
    [v5 prepareState];
    [(REPHASEContext *)self decrementOrDestroyEntityWithZeroCount:*(void *)(v19 + 40)];
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v20);
    }
  }
  if (self->_soundEvents.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>>>::__deallocate_node((id *)self->_soundEvents.__table_.__p1_.__value_.__next_);
    self->_soundEvents.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t j = 0; j != value; ++j)
        self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
    }
    self->_soundEvents.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  if (self->_soundEventsPreparing.__table_.__p2_.__value_)
  {
    next = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        uint64_t v9 = (void *)*next;
        operator delete(next);
        next = v9;
      }
      while (v9);
    }
    self->_soundEventsPreparing.__table_.__p1_.__value_.__next_ = 0;
    unint64_t v10 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v10)
    {
      for (uint64_t k = 0; k != v10; ++k)
        self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[k] = 0;
    }
    self->_soundEventsPreparing.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&self->_soundEventsPreparingMutex.m_lock);
  [(REPHASEContext *)self clearPhaseShapeCache];
  os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
  if (self->_audioAssets.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,REPHASESoundAsset>>>::__deallocate_node((char *)self->_audioAssets.__table_.__p1_.__value_.__next_);
    self->_audioAssets.__table_.__p1_.__value_.__next_ = 0;
    unint64_t v12 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v12)
    {
      for (uint64_t m = 0; m != v12; ++m)
        self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[m] = 0;
    }
    self->_audioAssets.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&self->_audioAssetsMutex.m_lock);
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (n = self->_scenes.__table_.__p1_.__value_.__next_; n; n = (void *)*n)
  {
    double v15 = (re::audio::REPHASEAudioScene *)n[3];
    long long v16 = (std::__shared_weak_count *)n[4];
    if (v16)
    {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      re::audio::REPHASEAudioScene::destroy(v15);
      std::__shared_weak_count::__release_shared[abi:nn180100](v16);
    }
    else
    {
      re::audio::REPHASEAudioScene::destroy(v15);
    }
  }
  if (self->_scenes.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>>>::__deallocate_node((void *)self->_scenes.__table_.__p1_.__value_.__next_);
    self->_scenes.__table_.__p1_.__value_.__next_ = 0;
    unint64_t v17 = self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v17)
    {
      for (iuint64_t i = 0; ii != v17; ++ii)
        self->_scenes.__table_.__bucket_list_.__ptr_.__value_[ii] = 0;
    }
    self->_scenes.__table_.__p2_.__value_ = 0;
  }
  os_unfair_lock_unlock(&self->_scenesMutex.m_lock);
  [(PHASEEngine *)self->_engine stop];
}

- (shared_ptr<re::audio::REPHASEAudioScene>)sceneForID:(unint64_t)a3
{
  id v4 = v3;
  if (a3 == -1)
  {
    *uint64_t v3 = 0;
    v3[1] = 0;
    goto LABEL_25;
  }
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  unint64_t value = self->_scenes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value) {
    goto LABEL_19;
  }
  uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v11 = a3;
    if (value <= a3) {
      unint64_t v11 = a3 % value;
    }
  }
  else
  {
    unint64_t v11 = (value - 1) & a3;
  }
  unint64_t v12 = self->_scenes.__table_.__bucket_list_.__ptr_.__value_[v11];
  if (!v12 || (unint64_t v13 = (void *)*v12) == 0) {
LABEL_19:
  }
    re::audio::REPHASEAudioScene::create((re::audio::REPHASEAudioScene *)self, v8);
  while (1)
  {
    unint64_t v14 = v13[1];
    if (v14 == a3) {
      break;
    }
    if (v10.u32[0] > 1uLL)
    {
      if (v14 >= value) {
        v14 %= value;
      }
    }
    else
    {
      v14 &= value - 1;
    }
    if (v14 != v11) {
      goto LABEL_19;
    }
LABEL_18:
    unint64_t v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_19;
    }
  }
  if (v13[2] != a3) {
    goto LABEL_18;
  }
  uint64_t v15 = v13[4];
  *id v4 = v13[3];
  v4[1] = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
LABEL_25:
  result.unint64_t var1 = (__shared_weak_count *)a2;
  result.var0 = (REPHASEAudioScene *)self;
  return result;
}

- (id)phaseIDForAssetID:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
}

- (void)addAudioAssetID:(unint64_t)a3 configuration:(const void *)a4
{
  if (*((_DWORD *)a4 + 2)) {
    double v8 = *((double *)a4 + 2);
  }
  else {
    double v8 = 1.0;
  }
  p_audioAssetsMutex = &self->_audioAssetsMutex;
  os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
  long long v38 = *(_OWORD *)a4;
  long long v39 = *((_OWORD *)a4 + 1);
  LOBYTE(v40) = *((unsigned char *)a4 + 32);
  if ((_BYTE)v40) {
    re::DynamicString::DynamicString((re::DynamicString *)&v41, (const re::DynamicString *)((char *)a4 + 40));
  }
  char v43 = *((unsigned char *)a4 + 72);
  if (v43) {
    int v44 = *((_DWORD *)a4 + 19);
  }
  char v45 = *((unsigned char *)a4 + 80);
  double v46 = v8;
  unint64_t value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = a3;
      if (value <= a3) {
        unint64_t v4 = a3 % value;
      }
    }
    else
    {
      unint64_t v4 = (value - 1) & a3;
    }
    unint64_t v12 = (void **)self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v12)
    {
      unint64_t v13 = (char *)*v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = *((void *)v13 + 1);
          if (v14 == a3)
          {
            if (*((void *)v13 + 2) == a3) {
              goto LABEL_81;
            }
          }
          else
          {
            if (v11.u32[0] > 1uLL)
            {
              if (v14 >= value) {
                v14 %= value;
              }
            }
            else
            {
              v14 &= value - 1;
            }
            if (v14 != v4) {
              break;
            }
          }
          unint64_t v13 = *(char **)v13;
        }
        while (v13);
      }
    }
  }
  unint64_t v13 = (char *)operator new(0x78uLL);
  p_p1 = &self->_audioAssets.__table_.__p1_;
  *(void *)unint64_t v13 = 0;
  *((void *)v13 + 1) = a3;
  *((void *)v13 + 2) = a3;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  *(_OWORD *)(v13 + 56) = 0u;
  *(_OWORD *)(v13 + 72) = 0u;
  *(_OWORD *)(v13 + 88) = 0u;
  *((void *)v13 + 13) = 0;
  *((void *)v13 + 14) = 0;
  *((void *)v13 + 6) = 0xC028000000000000;
  float v16 = (float)(self->_audioAssets.__table_.__p2_.__value_ + 1);
  float v17 = self->_audioAssets.__table_.__p3_.__value_;
  if (value && (float)(v17 * (float)value) >= v16)
  {
    a3 = v4;
    goto LABEL_71;
  }
  BOOL v18 = 1;
  if (value >= 3) {
    BOOL v18 = (value & (value - 1)) != 0;
  }
  unint64_t v19 = v18 | (2 * value);
  unint64_t v20 = vcvtps_u32_f32(v16 / v17);
  if (v19 <= v20) {
    int8x8_t prime = (int8x8_t)v20;
  }
  else {
    int8x8_t prime = (int8x8_t)v19;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(void *)&prime <= value)
  {
    if (*(void *)&prime >= value) {
      goto LABEL_67;
    }
    unint64_t v28 = vcvtps_u32_f32((float)self->_audioAssets.__table_.__p2_.__value_ / self->_audioAssets.__table_.__p3_.__value_);
    if (value < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)value), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
    {
      unint64_t v28 = std::__next_prime(v28);
    }
    else
    {
      uint64_t v30 = 1 << -(char)__clz(v28 - 1);
      if (v28 >= 2) {
        unint64_t v28 = v30;
      }
    }
    if (*(void *)&prime <= v28) {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime >= value)
    {
      unint64_t value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_67;
    }
    if (!*(void *)&prime)
    {
      uint64_t v37 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
      self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v37) {
        operator delete(v37);
      }
      unint64_t value = 0;
      self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_67;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  __int16 v22 = (void **)operator new(8 * *(void *)&prime);
  int v23 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
  self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_ = v22;
  if (v23) {
    operator delete(v23);
  }
  uint64_t v24 = 0;
  self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v24++] = 0;
  while (*(void *)&prime != v24);
  next = p_p1->__value_.__next_;
  if (p_p1->__value_.__next_)
  {
    unint64_t v26 = next[1];
    uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(void *)&prime) {
        v26 %= *(void *)&prime;
      }
    }
    else
    {
      v26 &= *(void *)&prime - 1;
    }
    self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v26] = p_p1;
    long long v31 = (void *)*next;
    if (*next)
    {
      do
      {
        unint64_t v32 = v31[1];
        if (v27.u32[0] > 1uLL)
        {
          if (v32 >= *(void *)&prime) {
            v32 %= *(void *)&prime;
          }
        }
        else
        {
          v32 &= *(void *)&prime - 1;
        }
        if (v32 != v26)
        {
          uint64_t v33 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
          if (!v33[v32])
          {
            v33[v32] = next;
            goto LABEL_63;
          }
          void *next = *v31;
          *long long v31 = *(void *)self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v32];
          *(void *)self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v32] = v31;
          long long v31 = next;
        }
        unint64_t v32 = v26;
LABEL_63:
        next = v31;
        long long v31 = (void *)*v31;
        unint64_t v26 = v32;
      }
      while (v31);
    }
  }
  unint64_t value = (unint64_t)prime;
LABEL_67:
  if ((value & (value - 1)) != 0)
  {
    if (value <= a3) {
      a3 %= value;
    }
  }
  else
  {
    a3 &= value - 1;
  }
LABEL_71:
  id v34 = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
  __int16 v35 = (void **)v34[a3];
  if (v35)
  {
    *(void *)unint64_t v13 = *v35;
LABEL_79:
    *__int16 v35 = v13;
    goto LABEL_80;
  }
  *(__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *>>> *)unint64_t v13 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundAsset>, void *>>>)p_p1->__value_.__next_;
  p_p1->__value_.__next_ = v13;
  v34[a3] = p_p1;
  if (*(void *)v13)
  {
    unint64_t v36 = *(void *)(*(void *)v13 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value) {
        v36 %= value;
      }
    }
    else
    {
      v36 &= value - 1;
    }
    __int16 v35 = &self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_[v36];
    goto LABEL_79;
  }
LABEL_80:
  ++self->_audioAssets.__table_.__p2_.__value_;
LABEL_81:
  *(_OWORD *)(v13 + 24) = v38;
  *(_OWORD *)(v13 + 40) = v39;
  re::Optional<re::DynamicString>::operator=((unsigned __int8 *)v13 + 56, &v40);
  if (v13[96] || v43)
  {
    if (!v13[96] || v43)
    {
      if (!v13[96] && v43) {
        v13[96] = 1;
      }
      *((_DWORD *)v13 + 25) = v44;
    }
    else
    {
      v13[96] = 0;
    }
  }
  v13[104] = v45;
  *((double *)v13 + 14) = v46;
  if (_BYTE)v40 && v41 && (v42) {
    (*(void (**)(void))(*(void *)v41 + 40))();
  }
  os_unfair_lock_unlock(&p_audioAssetsMutex->m_lock);
}

- (BOOL)getConfigurationForAudioAssetID:(unint64_t)a3 configuration:(void *)a4
{
  p_audioAssetsMutex = &self->_audioAssetsMutex;
  os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
  double v8 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_, a3);
  uint64_t v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)(v8 + 5);
    *(_OWORD *)a4 = *(_OWORD *)(v8 + 3);
    *((_OWORD *)a4 + 1) = v10;
    re::Optional<re::DynamicString>::operator=((unsigned char *)a4 + 32, (unsigned __int8 *)v8 + 56);
    if (*((unsigned char *)a4 + 72) || *((unsigned char *)v9 + 96))
    {
      if (!*((unsigned char *)a4 + 72) || *((unsigned char *)v9 + 96))
      {
        if (!*((unsigned char *)a4 + 72) && *((unsigned char *)v9 + 96)) {
          *((unsigned char *)a4 + 72) = 1;
        }
        *((_DWORD *)a4 + 19) = *((_DWORD *)v9 + 25);
      }
      else
      {
        *((unsigned char *)a4 + 72) = 0;
      }
    }
    *((unsigned char *)a4 + 80) = *((unsigned char *)v9 + 104);
  }
  os_unfair_lock_unlock(&p_audioAssetsMutex->m_lock);
  return v9 != 0;
}

- (void)removeAudioAssetID:(unint64_t)a3
{
  p_audioAssetsMutex = &self->_audioAssetsMutex;
  os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
  p_audioAssets = &self->_audioAssets;
  uint64_t v7 = (REPHASEContext *)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (!v7) {
    goto LABEL_32;
  }
  double v8 = v7;
  unint64_t value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  isa = v7->super.isa;
  unint64_t engine = (unint64_t)v7->_engine;
  uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    if (engine >= value) {
      engine %= value;
    }
  }
  else
  {
    engine &= value - 1;
  }
  unint64_t v13 = (REPHASEContext *)p_audioAssets->__table_.__bucket_list_.__ptr_.__value_[engine];
  do
  {
    unint64_t v14 = v13;
    unint64_t v13 = (REPHASEContext *)v13->super.isa;
  }
  while (v13 != v7);
  if (v14 == (REPHASEContext *)&self->_audioAssets.__table_.__p1_) {
    goto LABEL_19;
  }
  unint64_t v15 = (unint64_t)v14->_engine;
  if (v12.u32[0] > 1uLL)
  {
    if (v15 >= value) {
      v15 %= value;
    }
  }
  else
  {
    v15 &= value - 1;
  }
  if (v15 != engine)
  {
LABEL_19:
    if (isa)
    {
      unint64_t v16 = *((void *)isa + 1);
      if (v12.u32[0] > 1uLL)
      {
        unint64_t v17 = *((void *)isa + 1);
        if (v16 >= value) {
          unint64_t v17 = v16 % value;
        }
      }
      else
      {
        unint64_t v17 = v16 & (value - 1);
      }
      if (v17 == engine) {
        goto LABEL_23;
      }
    }
    p_audioAssets->__table_.__bucket_list_.__ptr_.__value_[engine] = 0;
    isa = v7->super.isa;
  }
  if (isa)
  {
    unint64_t v16 = *((void *)isa + 1);
LABEL_23:
    if (v12.u32[0] > 1uLL)
    {
      if (v16 >= value) {
        v16 %= value;
      }
    }
    else
    {
      v16 &= value - 1;
    }
    if (v16 != engine)
    {
      p_audioAssets->__table_.__bucket_list_.__ptr_.__value_[v16] = v14;
      isa = v7->super.isa;
    }
  }
  v14->super.isa = isa;
  v7->super.isa = 0;
  --self->_audioAssets.__table_.__p2_.__value_;
  if (LOBYTE(v7->_scenes.__table_.__p2_.__value_)) {
    re::DynamicString::deinit((re::DynamicString *)&v7->_scenes.__table_.__p3_);
  }
  operator delete(v8);
LABEL_32:
  os_unfair_lock_unlock(&p_audioAssetsMutex->m_lock);
}

- (int64_t)getReverbPreset
{
  return self->_reverbPreset;
}

- (void)setReverbPreset:(int64_t)a3 allowingSpaceBlend:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_reverbPreset != a3 || self->_allowSpaceBlend != a4)
  {
    uint64_t v7 = *re::audioLogObjects((re *)self);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = a3;
      __int16 v9 = 1024;
      BOOL v10 = v4;
      _os_log_impl(&dword_233120000, v7, OS_LOG_TYPE_DEFAULT, "-[REPhaseContext setReverbPreset:] Setting preset to %d, allowing space blend %d.", (uint8_t *)v8, 0xEu);
    }
    self->_reverbPreset = a3;
    self->_allowSpaceBlend = v4;
    [(REPHASEContext *)self applyReverbPreset];
    [(REPHASEContext *)self applySpaceBlendLevel];
  }
}

- (float)getSpaceBlendLevel
{
  return self->_spaceBlendLevel;
}

- (void)setSpaceBlendLevel:(float)a3
{
  if (self->_spaceBlendLevel != a3)
  {
    self->_spaceBlendLevel = a3;
    [(REPHASEContext *)self applySpaceBlendLevel];
  }
}

- (void)setSpaceBlendTargetPresetOrientation:(uint64_t)a1
{
  v1 = *(void **)(a1 + 8);
  if (v1)
  {
    objc_msgSend(v1, "setSpaceBlendTargetPresetOrientation:");
  }
  else
  {
    v2 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_233120000, v2, OS_LOG_TYPE_INFO, "-[REPhaseContext setSpaceBlendTargetPresetOrientation] => not setting space blend target preset orientation since engine is not yet created.", v3, 2u);
    }
  }
}

- (void)applyReverbPreset
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = re::audio::phasePrivateReverbPresetFor((re *)self->_reverbPreset);
  if (!self->_engine)
  {
    id v5 = (id)*re::audioLogObjects(0);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    int v9 = 136315394;
    BOOL v10 = re::audio::phasePrivateReverbPresetName(v3);
    __int16 v11 = 1024;
    int v12 = v3;
    uint64_t v6 = "[(REPhaseContext *)%s applyReverbPreset] since engine is not yet created.";
LABEL_9:
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    goto LABEL_10;
  }
  uint64_t v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) == 0)
  {
    id v5 = (id)*re::audioLogObjects((re *)v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    int v9 = 136315394;
    BOOL v10 = re::audio::phasePrivateReverbPresetName(v3);
    __int16 v11 = 1024;
    int v12 = v3;
    uint64_t v6 = "[(REPhaseContext *)%s applyReverbPreset] since engine doesn't respond to selector.";
    goto LABEL_9;
  }
  id v5 = (id)*re::audioLogObjects((re *)[(PHASEEngine *)self->_engine setSpaceBlendTargetPreset:v3]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    BOOL v10 = re::audio::phasePrivateReverbPresetName(v3);
    __int16 v11 = 1024;
    int v12 = v3;
    uint64_t v6 = "-[REPhaseContext applyReverbPreset] => [_engine setSpaceBlendTargetPreset:%s] (%d)";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
    _os_log_impl(&dword_233120000, v7, v8, v6, (uint8_t *)&v9, 0x12u);
  }
LABEL_11:
}

- (void)applySpaceBlendLevel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_engine)
  {
    uint64_t v3 = objc_opt_respondsToSelector();
    if (v3)
    {
      if (self->_allowSpaceBlend)
      {
        double spaceBlendLevel = self->_spaceBlendLevel;
      }
      else
      {
        os_log_type_t v8 = *re::audioLogObjects((re *)v3);
        uint64_t v3 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
        double spaceBlendLevel = 1.0;
        if (v3)
        {
          int v10 = 134217984;
          double v11 = 1.0;
          _os_log_debug_impl(&dword_233120000, v8, OS_LOG_TYPE_DEBUG, "-[REPhaseContext applySpaceBlendLevel] will force spaceBlendLevel to %.9g.", (uint8_t *)&v10, 0xCu);
        }
      }
      int v9 = *re::audioLogObjects((re *)v3);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 134217984;
        double v11 = spaceBlendLevel;
        _os_log_debug_impl(&dword_233120000, v9, OS_LOG_TYPE_DEBUG, "-[REPhaseContext applySpaceBlendLevel] => [_engine setSpaceBlendLevel:%.9g]", (uint8_t *)&v10, 0xCu);
      }
      [(PHASEEngine *)self->_engine setSpaceBlendLevel:spaceBlendLevel];
    }
    else
    {
      uint64_t v7 = *re::audioLogObjects((re *)v3);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        _os_log_error_impl(&dword_233120000, v7, OS_LOG_TYPE_ERROR, "[REPHASEContext applySpaceBlendLevel] - not applying space blend level because Phase runtime is too old.", (uint8_t *)&v10, 2u);
      }
    }
  }
  else
  {
    id v5 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = self->_spaceBlendLevel;
      int v10 = 134217984;
      double v11 = v6;
      _os_log_impl(&dword_233120000, v5, OS_LOG_TYPE_INFO, "-[REPhaseContext applySpaceBlendLevel] => not applying space blend level(%.9g) since engine is not yet created.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)baseMixerDefinitionWith:(const void *)a3
{
  uint64_t v4 = self;
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)a3;
  int v6 = *(unsigned __int8 *)(*(void *)a3 + 100);
  if (!*(unsigned char *)(*(void *)a3 + 100)) {
    goto LABEL_9;
  }
  if (*(_DWORD *)(v5 + 312))
  {
    uint64_t v7 = *re::audioLogObjects((re *)self);
    self = (REPHASEContext *)os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (self)
    {
      int v43 = *(unsigned __int8 *)(*(void *)a3 + 100);
      int v44 = *(_DWORD *)(*(void *)a3 + 312);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v74 = v43;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = v44;
      _os_log_error_impl(&dword_233120000, v7, OS_LOG_TYPE_ERROR, "Only point sources can have a directivity. Switching to omnidirectional. inputMode: %d, directivityMode: %d", buf, 0xEu);
    }
    uint64_t v5 = *(void *)a3;
    *(_DWORD *)(v5 + 312) = 0;
    int v6 = *(unsigned __int8 *)(v5 + 100);
  }
  if (v6 == 2)
  {
    [(REPHASEContext *)v4 sceneForID:*(void *)(v5 + 32)];
    re::audio::REPHASEAudioScene::getOrCreateEntity((os_unfair_lock_s *)v71, *(void *)(*(void *)a3 + 40), &v69);
    id v10 = objc_alloc(MEMORY[0x263F14900]);
    double v11 = re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
    uint64_t v12 = v69;
    int32x4_t v14 = *(int32x4_t *)(v69 + 48);
    float32x4_t v13 = *(float32x4_t *)(v69 + 64);
    float32x4_t v15 = *(float32x4_t *)(v69 + 80);
    LODWORD(v16) = HIDWORD(*(void *)(v69 + 64));
    float v17 = COERCE_FLOAT(*(void *)(v69 + 88));
    float v18 = v17 + (float)(*(float *)v14.i32 + v16);
    if (v18 >= 0.0)
    {
      float v32 = sqrtf(v18 + 1.0);
      float32x2_t v33 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v32 + v32));
      float32x2_t v34 = vmul_f32(v33, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v32 + v32), v33));
      LODWORD(v35) = vmul_f32(v34, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v32 + v32), v34)).u32[0];
      *(float *)&double v41 = vmuls_lane_f32(v35, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), v15), 1);
      float v42 = vmuls_n_f32(vsubq_f32(v15, (float32x4_t)vdupq_laneq_s32(v14, 2)).f32[0], v35);
    }
    else if (*(float *)v14.i32 < v16 || *(float *)v14.i32 < v17)
    {
      float v20 = 1.0 - *(float *)v14.i32;
      if (v16 >= v17)
      {
        float v45 = sqrtf(v16 + (float)(v20 - v17));
        float v46 = v45 + v45;
        float32x2_t v47 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v45 + v45));
        float32x2_t v48 = vmul_f32(v47, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v45 + v45), v47));
        *(float *)&double v41 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.i8, 1), v13).f32[0], vmul_f32(v48, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v45 + v45), v48)).f32[0]);
        float v42 = v46 * 0.25;
      }
      else
      {
        float v21 = sqrtf(v17 + (float)(v20 - v16));
        float32x2_t v22 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v21 + v21));
        float32x2_t v23 = vmul_f32(v22, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v21 + v21), v22));
        LODWORD(v24) = vmul_f32(v23, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v21 + v21), v23)).u32[0];
        *(float *)&double v41 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(v14, 2), v15).f32[0], v24);
        float v42 = vmuls_lane_f32(v24, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), v15), 1);
      }
    }
    else
    {
      float v36 = sqrtf(*(float *)v14.i32 + (float)((float)(1.0 - v16) - v17));
      *(float *)&unsigned int v37 = v36 + v36;
      float32x2_t v38 = vrecpe_f32((float32x2_t)v37);
      float32x2_t v39 = vmul_f32(v38, vrecps_f32((float32x2_t)v37, v38));
      LODWORD(v40) = vmul_f32(v39, vrecps_f32((float32x2_t)v37, v39)).u32[0];
      *(float *)&double v41 = *(float *)&v37 * 0.25;
      float v42 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.i8, 1), v13).f32[0], v40);
    }
    *((float *)&v41 + 1) = v42;
    double v49 = (void *)[v10 initWithChannelLayout:v11 orientation:v41];

    os_log_type_t v8 = v49;
    __int16 v50 = (id)*re::audioLogObjects(v8);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = *(void *)(v12 + 16);
      [(re *)v8 orientation];
      float v68 = v52;
      [(re *)v8 orientation];
      float v67 = v53;
      [(re *)v8 orientation];
      float v66 = v54;
      [(re *)v8 orientation];
      *(_DWORD *)buf = 138413314;
      *(void *)v74 = v51;
      *(_WORD *)&v74[8] = 2048;
      double v75 = v68;
      __int16 v76 = 2048;
      double v77 = v67;
      __int16 v78 = 2048;
      double v79 = v66;
      __int16 v80 = 2048;
      double v81 = v55;
      _os_log_impl(&dword_233120000, v50, OS_LOG_TYPE_DEFAULT, "[REPHASEContext baseMixerDefinitionWith] created ambient mixer definition for source %@, orientation = [%+4.3f,%+4.3f,%+4.3f,%+4.3f]", buf, 0x34u);
    }

    if (!v8)
    {
      v57 = (id)*re::audioLogObjects(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        uint64_t v64 = *(void *)(*(void *)a3 + 24);
        re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
        double v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 134218242;
        *(void *)v74 = v64;
        *(_WORD *)&v74[8] = 2112;
        double v75 = v65;
        _os_log_error_impl(&dword_233120000, v57, OS_LOG_TYPE_ERROR, "[REPHASEContext baseMixerDefinitionWith] Failed to create ambient mixer definition for token: %llu with channel layout %@", buf, 0x16u);
      }
    }

    if (v70) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v70);
    }
    if (v72) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v72);
    }
  }
  else
  {
    if (v6 != 1)
    {
      if (v6)
      {
        long long v31 = *re::audioLogObjects((re *)self);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          int v61 = *(unsigned __int8 *)(*(void *)a3 + 100);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v74 = v61;
          _os_log_error_impl(&dword_233120000, v31, OS_LOG_TYPE_ERROR, "Unrecognized input mode for AudioFileAsset %d", buf, 8u);
        }
LABEL_28:
        os_log_type_t v8 = 0;
        goto LABEL_41;
      }
LABEL_9:
      os_log_type_t v8 = [(REPHASEContext *)v4 getOrCreateSpatialMixerDefinitionUsing:a3];
      if (v8) {
        goto LABEL_41;
      }
      int v9 = (id)*re::audioLogObjects(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v59 = *(void *)(*(void *)a3 + 24);
        re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
        double v60 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 134218242;
        *(void *)v74 = v59;
        *(_WORD *)&v74[8] = 2112;
        double v75 = v60;
        _os_log_error_impl(&dword_233120000, v9, OS_LOG_TYPE_ERROR, "[REPHASEContext baseMixerDefinitionWith] Failed to create spatial mixer definition for token: %llu with channel layout %@", buf, 0x16u);
      }
      goto LABEL_28;
    }
    uint64_t v25 = (v4->_mixerDefNameCounter + 1);
    v4->_mixerDefNameCounter = v25;
    unint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"channelMixer-%d", v25);
    id v27 = objc_alloc(MEMORY[0x263F14918]);
    unint64_t v28 = re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
    os_log_type_t v8 = (re *)[v27 initWithChannelLayout:v28 identifier:v26];

    if (!v8)
    {
      uint64_t v30 = (id)*re::audioLogObjects(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v62 = *(void *)(*(void *)a3 + 24);
        re::audio::REPHASESoundPrepareState::getChannelLayout(*(re::audio::REPHASESoundPrepareState **)a3);
        double v63 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 134218242;
        *(void *)v74 = v62;
        *(_WORD *)&v74[8] = 2112;
        double v75 = v63;
        _os_log_error_impl(&dword_233120000, v30, OS_LOG_TYPE_ERROR, "[REPHASEContext baseMixerDefinitionWith] Failed to create channel mixer definition for token: %llu with channel layout %@", buf, 0x16u);
      }
    }
  }
LABEL_41:
  return v8;
}

- (id)createSamplerDefinitionForToken:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = -[REPHASEContext eventFor:](self, "eventFor:");
  int v6 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v5 = [v5 soundEvent];
  uint64_t v7 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  [v6 prepareState];
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
  }

  if (*(void *)buf)
  {
    [v6 prepareState];
    uint64_t v8 = *(void *)(*(void *)buf + 64);
    [v6 prepareState];
    int v9 = [(REPHASEContext *)self samplerDefForFileAsset:v8 with:&v12];
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v13);
    }
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  else
  {
LABEL_10:
    id v10 = *re::audioLogObjects((re *)v5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl(&dword_233120000, v10, OS_LOG_TYPE_ERROR, "cannot create sampler definition for token %llu with invalid event %@", buf, 0x16u);
    }
    int v9 = 0;
  }

  return v9;
}

- (id)samplerDefForFileAsset:(unint64_t)a3 with:(const void *)a4
{
  uint64_t v7 = [(REPHASEContext *)self baseMixerDefinitionWith:a4];
  uint64_t v8 = [(REPHASEContext *)self samplerDefForFileAsset:a3 mixerDefinition:v7 prepareState:a4];

  return v8;
}

- (id)samplerDefForFileAsset:(unint64_t)a3 mixerDefinition:(id)a4 prepareState:(const void *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (v8)
  {
    int v9 = [(REPHASEContext *)self phaseIDForAssetID:a3];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F14980]) initWithSoundAssetIdentifier:v9 mixerDefinition:v8];
    p_audioAssetsMutex = &self->_audioAssetsMutex;
    os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
    uint64_t v12 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_, a3);
    if (v12)
    {
      float32x4_t v13 = v12;
      [v10 setCalibrationMode:*((int *)v12 + 8) level:v12[14]];
      if (*((unsigned char *)v13 + 56))
      {
        uint64_t v14 = *(void *)a5;
        if ((_BYTE)v13[9]) {
          uint64_t v15 = (char *)*((void *)v13 + 10);
        }
        else {
          uint64_t v15 = (char *)v13 + 73;
        }
        unint64_t v19 = *(void *)(v14 + 32);
        unint64_t v20 = *(void *)(v14 + 48);
        std::string::basic_string[abi:ne180100]<0>(__p, v15);
        REAudioComputePHASEMixGroupID(v19, v20, (uint64_t)__p, &buf);
        if (v29 < 0) {
          operator delete(__p[0]);
        }
        float v21 = [(REPHASEContext *)self engine];
        float32x2_t v22 = [v21 groups];
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_std::string buf = &buf;
        }
        else {
          p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
        }
        float v24 = [NSString stringWithUTF8String:p_buf];
        uint64_t v25 = [v22 objectForKey:v24];
        [v10 setGroup:v25];

        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
      }
      os_unfair_lock_unlock(&self->_audioAssetsMutex.m_lock);
      [v10 setGainMetaParameterDefinition:self->_gainLinearParamDefinition];
      [v10 setRateMetaParameterDefinition:self->_rateParamDefinition];
      [v10 setRate:1.0];
      [v10 setPlaybackMode:*(_DWORD *)(*(void *)a5 + 96) != 0];
      id v17 = v10;
    }
    else
    {
      float v18 = *re::audioLogObjects(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        std::string::size_type v27 = *(void *)(*(void *)a5 + 24);
        LODWORD(buf.__r_.__value_.__l.__data_) = 134218240;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v27;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = a3;
        _os_log_error_impl(&dword_233120000, v18, OS_LOG_TYPE_ERROR, "Error: Preparing sampler definition for token %llu, unknown asset %llu", (uint8_t *)&buf, 0x16u);
      }
      os_unfair_lock_unlock(&p_audioAssetsMutex->m_lock);
      id v17 = 0;
    }
  }
  else
  {
    float v16 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = a3;
      _os_log_fault_impl(&dword_233120000, v16, OS_LOG_TYPE_FAULT, "[REPHASEContext samplerDefForFileAsset:mixerDefinition:prepareState] Failed to initialize PHASESamplerNodeDefinition for assetID: %llu.PHASEChannelMixerDefinition returned a null mixerDef", (uint8_t *)&buf, 0xCu);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)mixerParametersForPrepareState:(const void *)a3 source:(id)a4 listener:(id)a5 mixerIdentifiers:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x263F14960]);
  if (*(unsigned char *)(*(void *)a3 + 100))
  {
    if (*(unsigned char *)(*(void *)a3 + 100) != 2) {
      goto LABEL_19;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "addAmbientMixerParametersWithIdentifier:listener:", *(void *)(*((void *)&v22 + 1) + 8 * i), v10, (void)v22);
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v14);
    }
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v11;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v17);
          }
          [v12 addSpatialMixerParametersWithIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * j) source:v9 listener:v10];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v18);
    }
  }

LABEL_19:
  return v12;
}

- (void)prepare:(shared_ptr<re::audio::REPHASESoundPrepareState>)a3
{
  ptr = a3.__ptr_;
  uint64_t v83 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v5 = *(void **)(*(void *)ptr + 24);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3321888768;
  aBlock[2] = __26__REPHASEContext_prepare___block_invoke;
  aBlock[3] = &unk_26E6D9F98;
  objc_copyWeak(v70, &location);
  uint64_t v7 = *(void **)ptr;
  int v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
  v70[1] = v5;
  v70[2] = v7;
  v71 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v8 = (re *)_Block_copy(aBlock);
  id v9 = *re::audioLogObjects(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 134217984;
    id v78 = v5;
    _os_log_impl(&dword_233120000, v9, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] token: %llu", buf, 0xCu);
  }
  [(REPHASEContext *)self sceneForID:*(void *)(*(void *)ptr + 32)];
  re::audio::REPHASEAudioScene::getOrCreateEntityWithIncrementedCount((os_unfair_lock_s *)v67, *(void *)(*(void *)ptr + 40), &v65);
  uint64_t v10 = *(void *)ptr;
  if (!*(void *)(*(void *)ptr + 280) && !*(void *)(v10 + 288) || *(unsigned char *)(v10 + 296))
  {
    id v11 = (id *)(v65 + 16);
    id v12 = *(id *)(v65 + 16);
    if (v12)
    {
LABEL_9:
      objc_msgSend(v12, "setWorldTransform:", *(double *)(*(void *)ptr + 112), *(double *)(*(void *)ptr + 128), *(double *)(*(void *)ptr + 144), *(double *)(*(void *)ptr + 160));

      char v13 = 0;
      goto LABEL_11;
    }
    id v12 = (id)[objc_alloc(MEMORY[0x263F149A8]) initWithEngine:self->_engine];
    objc_storeStrong(v11, v12);
    int v25 = *(unsigned __int8 *)(*(void *)ptr + 208);
    long long v27 = (id)*re::audioLogObjects(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (!v28) {
        goto LABEL_52;
      }
      long long v29 = *(void **)(*(void *)ptr + 40);
      re::audio::stringFromPose((re::audio *)(*(void *)ptr + 112), __p);
      if (v64 >= 0) {
        uint64_t v30 = __p;
      }
      else {
        uint64_t v30 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 134218499;
      id v78 = v29;
      __int16 v79 = 2048;
      __int16 v80 = v5;
      __int16 v81 = 2085;
      uint64_t v82 = v30;
      uint64_t v31 = "[REPhaseContext] [Prepare] creating PHASESource. EntityID(%llu) Token(%llu) Transform: %{sensitive}s";
    }
    else
    {
      if (!v28) {
        goto LABEL_52;
      }
      float32x2_t v33 = *(void **)(*(void *)ptr + 40);
      re::audio::stringFromPose((re::audio *)(*(void *)ptr + 112), __p);
      if (v64 >= 0) {
        float32x2_t v34 = __p;
      }
      else {
        float32x2_t v34 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 134218498;
      id v78 = v33;
      __int16 v79 = 2048;
      __int16 v80 = v5;
      __int16 v81 = 2080;
      uint64_t v82 = v34;
      uint64_t v31 = "[REPhaseContext] [Prepare] creating PHASESource. EntityID(%llu) Token(%llu) Transform: %s";
    }
    _os_log_impl(&dword_233120000, v27, OS_LOG_TYPE_DEFAULT, v31, buf, 0x20u);
    if (v64 < 0) {
      operator delete(__p[0]);
    }
LABEL_52:

    float v35 = [(PHASEEngine *)self->_engine rootObject];
    id v62 = 0;
    [v35 addChild:v12 error:&v62];
    id v36 = v62;

    if (v36)
    {
      float32x2_t v38 = *re::audioLogObjects(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 138412546;
        id v78 = v36;
        __int16 v79 = 2048;
        __int16 v80 = v5;
        _os_log_error_impl(&dword_233120000, v38, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] Could not add entity to PHASE %@, token %llu", buf, 0x16u);
      }
      (*((void (**)(re *, void, id))v8 + 2))(v8, 0, v36);

      goto LABEL_68;
    }
    goto LABEL_9;
  }
  char v13 = 1;
LABEL_11:
  re::audio::REPHASEAudioScene::getListener(v67);
  uint64_t v14 = (PHASEListener *)objc_claimAutoreleasedReturnValue();
  listener = self->_listener;
  self->_listener = v14;

  if (self->_listener) {
    char v16 = 1;
  }
  else {
    char v16 = v13;
  }
  if (v16)
  {
    uint64_t v17 = *(void *)(*(void *)ptr + 56);
    if (v17 > 1)
    {
      if (v17 == 2)
      {
        float v45 = (std::__shared_weak_count *)*((void *)ptr + 1);
        uint64_t v52 = *(void *)ptr;
        float v53 = v45;
        if (v45) {
          atomic_fetch_add_explicit(&v45->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v50 = v65;
        uint64_t v51 = v66;
        if (v66) {
          atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(REPHASEContext *)self prepareGeneratorType:&v52 phaseEntity:&v50 completion:v8];
        if (v51) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v51);
        }
        uint64_t v19 = v53;
        if (v53) {
          goto LABEL_67;
        }
      }
      else
      {
        if (v17 != 100) {
          goto LABEL_56;
        }
        uint64_t v32 = (std::__shared_weak_count *)*((void *)ptr + 1);
        uint64_t v48 = *(void *)ptr;
        double v49 = v32;
        if (v32) {
          atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v46 = v65;
        float32x2_t v47 = v66;
        if (v66) {
          atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(REPHASEContext *)self prepareExternalType:&v48 phaseEntity:&v46 completion:v8];
        if (v47) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v47);
        }
        uint64_t v19 = v49;
        if (v49) {
          goto LABEL_67;
        }
      }
    }
    else
    {
      if (v17)
      {
        if (v17 == 1)
        {
          uint64_t v18 = (std::__shared_weak_count *)*((void *)ptr + 1);
          uint64_t v56 = *(void *)ptr;
          v57 = v18;
          if (v18) {
            atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          uint64_t v54 = v65;
          float v55 = v66;
          if (v66) {
            atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          [(REPHASEContext *)self prepareFileGroupType:&v56 phaseEntity:&v54 completion:v8];
          if (v55) {
            std::__shared_weak_count::__release_shared[abi:nn180100](v55);
          }
          uint64_t v19 = v57;
          if (!v57) {
            goto LABEL_68;
          }
LABEL_67:
          std::__shared_weak_count::__release_shared[abi:nn180100](v19);
          goto LABEL_68;
        }
LABEL_56:
        float32x2_t v39 = (void *)MEMORY[0x263F087E8];
        uint64_t v73 = *MEMORY[0x263F08320];
        v74 = @"Unsupported asset type";
        float v40 = [NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        double v41 = [v39 errorWithDomain:@"com.apple.re.internal" code:-110 userInfo:v40];

        int v43 = *re::audioLogObjects(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 134218242;
          id v78 = v5;
          __int16 v79 = 2112;
          __int16 v80 = v41;
          _os_log_error_impl(&dword_233120000, v43, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] token %llu, error %@", buf, 0x16u);
          if (!v8) {
            goto LABEL_59;
          }
        }
        else if (!v8)
        {
LABEL_59:

          goto LABEL_68;
        }
        (*((void (**)(re *, void, void *))v8 + 2))(v8, 0, v41);
        goto LABEL_59;
      }
      int v44 = (std::__shared_weak_count *)*((void *)ptr + 1);
      uint64_t v60 = *(void *)ptr;
      int v61 = v44;
      if (v44) {
        atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v58 = v65;
      uint64_t v59 = v66;
      if (v66) {
        atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(REPHASEContext *)self prepareFileType:&v60 phaseEntity:&v58 completion:v8];
      if (v59) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v59);
      }
      uint64_t v19 = v61;
      if (v61) {
        goto LABEL_67;
      }
    }
  }
  else
  {
    unint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v75 = *MEMORY[0x263F08320];
    __int16 v76 = @"In order for audio to be rendered, the app must have a listener component attached to an active entity in the scene.";
    float v21 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    long long v22 = [v20 errorWithDomain:@"com.apple.re.internal" code:-105 userInfo:v21];

    long long v24 = *re::audioLogObjects(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 138412290;
      id v78 = v22;
      _os_log_error_impl(&dword_233120000, v24, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] Could not prepare audio due to lack of listener entity %@", buf, 0xCu);
    }
    (*((void (**)(re *, void, void *))v8 + 2))(v8, 0, v22);
  }
LABEL_68:
  if (v66) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v66);
  }
  if (v68) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v68);
  }

  if (v71) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v71);
  }
  objc_destroyWeak(v70);
  objc_destroyWeak(&location);
}

void __26__REPHASEContext_prepare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  int v6 = a3;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    unsigned __int8 v9 = atomic_load(WeakRetained + 20);
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = (re *)_Block_copy(*(const void **)(*(void *)(a1 + 48) + 352));
      id v11 = v10;
      if (v10)
      {
        if (!v6)
        {
          if ([v8 addEventIfStillPreparing:v5 forToken:*(void *)(a1 + 40)])
          {
            (*((void (**)(re *, void))v11 + 2))(v11, 0);
            int v6 = 0;
          }
          else
          {
            unint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"sound event was cleaned up before preparation completed for token=%llu", *(void *)(a1 + 40));
            float v21 = (void *)MEMORY[0x263F087E8];
            uint64_t v26 = *MEMORY[0x263F08320];
            long long v27 = v20;
            long long v22 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
            int v6 = [v21 errorWithDomain:@"com.apple.re.internal" code:-200 userInfo:v22];

            long long v24 = *re::audioLogObjects(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = *(void *)(a1 + 40);
              *(_DWORD *)std::string buf = 134218242;
              uint64_t v29 = v25;
              __int16 v30 = 2112;
              uint64_t v31 = v6;
              _os_log_impl(&dword_233120000, v24, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] token %llu couldn't add event: %@", buf, 0x16u);
            }
            (*((void (**)(re *, unsigned __int8 *))v11 + 2))(v11, v6);
            [v5 stopAndDestroy];
            [v8 clearPreparingStateForToken:*(void *)(a1 + 40)];
            [v8 decrementOrDestroyEntityWithZeroCount:*(void *)(*(void *)(a1 + 48) + 40)];
          }
          goto LABEL_17;
        }
        id v12 = *re::audioLogObjects(v10);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 40);
          *(_DWORD *)std::string buf = 134217984;
          uint64_t v29 = v13;
          _os_log_impl(&dword_233120000, v12, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] token %llu calling completion with error", buf, 0xCu);
        }
        (*((void (**)(re *, unsigned __int8 *))v11 + 2))(v11, v6);
      }
      else
      {
        uint64_t v18 = *re::audioLogObjects(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 40);
          *(_DWORD *)std::string buf = 134217984;
          uint64_t v29 = v19;
          _os_log_impl(&dword_233120000, v18, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] prepare state for token %llu does not have completion handler", buf, 0xCu);
        }
      }
      [v5 stopAndDestroy];
      [v8 decrementOrDestroyEntityWithZeroCount:*(void *)(*(void *)(a1 + 48) + 40)];
      [v8 clearPreparingStateForToken:*(void *)(a1 + 40)];
LABEL_17:

      goto LABEL_18;
    }
    char v16 = *re::audioLogObjects((re *)WeakRetained);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)std::string buf = 134218242;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      _os_log_impl(&dword_233120000, v16, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] token %llu, %@ stopped and destroyed before sound event prepared", buf, 0x16u);
    }
    [v5 stopAndDestroy];
    [v8 decrementOrDestroyEntityWithZeroCount:*(void *)(*(void *)(a1 + 48) + 40)];
  }
  else
  {
    uint64_t v14 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)std::string buf = 134217984;
      uint64_t v29 = v15;
      _os_log_impl(&dword_233120000, v14, OS_LOG_TYPE_DEFAULT, "[REPHASEContext] [Prepare] token %llu, dealloc'd before sound event preparation", buf, 0xCu);
    }
    [v5 stopAndDestroy];
  }
LABEL_18:
}

- (void)prepareExternalType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v72[1] = *MEMORY[0x263EF8340];
  id v8 = a4.var0;
  if (*(void *)(*(void *)ptr + 304))
  {
    *(_WORD *)char v64 = 0;
    v64[2] = 0;
    *(_DWORD *)&v64[4] = 0;
    *(_DWORD *)&v64[8] = 0;
    *(_OWORD *)&v64[16] = xmmword_234377550;
    v65[0] = 0;
    BOOL v68 = 0;
    char v70 = 0;
    os_unfair_lock_lock(&self->_audioAssetsMutex.m_lock);
    uint64_t v9 = *(void *)ptr;
    unint64_t v10 = *(void *)(*(void *)ptr + 24);
    id v11 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_, v10);
    if (v11)
    {
      id v12 = v11;
      long long v13 = *(_OWORD *)(v11 + 5);
      *(_OWORD *)char v64 = *(_OWORD *)(v11 + 3);
      *(_OWORD *)&v64[16] = v13;
      re::Optional<re::DynamicString>::operator=(v65, (unsigned __int8 *)v11 + 56);
      if (v68 || *((unsigned char *)v12 + 96))
      {
        if (!v68 || *((unsigned char *)v12 + 96))
        {
          if (!v68) {
            BOOL v68 = *((unsigned char *)v12 + 96) != 0;
          }
          int v69 = *((_DWORD *)v12 + 25);
        }
        else
        {
          BOOL v68 = 0;
        }
      }
      char v70 = *((unsigned char *)v12 + 104);
      os_unfair_lock_unlock(&self->_audioAssetsMutex.m_lock);
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"Cannot prepare external stream UUID %@ (token=%llu) without configuration", *(void *)(v9 + 304), v10];
      unint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v62 = *MEMORY[0x263F08320];
      double v63 = v19;
      float v21 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      long long v22 = [v20 errorWithDomain:@"com.apple.re.internal" code:-210 userInfo:v21];

      os_unfair_lock_unlock(&self->_audioAssetsMutex.m_lock);
      if (v22)
      {
        long long v24 = *re::audioLogObjects(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          float v40 = *(re **)(*(void *)ptr + 24);
          *(_DWORD *)std::string buf = 134218242;
          uint64_t v51 = v40;
          __int16 v52 = 2112;
          float v53 = v22;
          _os_log_error_impl(&dword_233120000, v24, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] token %llu, error %@", buf, 0x16u);
        }
        (*((void (**)(REPHASEEntity *, void, void *))v8 + 2))(v8, 0, v22);
        goto LABEL_26;
      }
    }
    uint64_t v25 = *(void *)ptr;
    *(_DWORD *)(v25 + 212) = *(_DWORD *)&v64[8];
    *(void *)(v25 + 216) = *(void *)&v64[16];
    int v44 = v8;
    int v43 = [(REPHASEContext *)self baseMixerDefinitionWith:ptr];
    uint64_t v26 = (re *)*(id *)(*(void *)ptr + 304);
    long long v27 = *re::audioLogObjects(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v28 = *(void **)(*(void *)ptr + 24);
      *(_DWORD *)std::string buf = 138413570;
      uint64_t v51 = v26;
      __int16 v52 = 2048;
      float v53 = v28;
      __int16 v54 = 1024;
      int v55 = *(_DWORD *)&v64[4];
      __int16 v56 = 2048;
      uint64_t v57 = *(void *)&v64[24];
      __int16 v58 = 1024;
      int v59 = *(_DWORD *)&v64[8];
      __int16 v60 = 2048;
      uint64_t v61 = *(void *)&v64[16];
      _os_log_impl(&dword_233120000, v27, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] creating controller for external stream %@ (token=%llu) with normalizationMode=%d, targetLUFS=%0.2f, calibrationMode=%d, calibrationLevel=%0.2f", buf, 0x36u);
    }
    unint64_t engine = self->_engine;
    uint64_t v42 = *(void *)(*(void *)cntrl + 16);
    listener = self->_listener;
    uint64_t v32 = *(unsigned int *)&v64[4];
    int v31 = *(_DWORD *)&v64[8];
    long long v33 = *(_OWORD *)&v64[16];
    uint64_t v34 = *(void *)ptr;
    uint64_t v35 = *(void *)(*(void *)ptr + 16);
    phaseQueue = self->_phaseQueue;
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3321888768;
    v45[2] = __61__REPHASEContext_prepareExternalType_phaseEntity_completion___block_invoke;
    v45[3] = &unk_26E6D9FD0;
    unsigned int v37 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v48 = v34;
    double v49 = v37;
    if (v37) {
      atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    float32x2_t v47 = v44;
    float32x2_t v38 = v26;
    uint64_t v46 = v38;
    LODWORD(v41) = v31;
    +[REPHASESoundEvent eventWithEngine:engine streamUUID:v38 mixerDefinition:v43 source:v42 listener:listener normalizationMode:v32 targetLUFS:*((double *)&v33 + 1) calibrationMode:*(double *)&v33 calibrationLevel:v41 audioSession:v35 phaseQueue:phaseQueue callback:v45];

    id v8 = v44;
    if (v49) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v49);
    }

    long long v22 = 0;
LABEL_26:

    if (v65[0] && v66 && (v67 & 1) != 0) {
      (*(void (**)(void))(*(void *)v66 + 40))();
    }
    goto LABEL_30;
  }
  uint64_t v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v71 = *MEMORY[0x263F08320];
  v72[0] = @"Could not prepare PHASESoundEvent for external stream. Invalid UUID";
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
  char v16 = [v14 errorWithDomain:@"com.apple.re.internal" code:-210 userInfo:v15];

  uint64_t v18 = *re::audioLogObjects(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v39 = *(void *)(*(void *)ptr + 24);
    *(_DWORD *)char v64 = 134218242;
    *(void *)&v64[4] = v39;
    *(_WORD *)&v64[12] = 2112;
    *(void *)&v64[14] = v16;
    _os_log_error_impl(&dword_233120000, v18, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] token %llu, error %@", v64, 0x16u);
  }
  (*((void (**)(REPHASEEntity *, void, void *))v8 + 2))(v8, 0, v16);

LABEL_30:
}

void __61__REPHASEContext_prepareExternalType_phaseEntity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  int v6 = a3;
  uint64_t v7 = *re::audioLogObjects(v6);
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 24);
      *(_DWORD *)std::string buf = 134218242;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      unint64_t v20 = v6;
      _os_log_error_impl(&dword_233120000, v7, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] token %llu, error %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(re **)(*(void *)(a1 + 48) + 24);
      *(_DWORD *)std::string buf = 138412546;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      unint64_t v20 = v9;
      _os_log_impl(&dword_233120000, v7, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] Successfully created controller for external stream %@ (token=%llu). Preparing.", buf, 0x16u);
    }
    unint64_t v10 = *(std::__shared_weak_count **)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 48);
    char v16 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [v5 setPrepareState:&v15];
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v16);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__REPHASEContext_prepareExternalType_phaseEntity_completion___block_invoke_75;
    v12[3] = &unk_264BE2BD0;
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    [v13 prepareWithCompletion:v12];
  }
}

void __61__REPHASEContext_prepareExternalType_phaseEntity_completion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    [*(id *)(a1 + 32) resume];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)prepareFileGroupType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v94[1] = *MEMORY[0x263EF8340];
  v72 = a4.var0;
  id v74 = objc_alloc_init(MEMORY[0x263F14978]);
  [v74 setUniqueSelectionQueueLength:*(void *)(*(void *)ptr + 80) - *(void *)(*(void *)ptr + 72) > 8uLL];
  uint64_t v75 = [(REPHASEContext *)self baseMixerDefinitionWith:ptr];
  uint64_t v8 = cntrl;
  uint64_t v9 = [MEMORY[0x263EFF980] arrayWithCapacity:(uint64_t)(*(void *)(*(void *)ptr + 80) - *(void *)(*(void *)ptr + 72)) >> 3];
  uint64_t v11 = *(void **)(*(void *)ptr + 72);
  unint64_t v10 = *(void **)(*(void *)ptr + 80);
  if (v11 == v10)
  {
LABEL_4:
    uint64_t v15 = v8;
    uint64_t v73 = [(REPHASEContext *)self mixerParametersForPrepareState:ptr source:*(void *)(*(void *)v8 + 16) listener:self->_listener mixerIdentifiers:v9];
    char v16 = v74;
    uint64_t v17 = [(PHASEEngine *)self->_engine assetRegistry];
    id v86 = 0;
    uint64_t v71 = [v17 registerSoundEventAssetWithRootNode:v74 identifier:0 error:&v86];
    id v18 = v86;

    __int16 v19 = [REPHASESoundEvent alloc];
    unint64_t engine = self->_engine;
    uint64_t v21 = *(void *)(*(void *)v15 + 16);
    listener = self->_listener;
    uint64_t v23 = *(void *)(*(void *)ptr + 16);
    phaseQueue = self->_phaseQueue;
    id v85 = v18;
    uint64_t v25 = [(REPHASESoundEvent *)v19 initWithEngine:engine soundEventAsset:v71 source:v21 listener:listener mixerParameters:v73 audioSession:v23 phaseQueue:phaseQueue outError:&v85];
    id v26 = v85;

    if (!v25)
    {
      if (v26)
      {
        float v53 = [NSString stringWithFormat:@"%@", v26];
        __int16 v54 = (void *)MEMORY[0x263F087E8];
        uint64_t v55 = *MEMORY[0x263F08320];
        v92[0] = v53;
        uint64_t v56 = *MEMORY[0x263F08608];
        uint64_t v90 = v55;
        uint64_t v91 = v56;
        uint64_t v57 = v26;
      }
      else
      {
        __int16 v54 = (void *)MEMORY[0x263F087E8];
        float v53 = @"Could not create PHASESoundEvent for file group.";
        uint64_t v66 = *MEMORY[0x263F08608];
        uint64_t v90 = *MEMORY[0x263F08320];
        uint64_t v91 = v66;
        v92[0] = @"Could not create PHASESoundEvent for file group.";
        uint64_t v57 = [MEMORY[0x263EFF9D0] null];
      }
      v92[1] = v57;
      char v67 = [NSDictionary dictionaryWithObjects:v92 forKeys:&v90 count:2];
      BOOL v68 = [v54 errorWithDomain:@"com.apple.re.internal" code:-200 userInfo:v67];

      if (!v26) {
      (*((void (**)(REPHASEEntity *, void, void *))v72 + 2))(v72, 0, v68);
      }

      goto LABEL_44;
    }
    [(PHASEListener *)self->_listener worldTransform];
    *(_OWORD *)std::string buf = v27;
    *(_OWORD *)&buf[16] = v28;
    long long v88 = v29;
    long long v89 = v30;
    re::audio::stringFromPose((re::audio *)buf, v83);
    [*(id *)(*(void *)v15 + 16) worldTransform];
    *(_OWORD *)std::string buf = v31;
    *(_OWORD *)&buf[16] = v32;
    long long v88 = v33;
    long long v89 = v34;
    uint64_t v35 = (re *)re::audio::stringFromPose((re::audio *)buf, __p);
    int v36 = *(unsigned __int8 *)(*(void *)ptr + 208);
    unsigned int v37 = *re::audioLogObjects(v35);
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v36)
    {
      if (v38)
      {
        uint64_t v39 = *(void *)(*(void *)ptr + 24);
        *(_DWORD *)std::string buf = 134218243;
        *(void *)&uint8_t buf[4] = v39;
        *(_WORD *)&unsigned char buf[12] = 2117;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_233120000, v37, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): %{sensitive}@", buf, 0x16u);
      }
      float v40 = *re::audioLogObjects((re *)v38);
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v41)
      {
        uint64_t v42 = *(void *)(*(void *)ptr + 24);
        int v43 = v83;
        if (v84 < 0) {
          int v43 = (void **)v83[0];
        }
        *(_DWORD *)std::string buf = 134218243;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&unsigned char buf[12] = 2085;
        *(void *)&buf[14] = v43;
        _os_log_impl(&dword_233120000, v40, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): Listener = %{sensitive}s", buf, 0x16u);
      }
      int v44 = *re::audioLogObjects((re *)v41);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      uint64_t v45 = *(void *)(*(void *)ptr + 24);
      uint64_t v46 = __p;
      if (v82 < 0) {
        uint64_t v46 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 134218243;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&unsigned char buf[12] = 2085;
      *(void *)&buf[14] = v46;
      float32x2_t v47 = "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): Position = %{sensitive}s";
    }
    else
    {
      if (v38)
      {
        uint64_t v58 = *(void *)(*(void *)ptr + 24);
        *(_DWORD *)std::string buf = 134218242;
        *(void *)&uint8_t buf[4] = v58;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_233120000, v37, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): %@", buf, 0x16u);
      }
      int v59 = *re::audioLogObjects((re *)v38);
      BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      if (v60)
      {
        uint64_t v61 = *(void *)(*(void *)ptr + 24);
        uint64_t v62 = v83;
        if (v84 < 0) {
          uint64_t v62 = (void **)v83[0];
        }
        *(_DWORD *)std::string buf = 134218242;
        *(void *)&uint8_t buf[4] = v61;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = v62;
        _os_log_impl(&dword_233120000, v59, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): Listener = %s", buf, 0x16u);
      }
      int v44 = *re::audioLogObjects((re *)v60);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      uint64_t v63 = *(void *)(*(void *)ptr + 24);
      char v64 = __p;
      if (v82 < 0) {
        char v64 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 134218242;
      *(void *)&uint8_t buf[4] = v63;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v64;
      float32x2_t v47 = "[REPhaseContext] [prepareFileGroup] Created sound event for token %llu (file): Position = %s";
    }
    _os_log_impl(&dword_233120000, v44, OS_LOG_TYPE_DEFAULT, v47, buf, 0x16u);
LABEL_32:
    uint64_t v65 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v79 = *(void *)ptr;
    __int16 v80 = v65;
    if (v65) {
      atomic_fetch_add_explicit(&v65->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(REPHASESoundEvent *)v25 setPrepareState:&v79];
    if (v80) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v80);
    }
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __62__REPHASEContext_prepareFileGroupType_phaseEntity_completion___block_invoke;
    v76[3] = &unk_264BE2BD0;
    id v78 = v72;
    double v77 = v25;
    [(REPHASESoundEvent *)v77 prepareWithCompletion:v76];

    if (v82 < 0) {
      operator delete(__p[0]);
    }
    if (v84 < 0) {
      operator delete(v83[0]);
    }
LABEL_44:

    uint64_t v51 = (void *)v71;
    goto LABEL_45;
  }
  while (1)
  {
    id v12 = [(REPHASEContext *)self samplerDefForFileAsset:*v11 mixerDefinition:v75 prepareState:ptr];
    if (!v12) {
      break;
    }
    [v74 addSubtree:v12 weight:&unk_26E749CE0];
    id v13 = [v12 mixerDefinition];
    id v14 = [v13 identifier];

    [v9 addObject:v14];
    if (++v11 == v10) {
      goto LABEL_4;
    }
  }
  uint64_t v48 = *re::audioLogObjects(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    uint64_t v69 = *(void *)(*(void *)ptr + 64);
    uint64_t v70 = *(void *)(*(void *)ptr + 24);
    *(_DWORD *)std::string buf = 134218240;
    *(void *)&uint8_t buf[4] = v69;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v70;
    _os_log_error_impl(&dword_233120000, v48, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] Error creating sampler definition for asset: %llu and token: %llu. Sound event will not be prepared.", buf, 0x16u);
  }
  uint64_t v73 = (void (**)(void, void))_Block_copy(*(const void **)(*(void *)ptr + 352));
  char v16 = v74;
  uint64_t v49 = objc_msgSend(NSString, "stringWithFormat:", @"Error creating sampler definition for asset: %llu. Sound event will not be prepared.", *(void *)(*(void *)ptr + 64));
  uint64_t v50 = (void *)MEMORY[0x263F087E8];
  uint64_t v93 = *MEMORY[0x263F08320];
  v94[0] = v49;
  uint64_t v51 = (void *)v49;
  __int16 v52 = [NSDictionary dictionaryWithObjects:v94 forKeys:&v93 count:1];
  id v26 = [v50 errorWithDomain:@"com.apple.re.internal" code:-110 userInfo:v52];

  ((void (**)(void, id))v73)[2](v73, v26);
LABEL_45:
}

uint64_t __62__REPHASEContext_prepareFileGroupType_phaseEntity_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)prepareGeneratorType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  uint64_t v46 = *MEMORY[0x263EF8340];
  unsigned int v37 = a4.var0;
  BOOL v38 = (void *)[objc_alloc(MEMORY[0x263EF9328]) initWithLayoutTag:*(unsigned int *)(*(void *)ptr + 184)];
  uint64_t v8 = [objc_alloc(MEMORY[0x263EF9388]) initStandardFormatWithSampleRate:v38 channelLayout:self->_sampleRate];
  uint64_t v9 = *(void **)(*(void *)ptr + 104);
  *(void *)(*(void *)ptr + 104) = v8;

  uint64_t v10 = *(void *)ptr;
  *(_DWORD *)(v10 + 212) = 0;
  *(void *)(v10 + 216) = 0x3FF0000000000000;
  id v12 = *re::audioLogObjects(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    std::string::size_type v13 = *(void *)(*(void *)ptr + 304);
    std::string::size_type v14 = *(void *)(*(void *)ptr + 24);
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412546;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v13;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v14;
    _os_log_impl(&dword_233120000, v12, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] Creating external stream %@ (token=%llu)", (uint8_t *)&buf, 0x16u);
  }
  uint64_t v15 = *(void *)ptr;
  if (*(unsigned char *)(*(void *)ptr + 296))
  {
    char v16 = [(REPHASEContext *)self baseMixerDefinitionWith:ptr];
    uint64_t v15 = *(void *)ptr;
  }
  else
  {
    char v16 = 0;
  }
  if (*(unsigned char *)(v15 + 272))
  {
    uint64_t v17 = (char *)(v15 + 248);
    if (*(char *)(v15 + 271) < 0) {
      uint64_t v17 = *(char **)v17;
    }
    unint64_t v18 = *(void *)(v15 + 32);
    unint64_t v19 = *(void *)(v15 + 48);
    std::string::basic_string[abi:ne180100]<0>(v43, v17);
    REAudioComputePHASEMixGroupID(v18, v19, (uint64_t)v43, &buf);
    if (v44 < 0) {
      operator delete(v43[0]);
    }
    unint64_t v20 = [(REPHASEContext *)self engine];
    uint64_t v21 = [v20 groups];
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    uint64_t v23 = [NSString stringWithUTF8String:p_buf];
    long long v24 = [v21 objectForKey:v23];

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    uint64_t v15 = *(void *)ptr;
  }
  else
  {
    long long v24 = 0;
  }
  uint64_t v35 = *(void *)(v15 + 304);
  unint64_t engine = self->_engine;
  uint64_t v33 = *(void *)(v15 + 280);
  uint64_t v34 = *(void *)(v15 + 104);
  uint64_t v32 = *(void *)(v15 + 288);
  if (*(unsigned char *)(v15 + 296))
  {
    uint64_t v25 = *(void *)(*(void *)cntrl + 16);
    listener = self->_listener;
  }
  else
  {
    uint64_t v25 = 0;
    listener = 0;
  }
  uint64_t v27 = *(void *)(v15 + 16);
  phaseQueue = self->_phaseQueue;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3321888768;
  v39[2] = __62__REPHASEContext_prepareGeneratorType_phaseEntity_completion___block_invoke;
  v39[3] = &unk_26E6DA008;
  long long v29 = v37;
  uint64_t v31 = *(void *)ptr;
  long long v30 = (std::__shared_weak_count *)*((void *)ptr + 1);
  float v40 = v29;
  uint64_t v41 = v31;
  uint64_t v42 = v30;
  if (v30) {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  +[REPHASESoundEvent eventWithEngine:streamUUID:maximumFramesToRender:audioFormat:audioUnit:renderBlock:mixerDefinition:source:listener:group:normalizationMode:calibrationMode:calibrationLevel:audioSession:phaseQueue:callback:](REPHASESoundEvent, "eventWithEngine:streamUUID:maximumFramesToRender:audioFormat:audioUnit:renderBlock:mixerDefinition:source:listener:group:normalizationMode:calibrationMode:calibrationLevel:audioSession:phaseQueue:callback:", engine, v35, 4096, v34, v33, v32, 1.0, v16, v25, listener, v24, 0, v27, phaseQueue, v39);
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v42);
  }
}

void __62__REPHASEContext_prepareGeneratorType_phaseEntity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v27[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@", v6];
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08608];
    v26[0] = *MEMORY[0x263F08320];
    v26[1] = v9;
    v27[0] = v7;
    v27[1] = v6;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    uint64_t v11 = [v8 errorWithDomain:@"com.apple.re.internal" code:-200 userInfo:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v12 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(v13 + 304);
      uint64_t v15 = *(void *)(v13 + 24);
      *(_DWORD *)std::string buf = 138412546;
      uint64_t v23 = v14;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      _os_log_impl(&dword_233120000, v12, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [Prepare] Successfully created external stream %@ (token=%llu). Preparing.", buf, 0x16u);
    }
    char v16 = *(std::__shared_weak_count **)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [v5 setPrepareState:&v20];
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v21);
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__REPHASEContext_prepareGeneratorType_phaseEntity_completion___block_invoke_97;
    void v17[3] = &unk_264BE2BD0;
    id v19 = *(id *)(a1 + 32);
    id v18 = v5;
    [v18 prepareWithCompletion:v17];

    uint64_t v11 = v19;
  }
}

uint64_t __62__REPHASEContext_prepareGeneratorType_phaseEntity_completion___block_invoke_97(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)prepareFileType:(shared_ptr<re:(shared_ptr<re:(id)a5 :audio::REPHASEEntity>)a4 :audio::REPHASESoundPrepareState>)a3 phaseEntity:completion:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v89[1] = *MEMORY[0x263EF8340];
  uint64_t v69 = a4.var0;
  uint64_t v8 = [(REPHASEContext *)self samplerDefForFileAsset:*(void *)(*(void *)ptr + 64) with:ptr];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)(*(void *)cntrl + 16);
    listener = self->_listener;
    id v12 = [v8 mixerDefinition];
    uint64_t v13 = [v12 identifier];
    v87 = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
    uint64_t v15 = [(REPHASEContext *)self mixerParametersForPrepareState:ptr source:v10 listener:listener mixerIdentifiers:v14];

    char v16 = [(PHASEEngine *)self->_engine assetRegistry];
    id v80 = 0;
    uint64_t v17 = [v16 registerSoundEventAssetWithRootNode:v9 identifier:0 error:&v80];
    id v18 = v80;

    id v19 = [REPHASESoundEvent alloc];
    unint64_t engine = self->_engine;
    uint64_t v21 = *(void *)(*(void *)cntrl + 16);
    long long v22 = self->_listener;
    uint64_t v23 = *(void *)(*(void *)ptr + 16);
    phaseQueue = self->_phaseQueue;
    id v79 = v18;
    uint64_t v25 = [(REPHASESoundEvent *)v19 initWithEngine:engine soundEventAsset:v17 source:v21 listener:v22 mixerParameters:v15 audioSession:v23 phaseQueue:phaseQueue outError:&v79];
    id v26 = v79;

    if (!v25)
    {
      if (v26)
      {
        uint64_t v51 = [NSString stringWithFormat:@"%@", v26];
        __int16 v52 = (void *)MEMORY[0x263F087E8];
        uint64_t v53 = *MEMORY[0x263F08320];
        v86[0] = v51;
        uint64_t v54 = *MEMORY[0x263F08608];
        uint64_t v84 = v53;
        uint64_t v85 = v54;
        uint64_t v55 = v26;
      }
      else
      {
        __int16 v52 = (void *)MEMORY[0x263F087E8];
        uint64_t v51 = @"Could not create PHASESoundEvent for file.";
        uint64_t v64 = *MEMORY[0x263F08608];
        uint64_t v84 = *MEMORY[0x263F08320];
        uint64_t v85 = v64;
        v86[0] = @"Could not create PHASESoundEvent for file.";
        uint64_t v55 = [MEMORY[0x263EFF9D0] null];
      }
      v86[1] = v55;
      uint64_t v65 = [NSDictionary dictionaryWithObjects:v86 forKeys:&v84 count:2];
      uint64_t v66 = [v52 errorWithDomain:@"com.apple.re.internal" code:-200 userInfo:v65];

      if (!v26) {
      (*((void (**)(REPHASEEntity *, void, void *))v69 + 2))(v69, 0, v66);
      }

      goto LABEL_42;
    }
    [(PHASEListener *)self->_listener worldTransform];
    *(_OWORD *)std::string buf = v27;
    *(_OWORD *)&buf[16] = v28;
    long long v82 = v29;
    long long v83 = v30;
    re::audio::stringFromPose((re::audio *)buf, v77);
    [*(id *)(*(void *)cntrl + 16) worldTransform];
    *(_OWORD *)std::string buf = v31;
    *(_OWORD *)&buf[16] = v32;
    long long v82 = v33;
    long long v83 = v34;
    uint64_t v35 = (re *)re::audio::stringFromPose((re::audio *)buf, __p);
    int v36 = *(unsigned __int8 *)(*(void *)ptr + 208);
    unsigned int v37 = *re::audioLogObjects(v35);
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v36)
    {
      if (v38)
      {
        uint64_t v39 = *(void *)(*(void *)ptr + 24);
        *(_DWORD *)std::string buf = 134218243;
        *(void *)&uint8_t buf[4] = v39;
        *(_WORD *)&unsigned char buf[12] = 2117;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_233120000, v37, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): %{sensitive}@", buf, 0x16u);
      }
      float v40 = *re::audioLogObjects((re *)v38);
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v41)
      {
        uint64_t v42 = *(void *)(*(void *)ptr + 24);
        int v43 = v77;
        if (v78 < 0) {
          int v43 = (void **)v77[0];
        }
        *(_DWORD *)std::string buf = 134218243;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&unsigned char buf[12] = 2085;
        *(void *)&buf[14] = v43;
        _os_log_impl(&dword_233120000, v40, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): Listener = %{sensitive}s", buf, 0x16u);
      }
      char v44 = *re::audioLogObjects((re *)v41);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      uint64_t v45 = *(void *)(*(void *)ptr + 24);
      uint64_t v46 = __p;
      if (v76 < 0) {
        uint64_t v46 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 134218243;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&unsigned char buf[12] = 2085;
      *(void *)&buf[14] = v46;
      float32x2_t v47 = "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): Position = %{sensitive}s";
    }
    else
    {
      if (v38)
      {
        uint64_t v56 = *(void *)(*(void *)ptr + 24);
        *(_DWORD *)std::string buf = 134218242;
        *(void *)&uint8_t buf[4] = v56;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_233120000, v37, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): %@", buf, 0x16u);
      }
      uint64_t v57 = *re::audioLogObjects((re *)v38);
      BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
      if (v58)
      {
        uint64_t v59 = *(void *)(*(void *)ptr + 24);
        BOOL v60 = v77;
        if (v78 < 0) {
          BOOL v60 = (void **)v77[0];
        }
        *(_DWORD *)std::string buf = 134218242;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = v60;
        _os_log_impl(&dword_233120000, v57, OS_LOG_TYPE_DEFAULT, "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): Listener = %s", buf, 0x16u);
      }
      char v44 = *re::audioLogObjects((re *)v58);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      uint64_t v61 = *(void *)(*(void *)ptr + 24);
      uint64_t v62 = __p;
      if (v76 < 0) {
        uint64_t v62 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 134218242;
      *(void *)&uint8_t buf[4] = v61;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v62;
      float32x2_t v47 = "[REPhaseContext] [prepareFile] Created sound event for token %llu (file): Position = %s";
    }
    _os_log_impl(&dword_233120000, v44, OS_LOG_TYPE_DEFAULT, v47, buf, 0x16u);
LABEL_30:
    uint64_t v63 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v73 = *(void *)ptr;
    id v74 = v63;
    if (v63) {
      atomic_fetch_add_explicit(&v63->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(REPHASESoundEvent *)v25 setPrepareState:&v73];
    if (v74) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v74);
    }
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __57__REPHASEContext_prepareFileType_phaseEntity_completion___block_invoke;
    id v70[3] = &unk_264BE2BD0;
    v72 = v69;
    uint64_t v71 = v25;
    [(REPHASESoundEvent *)v71 prepareWithCompletion:v70];

    if (v76 < 0) {
      operator delete(__p[0]);
    }
    if (v78 < 0) {
      operator delete(v77[0]);
    }
LABEL_42:

    goto LABEL_43;
  }
  uint64_t v48 = *re::audioLogObjects(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    uint64_t v67 = *(void *)(*(void *)ptr + 64);
    uint64_t v68 = *(void *)(*(void *)ptr + 24);
    *(_DWORD *)std::string buf = 134218240;
    *(void *)&uint8_t buf[4] = v67;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v68;
    _os_log_error_impl(&dword_233120000, v48, OS_LOG_TYPE_ERROR, "[REPhaseContext] [Prepare] Error creating sampler definition for asset: %llu and token: %llu. Sound event will not be prepared.", buf, 0x16u);
  }
  uint64_t v15 = (void (**)(void, void))_Block_copy(*(const void **)(*(void *)ptr + 352));
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Error creating sampler definition for asset %llu. Sound event will not be prepared.", *(void *)(*(void *)ptr + 64));
  uint64_t v49 = (void *)MEMORY[0x263F087E8];
  uint64_t v88 = *MEMORY[0x263F08320];
  v89[0] = v17;
  uint64_t v50 = [NSDictionary dictionaryWithObjects:v89 forKeys:&v88 count:1];
  id v26 = [v49 errorWithDomain:@"com.apple.re.internal" code:-110 userInfo:v50];

  ((void (**)(void, id))v15)[2](v15, v26);
LABEL_43:
}

uint64_t __57__REPHASEContext_prepareFileType_phaseEntity_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (id)eventFor:(unint64_t)a3
{
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  id v6 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v6) {
    id v7 = (id)v6[3];
  }
  else {
    id v7 = 0;
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  return v7;
}

- (BOOL)eventBeingPrepared:(unint64_t)a3
{
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  LOBYTE(a3) = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a3) != 0;
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  return a3;
}

- (unint64_t)uniqueEventCount
{
  long long v9 = 0u;
  long long v10 = 0u;
  int v11 = 1065353216;
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  for (uint64_t i = &self->_soundEvents.__table_.__p1_;
        ;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&v9, (unint64_t *)&i[2], &i[2].__value_.__next_))
  {
    uint64_t i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  for (uint64_t j = &self->_soundEventsPreparing.__table_.__p1_;
        ;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&v9, (unint64_t *)&j[2], &j[2].__value_.__next_))
  {
    uint64_t j = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *>>> *)j->__value_.__next_;
    if (!j) {
      break;
    }
  }
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  unint64_t v7 = *((void *)&v10 + 1);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned short>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned short>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned short>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned short>>>::~__hash_table((uint64_t)&v9);
  return v7;
}

- (unsigned)getPlayingSoundEventsCount
{
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  next = (id *)self->_soundEvents.__table_.__p1_.__value_.__next_;
  if (next)
  {
    unsigned int v5 = 0;
    do
    {
      if ([next[3] state] == 1) {
        ++v5;
      }
      next = (id *)*next;
    }
    while (next);
  }
  else
  {
    unsigned int v5 = 0;
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  return v5;
}

- (unsigned)getPreparingSoundEventsCount
{
  v2 = self;
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  LODWORD(v2) = v2->_soundEventsPreparing.__table_.__p2_.__value_;
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  return v2;
}

- (unordered_set<unsigned)playbackClientsWithPreparedOrPreparingSounds
{
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  p_soundEventsMutex = &self->_soundEventsMutex;
  os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
  for (uint64_t i = self->_soundEvents.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    unint64_t v7 = (void *)i[3];
    if (v7)
    {
      [v7 prepareState];
      uint64_t v8 = v12;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)retstr, (unint64_t *)(v8 + 48), (void *)(v8 + 48));
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v13);
    }
  }
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  for (uint64_t j = &self->_soundEventsPreparing.__table_.__p1_;
        ;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)retstr, (unint64_t *)&j[4], &j[4].__value_.__next_))
  {
    uint64_t j = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, RESoundEventPreparingData>, void *>>> *)j->__value_.__next_;
    if (!j) {
      break;
    }
  }
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  return result;
}

- (BOOL)doCleanUpSoundEventForToken:(unint64_t)a3 ifNotInScene:(unint64_t)a4
{
  p_soundEventsMutex = &self->_soundEventsMutex;
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  std::lock[abi:ne180100]<re::UnfairLock,re::UnfairLock>(&self->_soundEventsMutex.m_lock, &self->_soundEventsPreparingMutex.m_lock);
  p_soundEvents = &self->_soundEvents;
  long long v10 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_, a3);
  unint64_t v11 = (unint64_t)v10;
  if (v10)
  {
    uint64_t v12 = (void *)v10[3];
    if (v12)
    {
      [v12 prepareState];
      uint64_t v13 = *(void *)(v34 + 32);
      if (v35) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v35);
      }
    }
    else
    {
      uint64_t v13 = MEMORY[0x20];
    }
    BOOL v14 = v13 != a4;
  }
  else
  {
    BOOL v14 = 0;
  }
  unint64_t v15 = (unint64_t)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a3) | v11;
  if (a4 == -1 && v15 != 0) {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    id v17 = 0;
    goto LABEL_48;
  }
  if (v11) {
    id v17 = *(id *)(v11 + 24);
  }
  else {
    id v17 = 0;
  }
  id v18 = (REPHASEContext *)std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v18)
  {
    id v19 = v18;
    unint64_t value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    isa = v18->super.isa;
    unint64_t engine = (unint64_t)v18->_engine;
    uint8x8_t v23 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v23.i16[0] = vaddlv_u8(v23);
    if (v23.u32[0] > 1uLL)
    {
      if (engine >= value) {
        engine %= value;
      }
    }
    else
    {
      engine &= value - 1;
    }
    __int16 v24 = (REPHASEContext *)p_soundEvents->__table_.__bucket_list_.__ptr_.__value_[engine];
    do
    {
      uint64_t v25 = v24;
      __int16 v24 = (REPHASEContext *)v24->super.isa;
    }
    while (v24 != v18);
    if (v25 == (REPHASEContext *)&self->_soundEvents.__table_.__p1_) {
      goto LABEL_36;
    }
    unint64_t v26 = (unint64_t)v25->_engine;
    if (v23.u32[0] > 1uLL)
    {
      if (v26 >= value) {
        v26 %= value;
      }
    }
    else
    {
      v26 &= value - 1;
    }
    if (v26 != engine)
    {
LABEL_36:
      if (isa)
      {
        unint64_t v27 = *((void *)isa + 1);
        if (v23.u32[0] > 1uLL)
        {
          unint64_t v28 = *((void *)isa + 1);
          if (v27 >= value) {
            unint64_t v28 = v27 % value;
          }
        }
        else
        {
          unint64_t v28 = v27 & (value - 1);
        }
        if (v28 == engine) {
          goto LABEL_40;
        }
      }
      p_soundEvents->__table_.__bucket_list_.__ptr_.__value_[engine] = 0;
      isa = v18->super.isa;
    }
    if (!isa)
    {
LABEL_46:
      v25->super.isa = isa;
      v18->super.isa = 0;
      --self->_soundEvents.__table_.__p2_.__value_;

      operator delete(v19);
      goto LABEL_47;
    }
    unint64_t v27 = *((void *)isa + 1);
LABEL_40:
    if (v23.u32[0] > 1uLL)
    {
      if (v27 >= value) {
        v27 %= value;
      }
    }
    else
    {
      v27 &= value - 1;
    }
    if (v27 != engine)
    {
      p_soundEvents->__table_.__bucket_list_.__ptr_.__value_[v27] = v25;
      isa = v18->super.isa;
    }
    goto LABEL_46;
  }
LABEL_47:
  std::__hash_table<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>>>::__erase_unique<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a3);
LABEL_48:
  os_unfair_lock_unlock(&p_soundEventsMutex->m_lock);
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
  if (v17) {
    BOOL v29 = v14;
  }
  else {
    BOOL v29 = 0;
  }
  if (v29)
  {
    [v17 prepareState];
    [(REPHASEContext *)self decrementOrDestroyEntityWithZeroCount:*(void *)(v34 + 40)];
    if (v35) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v35);
    }
    phaseQueue = self->_phaseQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__REPHASEContext_doCleanUpSoundEventForToken_ifNotInScene___block_invoke;
    block[3] = &unk_264BE29F8;
    id v33 = v17;
    dispatch_async(phaseQueue, block);
  }
  return v14;
}

uint64_t __59__REPHASEContext_doCleanUpSoundEventForToken_ifNotInScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAndDestroy];
}

- (BOOL)addEventIfStillPreparing:(id)a3 forToken:(unint64_t)a4
{
  id v8 = a3;
  std::lock[abi:ne180100]<re::UnfairLock,re::UnfairLock>(&self->_soundEventsMutex.m_lock, &self->_soundEventsPreparingMutex.m_lock);
  long long v9 = std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::find<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a4);
  if (!v9) {
    goto LABEL_76;
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>>>::__erase_unique<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a4);
  unint64_t value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = a4;
      if (value <= a4) {
        unint64_t v4 = a4 % value;
      }
    }
    else
    {
      unint64_t v4 = (value - 1) & a4;
    }
    uint64_t v12 = (void **)self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = *(void **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == a4)
        {
          if (*((void *)i + 2) == a4) {
            goto LABEL_75;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= value) {
              v14 %= value;
            }
          }
          else
          {
            v14 &= value - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  id v39 = v8;
  uint64_t i = operator new(0x20uLL);
  p_p1 = &self->_soundEvents.__table_.__p1_;
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = a4;
  *((void *)i + 2) = a4;
  *((void *)i + 3) = 0;
  float v16 = (float)(self->_soundEvents.__table_.__p2_.__value_ + 1);
  float v17 = self->_soundEvents.__table_.__p3_.__value_;
  if (value && (float)(v17 * (float)value) >= v16)
  {
    a4 = v4;
    goto LABEL_65;
  }
  BOOL v18 = 1;
  if (value >= 3) {
    BOOL v18 = (value & (value - 1)) != 0;
  }
  unint64_t v19 = v18 | (2 * value);
  unint64_t v20 = vcvtps_u32_f32(v16 / v17);
  if (v19 <= v20) {
    int8x8_t prime = (int8x8_t)v20;
  }
  else {
    int8x8_t prime = (int8x8_t)v19;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(void *)&prime <= value)
  {
    if (*(void *)&prime >= value) {
      goto LABEL_61;
    }
    unint64_t v28 = vcvtps_u32_f32((float)self->_soundEvents.__table_.__p2_.__value_ / self->_soundEvents.__table_.__p3_.__value_);
    if (value < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)value), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
    {
      unint64_t v28 = std::__next_prime(v28);
    }
    else
    {
      uint64_t v30 = 1 << -(char)__clz(v28 - 1);
      if (v28 >= 2) {
        unint64_t v28 = v30;
      }
    }
    if (*(void *)&prime <= v28) {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime >= value)
    {
      unint64_t value = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_61;
    }
    if (!*(void *)&prime)
    {
      BOOL v38 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
      self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v38) {
        operator delete(v38);
      }
      unint64_t value = 0;
      self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_61;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  long long v22 = (void **)operator new(8 * *(void *)&prime);
  uint8x8_t v23 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
  self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_ = v22;
  if (v23) {
    operator delete(v23);
  }
  uint64_t v24 = 0;
  self->_soundEvents.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v24++] = 0;
  while (*(void *)&prime != v24);
  next = p_p1->__value_.__next_;
  if (p_p1->__value_.__next_)
  {
    unint64_t v26 = next[1];
    uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(void *)&prime) {
        v26 %= *(void *)&prime;
      }
    }
    else
    {
      v26 &= *(void *)&prime - 1;
    }
    self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v26] = p_p1;
    long long v31 = (void *)*next;
    if (*next)
    {
      do
      {
        unint64_t v32 = v31[1];
        if (v27.u32[0] > 1uLL)
        {
          if (v32 >= *(void *)&prime) {
            v32 %= *(void *)&prime;
          }
        }
        else
        {
          v32 &= *(void *)&prime - 1;
        }
        if (v32 != v26)
        {
          id v33 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
          if (!v33[v32])
          {
            v33[v32] = next;
            goto LABEL_57;
          }
          void *next = *v31;
          *long long v31 = *(void *)self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v32];
          *(void *)self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v32] = v31;
          long long v31 = next;
        }
        unint64_t v32 = v26;
LABEL_57:
        next = v31;
        long long v31 = (void *)*v31;
        unint64_t v26 = v32;
      }
      while (v31);
    }
  }
  unint64_t value = (unint64_t)prime;
LABEL_61:
  if ((value & (value - 1)) != 0)
  {
    if (value <= a4) {
      a4 %= value;
    }
  }
  else
  {
    a4 &= value - 1;
  }
LABEL_65:
  uint64_t v34 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
  uint64_t v35 = (void **)v34[a4];
  if (v35)
  {
    *(void *)uint64_t i = *v35;
    id v8 = v39;
  }
  else
  {
    *(__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *>>> *)uint64_t i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, REPHASESoundEvent *>, void *>>>)p_p1->__value_.__next_;
    p_p1->__value_.__next_ = i;
    v34[a4] = p_p1;
    id v8 = v39;
    if (!*(void *)i) {
      goto LABEL_74;
    }
    unint64_t v36 = *(void *)(*(void *)i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value) {
        v36 %= value;
      }
    }
    else
    {
      v36 &= value - 1;
    }
    uint64_t v35 = &self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_[v36];
  }
  *uint64_t v35 = i;
LABEL_74:
  ++self->_soundEvents.__table_.__p2_.__value_;
LABEL_75:
  objc_storeStrong((id *)i + 3, a3);
LABEL_76:
  os_unfair_lock_unlock(&self->_soundEventsMutex.m_lock);
  os_unfair_lock_unlock(&self->_soundEventsPreparingMutex.m_lock);

  return v9 != 0;
}

- (void)setPreparingWithData:(RESoundEventPreparingData)a3 forToken:(unint64_t)a4
{
  unint64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  unint64_t value = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = a4;
      if (value <= a4) {
        unint64_t v4 = a4 % value;
      }
    }
    else
    {
      unint64_t v4 = (value - 1) & a4;
    }
    uint64_t v12 = (void **)self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == a4)
        {
          if (i[2] == a4) {
            goto LABEL_74;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= value) {
              v14 %= value;
            }
          }
          else
          {
            v14 &= value - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x28uLL);
  void *i = 0;
  i[1] = a4;
  i[3] = 0;
  i[4] = 0;
  i[2] = a4;
  float v15 = (float)(self->_soundEventsPreparing.__table_.__p2_.__value_ + 1);
  float v16 = self->_soundEventsPreparing.__table_.__p3_.__value_;
  if (value && (float)(v16 * (float)value) >= v15)
  {
    a4 = v4;
    goto LABEL_64;
  }
  BOOL v17 = 1;
  if (value >= 3) {
    BOOL v17 = (value & (value - 1)) != 0;
  }
  unint64_t v18 = v17 | (2 * value);
  unint64_t v19 = vcvtps_u32_f32(v15 / v16);
  if (v18 <= v19) {
    int8x8_t prime = (int8x8_t)v19;
  }
  else {
    int8x8_t prime = (int8x8_t)v18;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t value = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(void *)&prime <= value)
  {
    if (*(void *)&prime >= value) {
      goto LABEL_60;
    }
    unint64_t v27 = vcvtps_u32_f32((float)self->_soundEventsPreparing.__table_.__p2_.__value_/ self->_soundEventsPreparing.__table_.__p3_.__value_);
    if (value < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)value), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
    {
      unint64_t v27 = std::__next_prime(v27);
    }
    else
    {
      uint64_t v29 = 1 << -(char)__clz(v27 - 1);
      if (v27 >= 2) {
        unint64_t v27 = v29;
      }
    }
    if (*(void *)&prime <= v27) {
      int8x8_t prime = (int8x8_t)v27;
    }
    if (*(void *)&prime >= value)
    {
      unint64_t value = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      unint64_t v36 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
      self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v36) {
        operator delete(v36);
      }
      unint64_t value = 0;
      self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v21 = (void **)operator new(8 * *(void *)&prime);
  long long v22 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
  self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_ = v21;
  if (v22) {
    operator delete(v22);
  }
  uint64_t v23 = 0;
  self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v23++] = 0;
  while (*(void *)&prime != v23);
  next = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
  if (next)
  {
    unint64_t v25 = next[1];
    uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
    v26.i16[0] = vaddlv_u8(v26);
    if (v26.u32[0] > 1uLL)
    {
      if (v25 >= *(void *)&prime) {
        v25 %= *(void *)&prime;
      }
    }
    else
    {
      v25 &= *(void *)&prime - 1;
    }
    self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v25] = &self->_soundEventsPreparing.__table_.__p1_;
    uint64_t v30 = (void *)*next;
    if (*next)
    {
      do
      {
        unint64_t v31 = v30[1];
        if (v26.u32[0] > 1uLL)
        {
          if (v31 >= *(void *)&prime) {
            v31 %= *(void *)&prime;
          }
        }
        else
        {
          v31 &= *(void *)&prime - 1;
        }
        if (v31 != v25)
        {
          unint64_t v32 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
          if (!v32[v31])
          {
            v32[v31] = next;
            goto LABEL_56;
          }
          void *next = *v30;
          *uint64_t v30 = *(void *)self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v31];
          *(void *)self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v31] = v30;
          uint64_t v30 = next;
        }
        unint64_t v31 = v25;
LABEL_56:
        next = v30;
        uint64_t v30 = (void *)*v30;
        unint64_t v25 = v31;
      }
      while (v30);
    }
  }
  unint64_t value = (unint64_t)prime;
LABEL_60:
  if ((value & (value - 1)) != 0)
  {
    if (value <= a4) {
      a4 %= value;
    }
  }
  else
  {
    a4 &= value - 1;
  }
LABEL_64:
  id v33 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
  uint64_t v34 = (void **)v33[a4];
  if (v34)
  {
    void *i = *v34;
LABEL_72:
    *uint64_t v34 = i;
    goto LABEL_73;
  }
  void *i = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
  self->_soundEventsPreparing.__table_.__p1_.__value_.__next_ = i;
  v33[a4] = &self->_soundEventsPreparing.__table_.__p1_;
  if (*i)
  {
    unint64_t v35 = *(void *)(*i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v35 >= value) {
        v35 %= value;
      }
    }
    else
    {
      v35 &= value - 1;
    }
    uint64_t v34 = &self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_[v35];
    goto LABEL_72;
  }
LABEL_73:
  ++self->_soundEventsPreparing.__table_.__p2_.__value_;
LABEL_74:
  i[3] = var0;
  i[4] = var1;
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
}

- (void)clearPreparingStateForToken:(unint64_t)a3
{
  p_soundEventsPreparingMutex = &self->_soundEventsPreparingMutex;
  os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
  std::__hash_table<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,RESoundEventPreparingData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,RESoundEventPreparingData>>>::__erase_unique<unsigned long long>(&self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_, a3);
  os_unfair_lock_unlock(&p_soundEventsPreparingMutex->m_lock);
}

- (id)getOrCreateSpatialMixerDefinitionUsing:(const void *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)a3;
  switch(*(_DWORD *)(*(void *)a3 + 312))
  {
    case 0:
      re::REPHASESpatialMixerDefinitionCache::getOmniSpatialMixerDefinition((re::REPHASESpatialMixerDefinitionCache *)&self->_spatialMixerDefinitionCache);
      self = (REPHASEContext *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      re::REPHASESpatialMixerDefinitionCache::getBeamSpatialMixerDefinition((re::REPHASESpatialMixerDefinitionCache *)&self->_spatialMixerDefinitionCache, *(float *)(v4 + 316));
      self = (REPHASEContext *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      id v6 = *(PHASEDirectivityModelParameters **)(v4 + 176);
      p_spatialMixerDefinitionCache = &self->_spatialMixerDefinitionCache;
      if (v6) {
        re::REPHASESpatialMixerDefinitionCache::getSpatialMixerDefinitionWithDirectivity((re::REPHASESpatialMixerDefinitionCache *)p_spatialMixerDefinitionCache, v6);
      }
      else {
        re::REPHASESpatialMixerDefinitionCache::getHumanSpatialMixerDefinition((re::REPHASESpatialMixerDefinitionCache *)p_spatialMixerDefinitionCache);
      }
      self = (REPHASEContext *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      re::REPHASESpatialMixerDefinitionCache::getSphericalSpatialMixerDefinition((re::REPHASESpatialMixerDefinitionCache *)&self->_spatialMixerDefinitionCache, *(float *)(v4 + 320) * 0.5, *(float *)(v4 + 324));
      self = (REPHASEContext *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      unsigned int v5 = self;
      break;
    default:
      unsigned int v5 = 0;
      break;
  }
  id v8 = *re::audioLogObjects((re *)self);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = *(float *)(*(void *)a3 + 204);
    int v12 = 134218242;
    double v13 = v9;
    __int16 v14 = 2112;
    float v15 = v5;
    _os_log_impl(&dword_233120000, v8, OS_LOG_TYPE_DEFAULT, "[RE/PHASE] [Prepare] Rolloff factor=%.2f on PHASESpatialMixerDefinition=%@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F14940]);
  [v10 setRolloffFactor:*(float *)(*(void *)a3 + 204)];
  [(REPHASEContext *)v5 setDistanceModelParameters:v10];

  return v5;
}

- (void)setCustomHRIRURL:(id)a3
{
  objc_storeStrong((id *)&self->_customHRIRURL, a3);
  [(REPHASEContext *)self applyCustomHRIR];
}

- (void)applyCustomHRIR
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t engine = self->_engine;
  if (engine)
  {
    customHRIRURL = self->_customHRIRURL;
    if (customHRIRURL)
    {
      id v9 = 0;
      char v5 = [(PHASEEngine *)engine setHeadphoneHRIRFile:customHRIRURL error:&v9];
      id v6 = (re *)v9;
      unint64_t v7 = v6;
      if ((v5 & 1) == 0)
      {
        id v8 = *re::audioLogObjects(v6);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 138412290;
          uint8x8_t v11 = v7;
          _os_log_error_impl(&dword_233120000, v8, OS_LOG_TYPE_ERROR, "Error setting custom HRIR: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)loadHumanDirectivityPlistFromURL:(id)a3
{
  void v27[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4) {
    goto LABEL_9;
  }
  re::Bundle::reTestsDataFramework((uint64_t)v25);
  if (v25[0]) {
    id v5 = v26;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v25[0]) {

  }
  id v4 = [v6 URLForResource:@"PHASEHumanDirectivity" withExtension:@"plist"];
  if (v4)
  {

LABEL_9:
    unint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:v4];
    id v8 = objc_alloc_init(MEMORY[0x263F14910]);
    id v9 = [v7 valueForKey:@"lowFrequency"];
    [(REPHASEContext *)self doubleFromPlistValue:v9 defaultValue:125.0];
    objc_msgSend(v8, "setFrequency:");

    id v10 = [v7 valueForKey:@"lowPattern"];
    [(REPHASEContext *)self doubleFromPlistValue:v10 defaultValue:0.0];
    objc_msgSend(v8, "setPattern:");

    uint8x8_t v11 = [v7 valueForKey:@"lowSharpness"];
    [(REPHASEContext *)self doubleFromPlistValue:v11 defaultValue:1.0];
    objc_msgSend(v8, "setSharpness:");

    id v12 = objc_alloc_init(MEMORY[0x263F14910]);
    double v13 = [v7 valueForKey:@"midFrequency"];
    [(REPHASEContext *)self doubleFromPlistValue:v13 defaultValue:1000.0];
    objc_msgSend(v12, "setFrequency:");

    __int16 v14 = [v7 valueForKey:@"midPattern"];
    [(REPHASEContext *)self doubleFromPlistValue:v14 defaultValue:0.0];
    objc_msgSend(v12, "setPattern:");

    float v15 = [v7 valueForKey:@"midSharpness"];
    [(REPHASEContext *)self doubleFromPlistValue:v15 defaultValue:1.0];
    objc_msgSend(v12, "setSharpness:");

    id v16 = objc_alloc_init(MEMORY[0x263F14910]);
    BOOL v17 = [v7 valueForKey:@"highFrequency"];
    [(REPHASEContext *)self doubleFromPlistValue:v17 defaultValue:3000.0];
    objc_msgSend(v16, "setFrequency:");

    unint64_t v18 = [v7 valueForKey:@"highPattern"];
    [(REPHASEContext *)self doubleFromPlistValue:v18 defaultValue:0.0];
    objc_msgSend(v16, "setPattern:");

    unint64_t v19 = [v7 valueForKey:@"highSharpness"];
    [(REPHASEContext *)self doubleFromPlistValue:v19 defaultValue:1.0];
    objc_msgSend(v16, "setSharpness:");

    id v20 = objc_alloc(MEMORY[0x263F14908]);
    v27[0] = v8;
    v27[1] = v12;
    v27[2] = v16;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
    long long v22 = (PHASECardioidDirectivityModelParameters *)[v20 initWithSubbandParameters:v21];
    humanDirectivity = self->_humanDirectivity;
    self->_humanDirectivity = v22;

    id v6 = v4;
    goto LABEL_10;
  }
  uint64_t v24 = *re::audioLogObjects(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v25 = 0;
    _os_log_error_impl(&dword_233120000, v24, OS_LOG_TYPE_ERROR, "No Human Directivity configuration plist found.", v25, 2u);
  }
LABEL_10:
}

- (double)doubleFromPlistValue:(id)a3 defaultValue:(double)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 doubleValue];
    a4 = v6;
  }

  return a4;
}

- (void)createListenerIfPending
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (uint64_t i = self->_scenes.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    id v5 = (re::audio::REPHASEAudioScene *)i[3];
    double v6 = (std::__shared_weak_count *)i[4];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    re::audio::REPHASEAudioScene::createListenerIfPending(v5);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v6);
    }
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (void)removeEntity:(unint64_t)a3
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (uint64_t i = &self->_scenes.__table_.__p1_;
        ;
        re::audio::REPHASEAudioScene::removeEntity((os_unfair_lock_s *)i[3].__value_.__next_, a3))
  {
    uint64_t i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (BOOL)isListenerCreatedInScene
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  p_p1 = &self->_scenes.__table_.__p1_;
  do
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    next = (os_unfair_lock_s *)p_p1[3].__value_.__next_;
    double v6 = next + 16;
    os_unfair_lock_lock(next + 16);
    uint64_t v7 = *(void *)&next[18]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v6);
  }
  while (!v7);
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
  return p_p1 != 0;
}

- (BOOL)engineShouldBeRunning
{
  uint64_t v2 = *((void *)self->_audioEngineRunnableManager.__ptr_ + 3);
  if (v2)
  {
    p_scenesMutex = &self->_scenesMutex;
    os_unfair_lock_lock(&self->_scenesMutex.m_lock);
    next = self->_scenes.__table_.__p1_.__value_.__next_;
    if (next)
    {
      char v6 = 0;
      while (1)
      {
        uint64_t v7 = next[3];
        id v8 = (os_unfair_lock_s *)(v7 + 80);
        os_unfair_lock_lock((os_unfair_lock_t)(v7 + 80));
        uint64_t v9 = *(void *)(v7 + 112);
        os_unfair_lock_unlock(v8);
        if (v9) {
          break;
        }
        uint64_t v10 = next[3];
        uint8x8_t v11 = (os_unfair_lock_s *)(v10 + 64);
        os_unfair_lock_lock((os_unfair_lock_t)(v10 + 64));
        LOBYTE(v10) = *(void *)(v10 + 72) != 0;
        os_unfair_lock_unlock(v11);
        v6 |= v10;
        next = (void *)*next;
        if (!next) {
          goto LABEL_8;
        }
      }
      os_unfair_lock_unlock(&p_scenesMutex->m_lock);
      LOBYTE(v2) = 1;
    }
    else
    {
      char v6 = 0;
LABEL_8:
      os_unfair_lock_unlock(&p_scenesMutex->m_lock);
      os_unfair_lock_lock(&self->_soundEventsMutex.m_lock);
      id v12 = self->_soundEvents.__table_.__p1_.__value_.__next_;
      BOOL v13 = v12 != 0;
      for (i = 0; v12; id v12 = (void *)*v12)
      {
        float v15 = (void *)v12[3];
        if (v15)
        {
          [v15 prepareState];
          uint64_t v16 = *(void *)(v19 + 56);
          if (v20) {
            std::__shared_weak_count::__release_shared[abi:nn180100](v20);
          }
        }
        else
        {
          uint64_t v16 = MEMORY[0x38];
        }
        i |= v16 == 2;
      }
      os_unfair_lock_unlock(&self->_soundEventsMutex.m_lock);
      os_unfair_lock_lock(&self->_soundEventsPreparingMutex.m_lock);
      BOOL v17 = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
      if (v17)
      {
        do
        {
          i |= v17[3] == 2;
          BOOL v17 = (void *)*v17;
        }
        while (v17);
        BOOL v13 = 1;
      }
      os_unfair_lock_unlock(&self->_soundEventsPreparingMutex.m_lock);
      LOBYTE(v2) = i | v6 & v13;
    }
  }
  return v2 & 1;
}

- (id)getListener
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  next = (re::audio::REPHASEAudioScene *)self->_scenes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      uint64_t v5 = re::audio::REPHASEAudioScene::getListener(*((re::audio::REPHASEAudioScene **)next + 3));
      if (v5) {
        break;
      }
      next = *(re::audio::REPHASEAudioScene **)next;
      if (!next) {
        goto LABEL_4;
      }
    }
    char v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    char v6 = 0;
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
  return v6;
}

- (void)removeListener
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (char i = (os_unfair_lock_s *)self->_scenes.__table_.__p1_.__value_.__next_;
        i;
        char i = *(os_unfair_lock_s **)&i->_os_unfair_lock_opaque)
  {
    re::audio::REPHASEAudioScene::removeListener(*(os_unfair_lock_s **)&i[6]._os_unfair_lock_opaque);
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (id)getSessionRoot:(unint64_t)a3
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  next = (os_unfair_lock_s *)self->_scenes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      uint64_t v7 = re::audio::REPHASEAudioScene::getSessionRoot(*(os_unfair_lock_s **)&next[6]._os_unfair_lock_opaque, a3);
      if (v7) {
        break;
      }
      next = *(os_unfair_lock_s **)&next->_os_unfair_lock_opaque;
      if (!next) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    uint64_t v7 = 0;
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
  return v7;
}

- (void)removeSessionRoot:(unint64_t)a3
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (char i = &self->_scenes.__table_.__p1_;
        ;
        re::audio::REPHASEAudioScene::removeSessionRoot((os_unfair_lock_s *)i[3].__value_.__next_, a3))
  {
    char i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (void)getSourceCount:(unsigned int *)a3 occluderCount:(unsigned int *)a4
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  next = (os_unfair_lock_s *)self->_scenes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
    do
    {
      *(void *)uint8x8_t v11 = 0;
      re::audio::REPHASEAudioScene::getSourceCount(*(os_unfair_lock_s **)&next[6]._os_unfair_lock_opaque, &v11[1], v11);
      v9 += v11[1];
      v10 += v11[0];
      next = *(os_unfair_lock_s **)&next->_os_unfair_lock_opaque;
    }
    while (next);
    if (a3) {
      goto LABEL_5;
    }
  }
  else
  {
    unsigned int v10 = 0;
    unsigned int v9 = 0;
    if (a3) {
LABEL_5:
    }
      *a3 = v9;
  }
  if (a4) {
    *a4 = v10;
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (id)sourceObjectForEntityID:(unint64_t)a3
{
  [(REPHASEContext *)self getEntity:a3];
  if (v5) {
    id v3 = *(id *)(v5 + 16);
  }
  else {
    id v3 = 0;
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
  return v3;
}

- (shared_ptr<re::audio::REPHASEEntity>)getEntity:(unint64_t)a3
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  [(REPHASEContext *)self _getEntityUnderLock:a3];
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
  result.unint64_t var1 = v7;
  result.int64_t var0 = v6;
  return result;
}

- (shared_ptr<re::audio::REPHASEEntity>)_getEntityUnderLock:(unint64_t)a3
{
  uint64_t v4 = v3;
  next = (os_unfair_lock_s *)self->_scenes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      re::audio::REPHASEAudioScene::getEntity(*(os_unfair_lock_s **)&next[6]._os_unfair_lock_opaque, a3, (void *)v4);
      if (*(void *)v4) {
        break;
      }
      self = *(REPHASEContext **)(v4 + 8);
      if (self) {
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)self);
      }
      next = *(os_unfair_lock_s **)&next->_os_unfair_lock_opaque;
      if (!next) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
  }
  result.unint64_t var1 = (__shared_weak_count *)a2;
  result.int64_t var0 = (REPHASEEntity *)self;
  return result;
}

- (void)decrementOrDestroyEntityWithZeroCount:(unint64_t)a3
{
  p_scenesMutex = &self->_scenesMutex;
  os_unfair_lock_lock(&self->_scenesMutex.m_lock);
  for (char i = &self->_scenes.__table_.__p1_;
        ;
        re::audio::REPHASEAudioScene::decrementOrDestroyEntityWithZeroCount((os_unfair_lock_s *)i[3].__value_.__next_, a3))
  {
    char i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<re::audio::REPHASEAudioScene>>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
  }
  os_unfair_lock_unlock(&p_scenesMutex->m_lock);
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (PHASENumberMetaParameterDefinition)gainLinearParamDefinition
{
  return self->_gainLinearParamDefinition;
}

- (PHASENumberMetaParameterDefinition)rateParamDefinition
{
  return self->_rateParamDefinition;
}

- (PHASECardioidDirectivityModelParameters)humanDirectivity
{
  return self->_humanDirectivity;
}

- (PHASEListener)listener
{
  return self->_listener;
}

- (NSURL)customHRIRURL
{
  return self->_customHRIRURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customHRIRURL, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_humanDirectivity, 0);
  objc_storeStrong((id *)&self->_rateParamDefinition, 0);
  objc_storeStrong((id *)&self->_gainLinearParamDefinition, 0);
  cntrl = self->_audioEngineRunnableManager.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_phaseQueue, 0);

  std::__hash_table<std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundAsset>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,REPHASESoundAsset>>>::__deallocate_node((char *)self->_audioAssets.__table_.__p1_.__value_.__next_);
  unint64_t value = self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_;
  self->_audioAssets.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  next = self->_soundEventsPreparing.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      char v6 = (void *)*next;
      operator delete(next);
      next = v6;
    }
    while (v6);
  }
  uint64_t v7 = self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_;
  self->_soundEventsPreparing.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v7) {
    operator delete(v7);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,REPHASESoundEvent * {__strong}>>>::__deallocate_node((id *)self->_soundEvents.__table_.__p1_.__value_.__next_);
  id v8 = self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_;
  self->_soundEvents.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8) {
    operator delete(v8);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PhaseShapeAndMesh>>>::~__hash_table((uint64_t)&self->_shapes);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<re::audio::REPHASEAudioScene>>>>::__deallocate_node((void *)self->_scenes.__table_.__p1_.__value_.__next_);
  unsigned int v9 = self->_scenes.__table_.__bucket_list_.__ptr_.__value_;
  self->_scenes.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v9) {
    operator delete(v9);
  }
  objc_storeStrong((id *)&self->_engine, 0);
}

- (id).cxx_construct
{
  self->_scenesMutex.m_lock._os_unfair_lock_opaque = 0;
  self->_scenes.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_scenes.__table_.__p1_.__value_.__next_ = 0u;
  self->_scenes.__table_.__p3_.__value_ = 1.0;
  self->_shapesMutex.m_lock._os_unfair_lock_opaque = 0;
  self->_shapes.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_shapes.__table_.__p1_.__value_.__next_ = 0u;
  self->_shapes.__table_.__p3_.__value_ = 1.0;
  self->_soundEvents.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_soundEvents.__table_.__p1_.__value_.__next_ = 0u;
  self->_soundEvents.__table_.__p3_.__value_ = 1.0;
  self->_soundEventsMutex.m_lock._os_unfair_lock_opaque = 0;
  self->_soundEventsPreparing.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_soundEventsPreparing.__table_.__p1_.__value_.__next_ = 0u;
  self->_soundEventsPreparing.__table_.__p3_.__value_ = 1.0;
  self->_soundEventsPreparingMutex.m_lock._os_unfair_lock_opaque = 0;
  *(_OWORD *)&self->_audioAssets.__table_.__p1_.__value_.__next_ = 0u;
  self->_audioAssets.__table_.__bucket_list_ = 0u;
  self->_audioAssets.__table_.__p3_.__value_ = 1.0;
  self->_audioEngineMutex.m_lock._os_unfair_lock_opaque = 0;
  self->_audioAssetsMutex.m_lock._os_unfair_lock_opaque = 0;
  re::REPHASEMaterialCache::REPHASEMaterialCache((re::REPHASEMaterialCache *)&self->_phaseMaterialCache);
  re::REPHASESpatialMixerDefinitionCache::REPHASESpatialMixerDefinitionCache((re::REPHASESpatialMixerDefinitionCache *)&self->_spatialMixerDefinitionCache);
  self->_audioEngineRunnableManager.__ptr_ = 0;
  self->_audioEngineRunnableManager.__cntrl_ = 0;
  return self;
}

@end