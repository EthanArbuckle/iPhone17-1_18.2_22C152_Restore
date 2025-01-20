@interface PHASEEngine
+ (PHASEEngine)new;
- (BOOL)enableRoomAcousticParametersTracking;
- (BOOL)initInternalWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4 platform:(id)a5 spatialMode:(int64_t)a6;
- (BOOL)roomAcousticSoftLimiting;
- (BOOL)setHeadphoneHRIRFile:(id)a3 error:(id *)a4;
- (BOOL)startAndReturnError:(NSError *)error;
- (NSArray)duckers;
- (NSArray)soundEvents;
- (NSDictionary)groups;
- (NSUUID)sceneRoomUUID;
- (PHASEAssetRegistry)assetRegistry;
- (PHASEEngine)init;
- (PHASEEngine)initWithEngineMode:(int64_t)a3 updateMode:(int64_t)a4;
- (PHASEEngine)initWithPlatform:(id)a3;
- (PHASEEngine)initWithSampleRate:(double)a3 updateMode:(int64_t)a4;
- (PHASEEngine)initWithUpdateMode:(PHASEUpdateMode)updateMode;
- (PHASEEngine)initWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4;
- (PHASEEngine)initWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4 platform:(id)a5;
- (PHASEEngine)initWithUpdateMode:(int64_t)a3 spatialMode:(int64_t)a4;
- (PHASEGroupPreset)activeGroupPreset;
- (PHASEMedium)defaultMedium;
- (PHASEObject)rootObject;
- (PHASERenderingState)renderingState;
- (PHASEReverbPreset)defaultReverbPreset;
- (PHASESpatializationMode)outputSpatializationMode;
- (PHASETapRegistry)tapRegistry;
- (PHASETargetRoomAcousticParameters)roomAcousticTarget;
- (__n128)spaceBlendTargetPresetOrientation;
- (double)maximumGainDbSpl;
- (double)roomAcousticMaximumReverbTime;
- (double)roomAcousticSmoothing;
- (double)sampleRate;
- (double)setUnitsPerSecond:;
- (double)spaceBlendLevel;
- (double)unitsPerMeter;
- (double)unitsPerSecond;
- (id).cxx_construct;
- (int64_t)defaultPrivateReverbPreset;
- (int64_t)engineMode;
- (int64_t)overrideOutputSpatializationMode;
- (int64_t)roomAcousticTrackingMode;
- (int64_t)sceneClassification;
- (int64_t)spaceBlendTargetPreset;
- (int64_t)spatialHint;
- (uint64_t)setSpaceBlendTargetPresetOrientation:(__n128 *)a1;
- (void)addDucker:(id)a3;
- (void)addGroup:(id)a3;
- (void)addSoundEvent:(id)a3;
- (void)clearProfileOverride;
- (void)dealloc;
- (void)destroy;
- (void)gatherExternalStreamDebugInformation:(id)a3;
- (void)implementation;
- (void)pause;
- (void)removeDucker:(id)a3;
- (void)removeGroup:(id)a3;
- (void)removeSoundEvent:(id)a3;
- (void)setBalance:(double)a3;
- (void)setDefaultMedium:(PHASEMedium *)defaultMedium;
- (void)setDefaultPrivateReverbPreset:(int64_t)a3;
- (void)setDefaultReverbPreset:(PHASEReverbPreset)defaultReverbPreset;
- (void)setEnableRoomAcousticParametersTracking:(BOOL)a3;
- (void)setExperience:(int64_t)a3;
- (void)setInternalActiveGroupMixerPreset:(id)a3;
- (void)setMaximumGainDbSpl:(double)a3;
- (void)setOutputSpatializationMode:(PHASESpatializationMode)outputSpatializationMode;
- (void)setOverrideOutputSpatializationMode:(int64_t)a3;
- (void)setProfileOverride:(id)a3 experience:(id)a4 faceCount:(int)a5 balance:(double)a6;
- (void)setProfileOverrideWithName:(id)a3 balance:(double)a4;
- (void)setRoomAcousticMaximumReverbTime:(double)a3;
- (void)setRoomAcousticSmoothing:(double)a3;
- (void)setRoomAcousticSoftLimiting:(BOOL)a3;
- (void)setRoomAcousticTarget:(id)a3;
- (void)setRoomAcousticTrackingMode:(int64_t)a3;
- (void)setSceneClassification:(int64_t)a3;
- (void)setSceneRoomUUID:(id)a3;
- (void)setSpaceBlendLevel:(double)a3;
- (void)setSpaceBlendTargetPreset:(int64_t)a3;
- (void)setSpatialCategoryBandCount:(unint64_t)a3 withName:(id)a4;
- (void)setSpatialCategoryMaxClusterCount:(unint64_t)a3 withName:(id)a4;
- (void)setSpatialCategoryUpdateRate:(float)a3 withName:(id)a4;
- (void)setSpatialHint:(int64_t)a3;
- (void)setTargetRoomAcousticParameters:(id)a3;
- (void)setUnitsPerMeter:(double)unitsPerMeter;
- (void)setUnitsPerSecond:;
- (void)setUnitsPerSecond:(double)unitsPerSecond;
- (void)stop;
- (void)update;
@end

@implementation PHASEEngine

- (void)implementation
{
  return self->_impl.__ptr_.__value_;
}

- (PHASEEngine)init
{
  return 0;
}

+ (PHASEEngine)new
{
  return 0;
}

- (PHASEEngine)initWithSampleRate:(double)a3 updateMode:(int64_t)a4
{
  v4 = -[PHASEEngine initWithUpdateMode:](self, "initWithUpdateMode:", a4, a3);
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (PHASEEngine)initWithUpdateMode:(PHASEUpdateMode)updateMode
{
  v8.receiver = self;
  v8.super_class = (Class)PHASEEngine;
  v4 = [(PHASEEngine *)&v8 init];
  if (v4)
  {
    GetDefaultClientEngineMode();
    if ([(PHASEEngine *)v4 initInternalWithUpdateMode:updateMode engineMode:0 platform:0 spatialMode:0])
    {
      v5 = v4;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (PHASEEngine)initWithEngineMode:(int64_t)a3 updateMode:(int64_t)a4
{
  v6 = self;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (Phase::CurrentProcessCanSelectEngineMode(void)::onceToken != -1) {
    dispatch_once(&Phase::CurrentProcessCanSelectEngineMode(void)::onceToken, &__block_literal_global_8);
  }
  if (Phase::CurrentProcessCanSelectEngineMode(void)::currentProcessCanSelectEngineMode)
  {
    v6 = [(PHASEEngine *)v6 initWithUpdateMode:a4 engineMode:a3];
    v7 = v6;
  }
  else
  {
    objc_super v8 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "PHASEEngine.mm";
      __int16 v12 = 1024;
      int v13 = 550;
      _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Insufficient permissions to use initWithEngineMode:engineMode:updateMode.", (uint8_t *)&v10, 0x12u);
    }
    v7 = 0;
  }

  return v7;
}

- (PHASEEngine)initWithUpdateMode:(int64_t)a3 spatialMode:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PHASEEngine;
  v6 = [(PHASEEngine *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if ([(PHASEEngine *)v6 initInternalWithUpdateMode:a3 engineMode:0 platform:0 spatialMode:a4])
    {
      objc_super v8 = v7;
    }
    else
    {
      objc_super v8 = 0;
    }
  }
  else
  {
    objc_super v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (BOOL)initInternalWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4 platform:(id)a5 spatialMode:(int64_t)a6
{
  id v7 = a5;
  if (v7)
  {
    [v7 sampleRate];
    double v9 = v8;
  }
  else
  {
    double v9 = 48000.0;
  }
  self->_sampleRate = v9;
  *(_OWORD *)&self->_defaultPrivateReverbPreset = xmmword_2220E73E0;
  self->_unitsPerMeter = 1.0;
  int v10 = [[PHASEAssetRegistry alloc] initWithEngine:self];
  assetRegistry = self->_assetRegistry;
  self->_assetRegistry = v10;

  __int16 v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  internalSoundEvents = self->_internalSoundEvents;
  self->_internalSoundEvents = v12;

  uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  groups = self->_groups;
  self->_groups = v14;

  v16 = [[PHASETapRegistry alloc] initWithEngine:self];
  tapRegistry = self->_tapRegistry;
  self->_tapRegistry = v16;

  operator new();
}

- (PHASEEngine)initWithPlatform:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASEEngine;
  v5 = [(PHASEEngine *)&v9 init];
  if (v5)
  {
    GetDefaultClientEngineMode();
    if ([(PHASEEngine *)v5 initInternalWithUpdateMode:0 engineMode:0 platform:v4 spatialMode:0])
    {
      v6 = v5;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (PHASEEngine)initWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PHASEEngine;
  v6 = [(PHASEEngine *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    if ([(PHASEEngine *)v6 initInternalWithUpdateMode:a3 engineMode:a4 platform:0 spatialMode:0])
    {
      double v8 = v7;
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }
  objc_super v9 = v8;

  return v9;
}

- (PHASEEngine)initWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4 platform:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PHASEEngine;
  objc_super v9 = [(PHASEEngine *)&v14 init];
  int v10 = v9;
  if (v9)
  {
    if ([(PHASEEngine *)v9 initInternalWithUpdateMode:a3 engineMode:a4 platform:v8 spatialMode:0])
    {
      objc_super v11 = v10;
    }
    else
    {
      objc_super v11 = 0;
    }
  }
  else
  {
    objc_super v11 = 0;
  }
  __int16 v12 = v11;

  return v12;
}

- (void)destroy
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = self;
  v3 = (Phase::Logger *)objc_sync_enter(v2);
  id v4 = **(id **)(Phase::Logger::GetInstance(v3) + 432);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    v15 = "PHASEEngine.mm";
    __int16 v16 = 1024;
    int v17 = 683;
    __int16 v18 = 2048;
    v19 = v2;
    _os_log_impl(&dword_221E5E000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: PHASEEngine destroy", (uint8_t *)&v14, 0x1Cu);
  }
  [(PHASEEngine *)v2 stop];
  value = v2->_impl.__ptr_.__value_;
  if (value)
  {
    id v6 = *((id *)value + 65);
    id v7 = v6;
    if (v6)
    {
      [v6 registerIOBlock:0];
      [v7 registerOverloadNotification:0];
      [v7 registerRouteChangeNotification:0];
      if (objc_opt_respondsToSelector()) {
        [v7 registerTapInterface:0];
      }
      if (objc_opt_respondsToSelector())
      {
        id v8 = [v7 sessionInterface];
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          int v10 = [v7 sessionInterface];
          [v10 registerActivateAudioSessionBlock:0];
          [v10 registerFadeClientsInAudioSessionBlock:0];
          if (objc_opt_respondsToSelector()) {
            [v10 registerMuteInputClientsInAudioSessionBlock:0];
          }
          if (objc_opt_respondsToSelector())
          {
            objc_super v11 = [v10 sessionVolumeInterface];
            BOOL v12 = v11 == 0;

            if (!v12)
            {
              int v13 = [v10 sessionVolumeInterface];
              [v13 registerVolumeChangedNotificationBlock:0];
            }
          }
        }
      }
    }
  }
  [(PHASEAssetRegistry *)v2->_assetRegistry removeAll];
  std::unique_ptr<PHASEEngineImpl>::reset[abi:ne180100](&v2->_impl.__ptr_.__value_, 0);
  objc_sync_exit(v2);
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  [(PHASEEngine *)v2 destroy];
  objc_sync_exit(v2);

  v3.receiver = v2;
  v3.super_class = (Class)PHASEEngine;
  [(PHASEEngine *)&v3 dealloc];
}

- (BOOL)startAndReturnError:(NSError *)error
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = self;
  v5 = (Phase::Logger *)objc_sync_enter(v4);
  id v6 = **(id **)(Phase::Logger::GetInstance(v5) + 432);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    objc_super v11 = "PHASEEngine.mm";
    __int16 v12 = 1024;
    int v13 = 743;
    __int16 v14 = 2048;
    v15 = v4;
    _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: PHASEEngine start", (uint8_t *)&v10, 0x1Cu);
  }
  v4->_stopWatch.mStart.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  id v7 = PHASEEngineImpl::Start(v4->_impl.__ptr_.__value_, 60.0);
  id v8 = v7;
  if (error) {
    *error = (NSError *)v7;
  }

  objc_sync_exit(v4);
  return v8 == 0;
}

- (void)pause
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_super v3 = (Phase::Logger *)objc_sync_enter(v2);
  id v4 = **(id **)(Phase::Logger::GetInstance(v3) + 432);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "PHASEEngine.mm";
    __int16 v7 = 1024;
    int v8 = 760;
    __int16 v9 = 2048;
    int v10 = v2;
    _os_log_impl(&dword_221E5E000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: PHASEEngine pause", (uint8_t *)&v5, 0x1Cu);
  }
  PHASEEngineImpl::Pause(v2->_impl.__ptr_.__value_);
  objc_sync_exit(v2);
}

- (void)stop
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_super v3 = (Phase::Logger *)objc_sync_enter(v2);
  id v4 = **(id **)(Phase::Logger::GetInstance(v3) + 432);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    __int16 v7 = "PHASEEngine.mm";
    __int16 v8 = 1024;
    int v9 = 770;
    __int16 v10 = 2048;
    uint64_t v11 = v2;
    _os_log_impl(&dword_221E5E000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: PHASEEngine stop", (uint8_t *)&v6, 0x1Cu);
  }
  value = v2->_impl.__ptr_.__value_;
  if (value) {
    PHASEEngineImpl::Stop(value);
  }
  objc_sync_exit(v2);
}

- (int64_t)engineMode
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = *((void *)v2->_impl.__ptr_.__value_ + 2);
  objc_sync_exit(v2);

  return v3;
}

- (PHASERenderingState)renderingState
{
  v2 = self;
  objc_sync_enter(v2);
  PHASERenderingState v3 = atomic_load((unint64_t *)v2->_impl.__ptr_.__value_ + 3);
  objc_sync_exit(v2);

  return v3;
}

- (PHASEObject)rootObject
{
  rootObject = self->_rootObject;
  if (!rootObject)
  {
    id v4 = [[PHASERootObject alloc] initWithEngine:self];
    int v5 = self->_rootObject;
    self->_rootObject = &v4->super;

    rootObject = self->_rootObject;
  }

  return rootObject;
}

- (PHASEMedium)defaultMedium
{
  defaultMedium = self->_defaultMedium;
  if (!defaultMedium)
  {
    id v4 = [[PHASEMedium alloc] initWithEngine:self preset:1835286898];
    int v5 = self->_defaultMedium;
    self->_defaultMedium = v4;

    [(PHASEMedium *)self->_defaultMedium setDefault];
    defaultMedium = self->_defaultMedium;
  }

  return defaultMedium;
}

- (void)setDefaultMedium:(PHASEMedium *)defaultMedium
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = defaultMedium;
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v4) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    __int16 v8 = "PHASEEngine.mm";
    __int16 v9 = 1024;
    int v10 = 817;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setDefaultMedium", (uint8_t *)&v7, 0x1Cu);
  }
  [(PHASEMedium *)v4 setDefault];
  int v6 = self->_defaultMedium;
  self->_defaultMedium = v4;
}

- (PHASEReverbPreset)defaultReverbPreset
{
  return self->_defaultPrivateReverbPreset;
}

- (void)setDefaultReverbPreset:(PHASEReverbPreset)defaultReverbPreset
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    int v7 = "PHASEEngine.mm";
    __int16 v8 = 1024;
    int v9 = 830;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setDefaultReverbPreset", (uint8_t *)&v6, 0x1Cu);
  }
  [(PHASEEngine *)self setDefaultPrivateReverbPreset:defaultReverbPreset];
}

- (void)setOutputSpatializationMode:(PHASESpatializationMode)outputSpatializationMode
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = self;
  int v5 = (Phase::Logger *)objc_sync_enter(v4);
  int v6 = **(id **)(Phase::Logger::GetInstance(v5) + 432);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)outputSpatializationMode > PHASESpatializationModeAlwaysUseChannelBased) {
      int v7 = "unknown";
    }
    else {
      int v7 = off_2645F7778[outputSpatializationMode];
    }
    int v12 = 136315906;
    uint64_t v13 = "PHASEEngine.mm";
    __int16 v14 = 1024;
    int v15 = 840;
    __int16 v16 = 2048;
    int v17 = v4;
    __int16 v18 = 2080;
    v19 = v7;
    _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setOutputSpatializationMode %s", (uint8_t *)&v12, 0x26u);
  }
  __int16 v8 = [(PHASEEngine *)v4 engineMode];
  if (v8)
  {
    int v9 = **(id **)(Phase::Logger::GetInstance(v8) + 432);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint64_t v13 = "PHASEEngine.mm";
      __int16 v14 = 1024;
      int v15 = 846;
      _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d setOverrideOutputSpatializationMode: Cannot be called when running Client/Server mode.", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    uint64_t v10 = Phase::Controller::TaskManager::GetService<Phase::Controller::SpatializerManager>((Phase::Logger *)((char *)v4->_impl.__ptr_.__value_ + 48), 9);
    if (v10)
    {
      if (outputSpatializationMode == PHASESpatializationModeAutomatic) {
        [(PHASEEngine *)v4 engineMode];
      }
      *(void *)(v10 + 72) = outputSpatializationMode;
      unint64_t SpatializerForConfig = Phase::Controller::SpatializerManager::GetSpatializerForConfig(outputSpatializationMode, *(_DWORD *)(v10 + 40), (unsigned int **)(v10 + 48));
      Phase::Controller::SpatializerManager::SetActiveSpatializer((Phase::Controller::SpatializerManager *)v10, SpatializerForConfig);
      v4->_outputSpatializationMode = outputSpatializationMode;
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"PHASE system initialization failure." format:@"SpatializerManager is unavailable"];
    }
  }
  objc_sync_exit(v4);
}

- (void)setOverrideOutputSpatializationMode:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    int v7 = "PHASEEngine.mm";
    __int16 v8 = 1024;
    int v9 = 875;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setOverrideOutputSpatializationMode", (uint8_t *)&v6, 0x1Cu);
  }
  [(PHASEEngine *)self setOutputSpatializationMode:a3];
}

- (PHASESpatializationMode)outputSpatializationMode
{
  return self->_outputSpatializationMode;
}

- (int64_t)overrideOutputSpatializationMode
{
  return self->_outputSpatializationMode;
}

- (BOOL)setHeadphoneHRIRFile:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v6 = (NSURL *)a3;
  int v7 = self;
  __int16 v8 = (Phase::Logger *)objc_sync_enter(v7);
  int v9 = **(id **)(Phase::Logger::GetInstance(v8) + 432);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "PHASEEngine.mm";
    __int16 v31 = 1024;
    int v32 = 898;
    __int16 v33 = 2048;
    v34 = v7;
    _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setHeadphoneHRIRFile", buf, 0x1Cu);
  }
  if (a4) {
    *a4 = 0;
  }
  if ([(PHASEEngine *)v7 engineMode])
  {
    uint64_t v10 = *MEMORY[0x263F08320];
    uint64_t v27 = *MEMORY[0x263F08320];
    __int16 v11 = [NSString stringWithFormat:@"setHeadphoneHRIRFile: Cannot be called when running Client/Server mode."];
    v28 = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    __int16 v14 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                        + 432)));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = [v12 objectForKeyedSubscript:v10];
      *(_DWORD *)buf = 136315650;
      v30 = "PHASEEngine.mm";
      __int16 v31 = 1024;
      int v32 = 912;
      __int16 v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (!a4) {
      goto LABEL_11;
    }
    __int16 v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913633 userInfo:v12];
    goto LABEL_10;
  }
  v19 = (Phase::Controller::SpatializerManager *)Phase::Controller::TaskManager::GetService<Phase::Controller::SpatializerManager>((Phase::Logger *)((char *)v7->_impl.__ptr_.__value_ + 48), 9);
  if (!v19)
  {
    [MEMORY[0x263EFF940] raise:@"PHASE system initialization failure." format:@"SpatializerManager is unavailable"];
    goto LABEL_12;
  }
  if (Phase::Controller::SpatializerManager::SetHeadphoneHRIR(v19, v6) != 2)
  {
    BOOL v17 = 1;
    goto LABEL_13;
  }
  uint64_t v20 = *MEMORY[0x263F08320];
  uint64_t v25 = *MEMORY[0x263F08320];
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid headphone HRIR file %s", -[NSURL fileSystemRepresentation](v6, "fileSystemRepresentation"));
  v26 = v21;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  v23 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v22)
                                                                                      + 432)));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = [v12 objectForKeyedSubscript:v20];
    *(_DWORD *)buf = 136315650;
    v30 = "PHASEEngine.mm";
    __int16 v31 = 1024;
    int v32 = 935;
    __int16 v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
  }
  if (a4)
  {
    __int16 v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920801 userInfo:v12];
LABEL_10:
    *a4 = v16;
  }
LABEL_11:

LABEL_12:
  BOOL v17 = 0;
LABEL_13:
  objc_sync_exit(v7);

  return v17;
}

- (void)setTargetRoomAcousticParameters:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (Phase::Logger *)a3;
  int v5 = **(id **)(Phase::Logger::GetInstance(v4) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    int v7 = "PHASEEngine.mm";
    __int16 v8 = 1024;
    int v9 = 955;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setTargetRoomAcousticParameters:", (uint8_t *)&v6, 0x1Cu);
  }
  [(PHASEEngine *)self setRoomAcousticTarget:v4];
}

- (void)setEnableRoomAcousticParametersTracking:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = "NO";
    *(void *)&v7[4] = "PHASEEngine.mm";
    *(_WORD *)&v7[12] = 1024;
    *(_DWORD *)&v7[14] = 963;
    *(_DWORD *)int v7 = 136315906;
    if (v3) {
      int v6 = "YES";
    }
    *(_WORD *)&v7[18] = 2048;
    *(void *)&v7[20] = self;
    __int16 v8 = 2080;
    int v9 = v6;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting enableRoomAcousticParametersTracking to %s", v7, 0x26u);
  }
  -[PHASEEngine setRoomAcousticTrackingMode:](self, "setRoomAcousticTrackingMode:", v3 << 63 >> 63, *(_OWORD *)v7, *(void *)&v7[16]);
  self->_enableRoomAcousticParametersTracking = v3;
}

- (void)setRoomAcousticTrackingMode:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      int v6 = "Invalid";
    }
    else {
      int v6 = off_2645F7710[a3];
    }
    int v7 = 136315906;
    __int16 v8 = "PHASEEngine.mm";
    __int16 v9 = 1024;
    int v10 = 976;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    __int16 v14 = v6;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting roomAcousticTrackingMode to %s", (uint8_t *)&v7, 0x26u);
  }
  (*(void (**)(void, int64_t))(**((void **)self->_impl.__ptr_.__value_ + 46) + 136))(*((void *)self->_impl.__ptr_.__value_ + 46), a3);
  self->_roomAcousticTrackingMode = a3;
}

- (void)setRoomAcousticTarget:(id)a3
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v4 = (Phase::Logger *)a3;
  __p = 0;
  v101 = 0;
  unint64_t v102 = 0;
  v97 = 0;
  v98 = 0;
  v99 = 0;
  v94 = 0;
  v95 = 0;
  v96 = 0;
  v91 = 0;
  v92 = 0;
  v93 = 0;
  v88 = 0;
  v89 = 0;
  v90 = 0;
  int v5 = **(id **)(Phase::Logger::GetInstance(v4) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v104 = "PHASEEngine.mm";
    __int16 v105 = 1024;
    int v106 = 986;
    __int16 v107 = 2048;
    v108 = self;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setRoomAcousticTarget:", buf, 0x1Cu);
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  [(Phase::Logger *)v4 subbandParameters];
  v82 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v84 objects:v118 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v85 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v9 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        int v10 = (void *)MEMORY[0x263F089D8];
        [v9 frequency];
        uint64_t v12 = v11;
        [v9 rt60];
        uint64_t v14 = v13;
        [v9 confidence];
        uint64_t v16 = v15;
        [v9 earlyRoomEqDb];
        uint64_t v18 = v17;
        [v9 lateRoomEqDb];
        objc_msgSend(v10, "stringWithFormat:", @"centerFrequency %g RT60 %g confidence %g earlyRoomEQdB %g lateRoomEQdB %g", v12, v14, v16, v18, v19);
        uint64_t v20 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
        v21 = **(id **)(Phase::Logger::GetInstance(v20) + 432);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v104 = "PHASEEngine.mm";
          __int16 v105 = 1024;
          int v106 = 994;
          __int16 v107 = 2112;
          v108 = (PHASEEngine *)v20;
          _os_log_impl(&dword_221E5E000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@", buf, 0x1Cu);
        }
        [v9 frequency];
        float v23 = v22;
        v24 = v101;
        if ((unint64_t)v101 >= v102)
        {
          v26 = (float *)__p;
          int64_t v27 = ((char *)v101 - (unsigned char *)__p) >> 2;
          unint64_t v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v29 = v102 - (void)__p;
          if ((uint64_t)(v102 - (void)__p) >> 1 > v28) {
            unint64_t v28 = v29 >> 1;
          }
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v28;
          }
          if (v30)
          {
            __int16 v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v102, v30);
            v26 = (float *)__p;
            v24 = v101;
          }
          else
          {
            __int16 v31 = 0;
          }
          int v32 = (float *)&v31[4 * v27];
          *int v32 = v23;
          uint64_t v25 = v32 + 1;
          while (v24 != v26)
          {
            int v33 = *((_DWORD *)v24-- - 1);
            *((_DWORD *)v32-- - 1) = v33;
          }
          __p = v32;
          v101 = v25;
          unint64_t v102 = (unint64_t)&v31[4 * v30];
          if (v26) {
            operator delete(v26);
          }
        }
        else
        {
          float *v101 = v23;
          uint64_t v25 = v24 + 1;
        }
        v101 = v25;
        [v9 rt60];
        float v35 = v34;
        v36 = v98;
        if (v98 >= v99)
        {
          v38 = (float *)v97;
          uint64_t v39 = ((char *)v98 - (unsigned char *)v97) >> 2;
          unint64_t v40 = v39 + 1;
          if ((unint64_t)(v39 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v41 = (char *)v99 - (unsigned char *)v97;
          if (((char *)v99 - (unsigned char *)v97) >> 1 > v40) {
            unint64_t v40 = v41 >> 1;
          }
          if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v42 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v42 = v40;
          }
          if (v42)
          {
            v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v99, v42);
            v38 = (float *)v97;
            v36 = v98;
          }
          else
          {
            v43 = 0;
          }
          v44 = (float *)&v43[4 * v39];
          float *v44 = v35;
          v37 = v44 + 1;
          while (v36 != v38)
          {
            int v45 = *((_DWORD *)v36-- - 1);
            *((_DWORD *)v44-- - 1) = v45;
          }
          v97 = v44;
          v98 = v37;
          v99 = (float *)&v43[4 * v42];
          if (v38) {
            operator delete(v38);
          }
        }
        else
        {
          float *v98 = v35;
          v37 = v36 + 1;
        }
        v98 = v37;
        [v9 earlyRoomEqDb];
        float v47 = v46;
        v48 = v95;
        if (v95 >= v96)
        {
          v50 = (float *)v94;
          uint64_t v51 = ((char *)v95 - (unsigned char *)v94) >> 2;
          unint64_t v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v53 = (char *)v96 - (unsigned char *)v94;
          if (((char *)v96 - (unsigned char *)v94) >> 1 > v52) {
            unint64_t v52 = v53 >> 1;
          }
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v54 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v54 = v52;
          }
          if (v54)
          {
            v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v96, v54);
            v50 = (float *)v94;
            v48 = v95;
          }
          else
          {
            v55 = 0;
          }
          v56 = (float *)&v55[4 * v51];
          float *v56 = v47;
          v49 = v56 + 1;
          while (v48 != v50)
          {
            int v57 = *((_DWORD *)v48-- - 1);
            *((_DWORD *)v56-- - 1) = v57;
          }
          v94 = v56;
          v95 = v49;
          v96 = (float *)&v55[4 * v54];
          if (v50) {
            operator delete(v50);
          }
        }
        else
        {
          float *v95 = v47;
          v49 = v48 + 1;
        }
        v95 = v49;
        [v9 lateRoomEqDb];
        float v59 = v58;
        v60 = v92;
        if (v92 >= v93)
        {
          v62 = (float *)v91;
          uint64_t v63 = ((char *)v92 - (unsigned char *)v91) >> 2;
          unint64_t v64 = v63 + 1;
          if ((unint64_t)(v63 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v65 = (char *)v93 - (unsigned char *)v91;
          if (((char *)v93 - (unsigned char *)v91) >> 1 > v64) {
            unint64_t v64 = v65 >> 1;
          }
          if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v66 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v66 = v64;
          }
          if (v66)
          {
            v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v93, v66);
            v62 = (float *)v91;
            v60 = v92;
          }
          else
          {
            v67 = 0;
          }
          v68 = (float *)&v67[4 * v63];
          float *v68 = v59;
          v61 = v68 + 1;
          while (v60 != v62)
          {
            int v69 = *((_DWORD *)v60-- - 1);
            *((_DWORD *)v68-- - 1) = v69;
          }
          v91 = v68;
          v92 = v61;
          v93 = (float *)&v67[4 * v66];
          if (v62) {
            operator delete(v62);
          }
        }
        else
        {
          float *v92 = v59;
          v61 = v60 + 1;
        }
        v92 = v61;
        [v9 confidence];
        float v71 = v70;
        v72 = v89;
        if (v89 >= v90)
        {
          v74 = (float *)v88;
          uint64_t v75 = ((char *)v89 - (unsigned char *)v88) >> 2;
          unint64_t v76 = v75 + 1;
          if ((unint64_t)(v75 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v77 = (char *)v90 - (unsigned char *)v88;
          if (((char *)v90 - (unsigned char *)v88) >> 1 > v76) {
            unint64_t v76 = v77 >> 1;
          }
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v78 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v78 = v76;
          }
          if (v78)
          {
            v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v90, v78);
            v74 = (float *)v88;
            v72 = v89;
          }
          else
          {
            v79 = 0;
          }
          v80 = (float *)&v79[4 * v75];
          float *v80 = v71;
          v73 = v80 + 1;
          while (v72 != v74)
          {
            int v81 = *((_DWORD *)v72-- - 1);
            *((_DWORD *)v80-- - 1) = v81;
          }
          v88 = v80;
          v89 = v73;
          v90 = (float *)&v79[4 * v78];
          if (v74) {
            operator delete(v74);
          }
        }
        else
        {
          float *v89 = v71;
          v73 = v72 + 1;
        }
        v89 = v73;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v84 objects:v118 count:16];
    }
    while (v6);
  }

  bzero(buf, 0x2C0uLL);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v97, Phase::sThreeBandFrequencies, Phase::sOctaveBandFrequencies, (uint64_t)buf);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v94, Phase::sThreeBandFrequencies, Phase::sOctaveBandFrequencies, (uint64_t)&v105);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v91, Phase::sThreeBandFrequencies, Phase::sOctaveBandFrequencies, (uint64_t)&v108 + 4);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v88, Phase::sThreeBandFrequencies, Phase::sOctaveBandFrequencies, (uint64_t)&v109);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v97, Phase::sOctaveBandFrequencies, Phase::sThirdOctaveBandFrequencies, (uint64_t)&v110);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v94, Phase::sOctaveBandFrequencies, Phase::sThirdOctaveBandFrequencies, (uint64_t)&v111);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v91, Phase::sOctaveBandFrequencies, Phase::sThirdOctaveBandFrequencies, (uint64_t)&v112);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v88, Phase::sOctaveBandFrequencies, Phase::sThirdOctaveBandFrequencies, (uint64_t)&v113);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v97, Phase::sThirdOctaveBandFrequencies, &Phase::sThirdOctaveBandFrequencies[31], (uint64_t)&v114);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v94, Phase::sThirdOctaveBandFrequencies, &Phase::sThirdOctaveBandFrequencies[31], (uint64_t)&v115);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v91, Phase::sThirdOctaveBandFrequencies, &Phase::sThirdOctaveBandFrequencies[31], (uint64_t)&v116);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v88, Phase::sThirdOctaveBandFrequencies, &Phase::sThirdOctaveBandFrequencies[31], (uint64_t)&v117);
  (*(void (**)(void, uint8_t *))(**((void **)v82->_impl.__ptr_.__value_ + 46) + 144))(*((void *)v82->_impl.__ptr_.__value_ + 46), buf);
  v82->_roomAcousticTarget = (PHASETargetRoomAcousticParameters *)v4;
  if (v88)
  {
    v89 = (float *)v88;
    operator delete(v88);
  }
  if (v91)
  {
    v92 = (float *)v91;
    operator delete(v91);
  }
  if (v94)
  {
    v95 = (float *)v94;
    operator delete(v94);
  }
  if (v97)
  {
    v98 = (float *)v97;
    operator delete(v97);
  }
  if (__p)
  {
    v101 = (float *)__p;
    operator delete(__p);
  }
}

- (void)setRoomAcousticMaximumReverbTime:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    __int16 v8 = "PHASEEngine.mm";
    __int16 v9 = 1024;
    int v10 = 1086;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    __int16 v13 = 2048;
    double v14 = a3;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting roomAcousticMaximumReverbTime to %f", (uint8_t *)&v7, 0x26u);
  }
  float v6 = a3;
  (*(void (**)(void, float))(**((void **)self->_impl.__ptr_.__value_ + 46) + 152))(*((void *)self->_impl.__ptr_.__value_ + 46), v6);
  self->_roomAcousticMaximumReverbTime = a3;
}

- (void)setRoomAcousticSoftLimiting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    float v6 = "NO";
    __int16 v8 = "PHASEEngine.mm";
    __int16 v9 = 1024;
    int v10 = 1094;
    int v7 = 136315906;
    if (v3) {
      float v6 = "YES";
    }
    __int16 v11 = 2048;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    double v14 = v6;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting roomAcousticSoftLimiting to %s", (uint8_t *)&v7, 0x26u);
  }
  (*(void (**)(void, BOOL))(**((void **)self->_impl.__ptr_.__value_ + 46) + 160))(*((void *)self->_impl.__ptr_.__value_ + 46), v3);
  self->_roomAcousticSoftLimiting = v3;
}

- (void)setRoomAcousticSmoothing:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    __int16 v8 = "PHASEEngine.mm";
    __int16 v9 = 1024;
    int v10 = 1102;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    __int16 v13 = 2048;
    double v14 = a3;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting roomAcousticSmoothing to %f", (uint8_t *)&v7, 0x26u);
  }
  float v6 = a3;
  (*(void (**)(void, float))(**((void **)self->_impl.__ptr_.__value_ + 46) + 168))(*((void *)self->_impl.__ptr_.__value_ + 46), v6);
  self->_roomAcousticSmoothing = a3;
}

- (void)setDefaultPrivateReverbPreset:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    double v14 = "PHASEEngine.mm";
    __int16 v15 = 1024;
    int v16 = 1111;
    __int16 v17 = 2048;
    uint64_t v18 = self;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setDefaultPrivateReverbPreset", (uint8_t *)&v13, 0x1Cu);
  }
  if (self->_defaultPrivateReverbPreset != a3)
  {
    float v6 = GetReverbPresetName(a3);
    int v7 = v6;
    if (v6)
    {
      __int16 v8 = (unsigned char *)[v6 UTF8String];
      if (v8 && (unsigned int v9 = *v8, *v8))
      {
        int v10 = v8 + 1;
        uint64_t v11 = 0xCBF29CE484222325;
        do
        {
          uint64_t v11 = 0x100000001B3 * (v11 ^ v9);
          unsigned int v12 = *v10++;
          unsigned int v9 = v12;
        }
        while (v12);
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
      a3 = 1917742958;
    }
    self->_defaultPrivateReverbPreset = a3;
    (*(void (**)(void, uint64_t))(**((void **)self->_impl.__ptr_.__value_ + 46) + 208))(*((void *)self->_impl.__ptr_.__value_ + 46), v11);
  }
}

- (void)setSpaceBlendTargetPreset:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    int v16 = 136315906;
    __int16 v17 = "PHASEEngine.mm";
    __int16 v18 = 1024;
    int v19 = 1125;
    __int16 v20 = 2048;
    v21 = self;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Trying to set spaceBlendTargetPreset to: %ld", (uint8_t *)&v16, 0x26u);
  }
  if (self->_spaceBlendTargetPreset != a3)
  {
    int v7 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v6) + 432);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t spaceBlendTargetPreset = self->_spaceBlendTargetPreset;
      int v16 = 136315906;
      __int16 v17 = "PHASEEngine.mm";
      __int16 v18 = 1024;
      int v19 = 1130;
      __int16 v20 = 2048;
      v21 = (PHASEEngine *)spaceBlendTargetPreset;
      __int16 v22 = 2048;
      int64_t v23 = a3;
      _os_log_impl(&dword_221E5E000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Changing spaceBlendTargetPreset from %ld to %ld.", (uint8_t *)&v16, 0x26u);
    }
    unsigned int v9 = GetReverbPresetName(a3);
    int v10 = v9;
    if (v9)
    {
      uint64_t v11 = (unsigned char *)[v9 UTF8String];
      if (v11 && (unsigned int v12 = *v11, *v11))
      {
        int v13 = v11 + 1;
        uint64_t v14 = 0xCBF29CE484222325;
        do
        {
          uint64_t v14 = 0x100000001B3 * (v14 ^ v12);
          unsigned int v15 = *v13++;
          unsigned int v12 = v15;
        }
        while (v15);
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
      a3 = 1917742958;
    }
    self->_int64_t spaceBlendTargetPreset = a3;
    (*(void (**)(void, uint64_t))(**((void **)self->_impl.__ptr_.__value_ + 46) + 176))(*((void *)self->_impl.__ptr_.__value_ + 46), v14);
  }
}

- (uint64_t)setSpaceBlendTargetPresetOrientation:(__n128 *)a1
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)a1) + 432);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    unsigned int v9 = "PHASEEngine.mm";
    __int16 v10 = 1024;
    int v11 = 1147;
    __int16 v12 = 2048;
    int v13 = a1;
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[0];
    __int16 v16 = 2048;
    double v17 = a2.n128_f32[1];
    __int16 v18 = 2048;
    double v19 = a2.n128_f32[2];
    __int16 v20 = 2048;
    double v21 = a2.n128_f32[3];
    _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting spaceBlendTargetPresetOrientation to :%f %f %f %f", buf, 0x44u);
  }
  a1[15] = a2;
  uint64_t v4 = *(void *)(a1->n128_u64[1] + 368);
  __n128 v7 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *))(*(void *)v4 + 184))(v4, &v7);
}

- (void)setSpaceBlendLevel:(double)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v6 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315906;
    int v13 = "PHASEEngine.mm";
    __int16 v14 = 1024;
    int v15 = 1155;
    __int16 v16 = 2048;
    double v17 = self;
    __int16 v18 = 2048;
    double v19 = a3;
    _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting spaceBlendLevel to: %.2f", (uint8_t *)&v12, 0x26u);
  }
  __n128 v7 = (objc_class *)objc_opt_class();
  __int16 v8 = NSStringFromClass(v7);
  unsigned int v9 = NSStringFromSelector(a2);
  double v10 = PHASEGetPropertyBounded<double>(v8, v9, a3, 0.0, 1.0);

  float v11 = v10;
  (*(void (**)(void, float))(**((void **)self->_impl.__ptr_.__value_ + 46) + 192))(*((void *)self->_impl.__ptr_.__value_ + 46), v11);
  self->_spaceBlendLevel = v10;
}

- (void)setSceneClassification:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    __n128 v7 = "PHASEEngine.mm";
    __int16 v8 = 1024;
    int v9 = 1167;
    __int16 v10 = 2048;
    float v11 = self;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setSceneClassification", (uint8_t *)&v6, 0x1Cu);
  }
  (*(void (**)(void, int64_t))(**((void **)self->_impl.__ptr_.__value_ + 46) + 200))(*((void *)self->_impl.__ptr_.__value_ + 46), a3);
  self->_sceneClassification = a3;
}

- (void)setSceneRoomUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (Phase::Logger *)a3;
  int v5 = **(id **)(Phase::Logger::GetInstance(v4) + 432);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    __int16 v8 = "PHASEEngine.mm";
    __int16 v9 = 1024;
    int v10 = 1175;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setSceneRoomUUID", (uint8_t *)&v7, 0x1Cu);
  }
  sceneRoomUUID = self->_sceneRoomUUID;
  self->_sceneRoomUUID = (NSUUID *)v4;
}

- (void)setMaximumGainDbSpl:(double)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "PHASEEngine.mm";
    __int16 v6 = 1024;
    int v7 = 1189;
    _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d setMaximumGainDbSpl: This value is deprecated. It no longer has any effect on the engine. Ignoring request.", (uint8_t *)&v4, 0x12u);
  }
}

- (double)maximumGainDbSpl
{
  return self->_maxGainDbSpl;
}

- (void)setUnitsPerSecond:(double)unitsPerSecond
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v5 = self;
  __int16 v6 = (Phase::Logger *)objc_sync_enter(v5);
  int v7 = **(id **)(Phase::Logger::GetInstance(v6) + 432);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "PHASEEngine.mm";
    __int16 v23 = 1024;
    int v24 = 1201;
    __int16 v25 = 2048;
    unint64_t v26 = (unint64_t)v5;
    _os_log_impl(&dword_221E5E000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setUnitsPerSecond", buf, 0x1Cu);
  }
  uint64_t v8 = (objc_class *)objc_opt_class();
  __int16 v9 = NSStringFromClass(v8);
  int v10 = NSStringFromSelector(a2);
  double v11 = PHASEGetPropertyBounded<double>(v9, v10, unitsPerSecond, 2.22507386e-308, 1.79769313e308);

  uint64_t v12 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)((char *)v5->_impl.__ptr_.__value_ + 48), 10);
  uint64_t v13 = **(void **)(v12 + 8);
  unint64_t v20 = 0;
  BOOL v19 = 1;
  __int16 v14 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v13, 24, &v20, &v19);
  if (!v14)
  {
    Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    double v17 = **(id **)(v13 + 48);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "CommandQueue.hpp";
      __int16 v23 = 1024;
      int v24 = 100;
      _os_log_impl(&dword_221E5E000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v19)
  {
    int v15 = **(id **)(v13 + 48);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = "CommandQueue.hpp";
      __int16 v23 = 1024;
      int v24 = 89;
      __int16 v25 = 2048;
      unint64_t v26 = v20;
      __int16 v27 = 2048;
      uint64_t v28 = 24;
      _os_log_impl(&dword_221E5E000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *(void *)__int16 v14 = &unk_26D478DF8;
  *((void *)v14 + 1) = v12;
  v14[2] = v11;
  Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v13, 24);
  atomic_store(0, (unsigned __int8 *)(v13 + 40));
  v5->_unitsPerSecond = v11;
  objc_sync_exit(v5);
}

- (double)unitsPerSecond
{
  return self->_unitsPerSecond;
}

- (void)setUnitsPerMeter:(double)unitsPerMeter
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v5 = self;
  __int16 v6 = (Phase::Logger *)objc_sync_enter(v5);
  int v7 = **(id **)(Phase::Logger::GetInstance(v6) + 432);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "PHASEEngine.mm";
    __int16 v14 = 1024;
    int v15 = 1227;
    __int16 v16 = 2048;
    double v17 = v5;
    _os_log_impl(&dword_221E5E000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setUnitsPerMeter", (uint8_t *)&v12, 0x1Cu);
  }
  uint64_t v8 = (objc_class *)objc_opt_class();
  __int16 v9 = NSStringFromClass(v8);
  int v10 = NSStringFromSelector(a2);
  double v11 = PHASEGetPropertyBounded<double>(v9, v10, unitsPerMeter, 2.22507386e-308, 1.79769313e308);

  if (v11 != v5->_unitsPerMeter)
  {
    (*(void (**)(void, double))(**((void **)v5->_impl.__ptr_.__value_ + 51) + 48))(*((void *)v5->_impl.__ptr_.__value_ + 51), v11);
    v5->_unitsPerMeter = v11;
  }
  objc_sync_exit(v5);
}

- (double)unitsPerMeter
{
  return self->_unitsPerMeter;
}

- (void)addSoundEvent:(id)a3
{
  id obj = self->_internalSoundEvents;
  id v5 = a3;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_internalSoundEvents addObject:v5];

  objc_sync_exit(obj);
}

- (void)removeSoundEvent:(id)a3
{
  id obj = self->_internalSoundEvents;
  id v5 = a3;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_internalSoundEvents removeObject:v5];

  objc_sync_exit(obj);
}

- (NSArray)soundEvents
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_internalSoundEvents];

  return (NSArray *)v2;
}

- (void)update
{
  id obj = self;
  objc_sync_enter(obj);
  if (*((void *)obj->_impl.__ptr_.__value_ + 63) == 1)
  {
    double v2 = (double)(std::chrono::steady_clock::now().__d_.__rep_ - obj->_stopWatch.mStart.__d_.__rep_) / 1000000000.0;
    obj->_stopWatch.mStart.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    PHASEEngineImpl::UpdateFrame(obj->_impl.__ptr_.__value_, v2);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot call update while in automatic mode"];
  }
  objc_sync_exit(obj);
}

- (void)addGroup:(id)a3
{
  id v4 = a3;
  groups = self->_groups;
  id v7 = v4;
  __int16 v6 = [v4 identifier];
  [(NSMutableDictionary *)groups setObject:v7 forKey:v6];
}

- (void)removeGroup:(id)a3
{
  groups = self->_groups;
  id v4 = [a3 identifier];
  -[NSMutableDictionary removeObjectForKey:](groups, "removeObjectForKey:");
}

- (NSDictionary)groups
{
  return (NSDictionary *)[NSDictionary dictionaryWithDictionary:self->_groups];
}

- (NSArray)duckers
{
  return (NSArray *)[NSDictionary dictionaryWithDictionary:self->_duckers];
}

- (void)addDucker:(id)a3
{
  id v4 = a3;
  duckers = self->_duckers;
  id v7 = v4;
  __int16 v6 = [v4 identifier];
  [(NSMutableDictionary *)duckers setObject:v7 forKey:v6];
}

- (void)removeDucker:(id)a3
{
  duckers = self->_duckers;
  id v4 = [a3 identifier];
  -[NSMutableDictionary removeObjectForKey:](duckers, "removeObjectForKey:");
}

- (void)setInternalActiveGroupMixerPreset:(id)a3
{
}

- (void)setSpatialHint:(int64_t)a3
{
  id obj = self;
  objc_sync_enter(obj);
  if (a3)
  {
    if (a3 != 1) {
      std::terminate();
    }
    id v4 = @"SimulatedIndirectPath";
  }
  else
  {
    id v4 = @"Default";
  }
  [(PHASEEngine *)obj setProfileOverrideWithName:v4 balance:1.0];
  obj->_spatialHint = a3;
  objc_sync_exit(obj);
}

- (int64_t)spatialHint
{
  return self->_spatialHint;
}

- (void)setExperience:(int64_t)a3
{
  self->_experience = a3;
}

- (void)setBalance:(double)a3
{
  self->_balance = a3;
}

- (void)setSpatialCategoryUpdateRate:(float)a3 withName:(id)a4
{
  id v9 = a4;
  __int16 v6 = self;
  objc_sync_enter(v6);
  if ([v9 isEqualToString:@"direct_path_transmission"])
  {
    unsigned int v7 = 1;
  }
  else if ([v9 isEqualToString:@"early_reflections"])
  {
    unsigned int v7 = 2;
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([v9 isEqualToString:@"late_reverb"]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = v7;
  }
  (*(void (**)(void, uint64_t, float))(**((void **)v6->_impl.__ptr_.__value_ + 51) + 24))(*((void *)v6->_impl.__ptr_.__value_ + 51), v8, a3);
  objc_sync_exit(v6);
}

- (void)setSpatialCategoryBandCount:(unint64_t)a3 withName:(id)a4
{
  id v9 = a4;
  __int16 v6 = self;
  objc_sync_enter(v6);
  if ([v9 isEqualToString:@"direct_path_transmission"])
  {
    unsigned int v7 = 1;
  }
  else if ([v9 isEqualToString:@"early_reflections"])
  {
    unsigned int v7 = 2;
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([v9 isEqualToString:@"late_reverb"]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = v7;
  }
  (*(void (**)(void, uint64_t, unint64_t))(**((void **)v6->_impl.__ptr_.__value_ + 51) + 32))(*((void *)v6->_impl.__ptr_.__value_ + 51), v8, a3);
  objc_sync_exit(v6);
}

- (void)setSpatialCategoryMaxClusterCount:(unint64_t)a3 withName:(id)a4
{
  id v9 = a4;
  __int16 v6 = self;
  objc_sync_enter(v6);
  if ([v9 isEqualToString:@"direct_path_transmission"])
  {
    unsigned int v7 = 1;
  }
  else if ([v9 isEqualToString:@"early_reflections"])
  {
    unsigned int v7 = 2;
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([v9 isEqualToString:@"late_reverb"]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = v7;
  }
  (*(void (**)(void, uint64_t, unint64_t))(**((void **)v6->_impl.__ptr_.__value_ + 51) + 40))(*((void *)v6->_impl.__ptr_.__value_ + 51), v8, a3);
  objc_sync_exit(v6);
}

- (void)setProfileOverride:(id)a3 experience:(id)a4 faceCount:(int)a5 balance:(double)a6
{
}

- (void)setProfileOverrideWithName:(id)a3 balance:(double)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unsigned int v7 = (Phase::Logger *)a3;
  uint64_t v8 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                     + 432)));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315906;
    uint64_t v22 = "PHASEEngine.mm";
    __int16 v23 = 1024;
    int v24 = 1456;
    __int16 v25 = 2080;
    uint64_t v26 = [(Phase::Logger *)v7 UTF8String];
    __int16 v27 = 2048;
    double v28 = a4;
    _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d received message setProfileOverrideWithName:%s balance:%f", (uint8_t *)&v21, 0x26u);
  }

  IsInternalBuild = (Phase::Logger *)Phase::Controller::DeviceInfo::IsInternalBuild(v9);
  if ((unsigned __int16)IsInternalBuild >= 0x100u && (_BYTE)IsInternalBuild)
  {
    if (a4 >= 0.0)
    {
      if (a4 <= 1.0) {
        goto LABEL_14;
      }
      double v11 = **(id **)(Phase::Logger::GetInstance(IsInternalBuild) + 432);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      int v21 = 136315906;
      uint64_t v22 = "PHASEEngine.mm";
      __int16 v23 = 1024;
      int v24 = 1476;
      __int16 v25 = 2048;
      uint64_t v26 = 0x3FF0000000000000;
      __int16 v27 = 2048;
      double v28 = 1.0;
      int v12 = "%25s:%-5d setProfileOverrideWithName: Attempting to set balance to be greater than %f. Clamping to %f";
    }
    else
    {
      double v11 = **(id **)(Phase::Logger::GetInstance(IsInternalBuild) + 432);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_14:
        __int16 v14 = (objc_class *)objc_opt_class();
        int v15 = NSStringFromClass(v14);
        __int16 v16 = NSStringFromSelector(a2);
        double v17 = PHASEGetPropertyBounded<double>(v15, v16, a4, 0.0, 1.0);

        uint64_t v18 = *((void *)self->_impl.__ptr_.__value_ + 51);
        uint64_t StringHashId = Phase::GetStringHashId(v7, v19);
        (*(void (**)(uint64_t, uint64_t, double))(*(void *)v18 + 56))(v18, StringHashId, v17);
        goto LABEL_15;
      }
      int v21 = 136315906;
      uint64_t v22 = "PHASEEngine.mm";
      __int16 v23 = 1024;
      int v24 = 1470;
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2048;
      double v28 = 0.0;
      int v12 = "%25s:%-5d setProfileOverrideWithName: Attempting to set balance to be less than %f. Clamping to %f";
    }
    _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v21, 0x26u);
    goto LABEL_14;
  }
  uint64_t v13 = **(id **)(Phase::Logger::GetInstance(IsInternalBuild) + 432);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v21 = 136315394;
    uint64_t v22 = "PHASEEngine.mm";
    __int16 v23 = 1024;
    int v24 = 1462;
    _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d setProfileOverrideWithName: This is not an internal build. Ignoring request.", (uint8_t *)&v21, 0x12u);
  }
LABEL_15:
}

- (void)clearProfileOverride
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    int v7 = 136315394;
    uint64_t v8 = "PHASEEngine.mm";
    __int16 v9 = 1024;
    int v10 = 1489;
    _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d received message clearProfileOverride", (uint8_t *)&v7, 0x12u);
  }
  IsInternalBuild = (Phase::Logger *)Phase::Controller::DeviceInfo::IsInternalBuild((Phase::Controller::DeviceInfo *)v4);
  if ((unsigned __int16)IsInternalBuild >= 0x100u && (_BYTE)IsInternalBuild)
  {
    (*(void (**)(void))(**((void **)self->_impl.__ptr_.__value_ + 51) + 64))(*((void *)self->_impl.__ptr_.__value_
                                                                                              + 51));
  }
  else
  {
    __int16 v6 = **(id **)(Phase::Logger::GetInstance(IsInternalBuild) + 432);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      uint64_t v8 = "PHASEEngine.mm";
      __int16 v9 = 1024;
      int v10 = 1495;
      _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d setProfileOverrideWithName: This is not an internal build. Ignoring request.", (uint8_t *)&v7, 0x12u);
    }
  }
}

- (void)gatherExternalStreamDebugInformation:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  uint64_t v6 = *((void *)self->_impl.__ptr_.__value_ + 52);
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__PHASEEngine_gatherExternalStreamDebugInformation___block_invoke;
    v8[3] = &unk_2645F7738;
    id v9 = v4;
    (*(void (**)(uint64_t, void *))(*(void *)v6 + 88))(v6, v8);
  }
  else
  {
    int v7 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v4) + 432);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "PHASEEngine.mm";
      __int16 v12 = 1024;
      int v13 = 1509;
      _os_log_impl(&dword_221E5E000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Engine does not have external stream dispatcher", buf, 0x12u);
    }
  }
}

uint64_t __52__PHASEEngine_gatherExternalStreamDebugInformation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PHASEAssetRegistry)assetRegistry
{
  return self->_assetRegistry;
}

- (PHASEGroupPreset)activeGroupPreset
{
  return self->_activeGroupPreset;
}

- (BOOL)enableRoomAcousticParametersTracking
{
  return self->_enableRoomAcousticParametersTracking;
}

- (int64_t)roomAcousticTrackingMode
{
  return self->_roomAcousticTrackingMode;
}

- (PHASETargetRoomAcousticParameters)roomAcousticTarget
{
  return self->_roomAcousticTarget;
}

- (double)roomAcousticMaximumReverbTime
{
  return self->_roomAcousticMaximumReverbTime;
}

- (BOOL)roomAcousticSoftLimiting
{
  return self->_roomAcousticSoftLimiting;
}

- (double)roomAcousticSmoothing
{
  return self->_roomAcousticSmoothing;
}

- (int64_t)defaultPrivateReverbPreset
{
  return self->_defaultPrivateReverbPreset;
}

- (int64_t)spaceBlendTargetPreset
{
  return self->_spaceBlendTargetPreset;
}

- (__n128)spaceBlendTargetPresetOrientation
{
  return a1[15];
}

- (double)spaceBlendLevel
{
  return self->_spaceBlendLevel;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (PHASETapRegistry)tapRegistry
{
  return self->_tapRegistry;
}

- (int64_t)sceneClassification
{
  return self->_sceneClassification;
}

- (NSUUID)sceneRoomUUID
{
  return self->_sceneRoomUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneRoomUUID, 0);
  objc_storeStrong((id *)&self->_tapRegistry, 0);
  objc_storeStrong((id *)&self->_activeGroupPreset, 0);
  objc_storeStrong((id *)&self->_assetRegistry, 0);
  objc_storeStrong((id *)&self->_tapInterfaceImpl, 0);
  objc_storeStrong((id *)&self->_duckers, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_internalSoundEvents, 0);
  objc_storeStrong((id *)&self->_defaultMedium, 0);
  objc_storeStrong((id *)&self->_rootObject, 0);

  std::unique_ptr<PHASEEngineImpl>::reset[abi:ne180100](&self->_impl.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  self->_impl.__ptr_.__value_ = 0;
  self->_stopWatch.mStart.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  return self;
}

- (void)setUnitsPerSecond:
{
}

- (double)setUnitsPerSecond:
{
  return Phase::Controller::GroupManager::SetUnitsPerSecond(*(Phase::Controller::GroupManager **)(a1 + 8), *(double *)(a1 + 16));
}

@end