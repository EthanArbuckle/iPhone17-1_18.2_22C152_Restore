@interface PHASEExternalOutputStreamController
+ (double)recommendedAbsoluteCalibrationLevelForVoiceStreams;
+ (double)recommendedAbsoluteCalibrationLevelForVoiceStreamsAtRecommendedTargetLKFS;
+ (double)recommendedRolloffFactorForVoiceStreams;
+ (double)recommendedTargetLKFSForVoiceStreams;
+ (id)new;
+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 callback:(id)a9;
+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 calibrationMode:(int64_t)a11 level:(double)a12 callback:(id)a13;
+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 targetLKFS:(id)a11 calibrationMode:(int64_t)a12 level:(double)a13 callback:(id)a14;
+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 normalize:(BOOL)a9 calibrationMode:(int64_t)a10 level:(double)a11 callback:(id)a12;
+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 referenceGainDBSPL:(double)a9 callback:(id)a10;
+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 callback:(id)a8;
- (BOOL)prepareAndReturnError:(id *)a3;
- (BOOL)startAndReturnError:(id *)a3;
- (NSDictionary)metaParameters;
- (NSDictionary)mixers;
- (PHASEExternalOutputStreamController)init;
- (PHASEExternalOutputStreamController)initWithEngine:(id)a3 streamGroupUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 targetLKFS:(id)a11 calibrationMode:(int64_t)a12 level:(double)a13 outError:(id *)a14;
- (PHASEMixer)mixer;
- (id)description;
- (id)metaParametersForStreamUUID:(id)a3;
- (id)soundEventForStreamUUID:(id)a3;
- (void)dealloc;
- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5;
- (void)stopAndInvalidate;
- (void)updateStreamGroupUUID:(id)a3 streamUUID:(id)a4 state:(int64_t)a5;
@end

@implementation PHASEExternalOutputStreamController

- (PHASEExternalOutputStreamController)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEExternalOutputStreamController)initWithEngine:(id)a3 streamGroupUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 targetLKFS:(id)a11 calibrationMode:(int64_t)a12 level:(double)a13 outError:(id *)a14
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id obj = a3;
  id v71 = a4;
  id v72 = a5;
  id v78 = a6;
  id v73 = a7;
  id v74 = a8;
  id v75 = a9;
  id v76 = a11;
  if (a14) {
    *a14 = 0;
  }
  v90.receiver = self;
  v90.super_class = (Class)PHASEExternalOutputStreamController;
  v21 = [(PHASEExternalOutputStreamController *)&v90 init];
  v22 = v21;
  v84 = v21;
  if (!v21) {
    goto LABEL_27;
  }
  objc_storeWeak((id *)&v21->_engine, obj);
  objc_storeStrong((id *)&v84->_streamGroupUUID, a4);
  p_gainMetaParameterDefinition = (id *)&v84->_gainMetaParameterDefinition;
  objc_storeStrong((id *)&v84->_gainMetaParameterDefinition, a5);
  objc_storeStrong((id *)&v84->_mixerDefinition, a6);
  objc_storeStrong((id *)&v84->_source, a7);
  objc_storeStrong((id *)&v84->_listener, a8);
  objc_storeStrong((id *)&v84->_group, a9);
  v84->_level = a13;
  v84->_normalize = a10;
  objc_storeStrong((id *)&v84->_targetLKFS, a11);
  v84->_calibrationMode = a12;
  v84->_controlToken.mStorage[0] = 0;
  v84->_controlToken.mStorage[1] = 0;
  v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  soundEvents = v84->_soundEvents;
  v84->_soundEvents = v23;

  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  metaParameters = v84->_metaParameters;
  v84->_metaParameters = v25;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v81 = v78;
    v27 = [v81 spatialPipeline];
    id v79 = [v27 entries];

    uint64_t v28 = [v79 countByEnumeratingWithState:&v86 objects:v99 count:16];
    if (v28)
    {
      uint64_t v80 = *(void *)v87;
      do
      {
        uint64_t v82 = v28;
        for (uint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v87 != v80) {
            objc_enumerationMutation(v79);
          }
          uint64_t v30 = *(void *)(*((void *)&v86 + 1) + 8 * i);
          uint64_t v31 = [v81 spatialPipeline];
          v32 = [(id)v31 entries];
          v33 = [v32 objectForKey:v30];

          v34 = [v33 sendLevelMetaParameterDefinition];
          LOBYTE(v31) = v34 == 0;

          if ((v31 & 1) == 0)
          {
            v35 = v84->_metaParameters;
            v36 = [PHASENumberMetaParameter alloc];
            v83 = [v33 sendLevelMetaParameterDefinition];
            v85 = [v83 identifier];
            v37 = [v33 sendLevelMetaParameterDefinition];
            v38 = [v37 value];
            [v38 doubleValue];
            double v40 = v39;
            v41 = [v33 sendLevelMetaParameterDefinition];
            [v41 minimum];
            double v43 = v42;
            v44 = [v33 sendLevelMetaParameterDefinition];
            [v44 maximum];
            v46 = [(PHASENumberMetaParameter *)v36 initWithUID:v85 value:v84 rangeMin:v40 rangeMax:v43 delegate:v45];
            v47 = [v33 sendLevelMetaParameterDefinition];
            v48 = [v47 identifier];
            [(NSMutableDictionary *)v35 setValue:v46 forKey:v48];
          }
        }
        uint64_t v28 = [v79 countByEnumeratingWithState:&v86 objects:v99 count:16];
      }
      while (v28);
    }

    int v49 = 6553601;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v81 = [v78 inputChannelLayout];
    int v49 = [v81 layoutTag];
LABEL_18:
    v84->_channelLayoutTag = v49;
  }
  v22 = v84;
  if ((v84->_channelLayoutTag | 0x10000) != 0x10000)
  {
    if (*p_gainMetaParameterDefinition)
    {
      v58 = v84->_metaParameters;
      v59 = [PHASENumberMetaParameter alloc];
      v60 = [*p_gainMetaParameterDefinition identifier];
      v61 = [*p_gainMetaParameterDefinition value];
      [v61 doubleValue];
      double v63 = v62;
      [*p_gainMetaParameterDefinition minimum];
      double v65 = v64;
      [*p_gainMetaParameterDefinition maximum];
      v67 = [(PHASENumberMetaParameter *)v59 initWithUID:v60 value:v84 rangeMin:v63 rangeMax:v65 delegate:v66];
      v68 = [*p_gainMetaParameterDefinition identifier];
      [(NSMutableDictionary *)v58 setValue:v67 forKey:v68];

      v22 = v84;
    }
LABEL_27:
    v57 = v22;
    goto LABEL_28;
  }
  uint64_t v50 = *MEMORY[0x263F08320];
  uint64_t v97 = *MEMORY[0x263F08320];
  v51 = [NSString stringWithFormat:@"PHASEExternalOutputStreamController's mixer definition can't use channel bitmap or channel descriptions"];
  v98 = v51;
  v52 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];

  v54 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v53)
                                                                                      + 432)));
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    id v55 = [v52 objectForKeyedSubscript:v50];
    uint64_t v56 = [v55 UTF8String];
    *(_DWORD *)buf = 136315650;
    v92 = "PHASEExternalStream.mm";
    __int16 v93 = 1024;
    int v94 = 669;
    __int16 v95 = 2080;
    uint64_t v96 = v56;
    _os_log_impl(&dword_221E5E000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
  }
  if (a14)
  {
    *a14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346922849 userInfo:v52];
  }

  v57 = 0;
LABEL_28:

  return v57;
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 callback:(id)a8
{
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 callback:(id)a9
{
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 referenceGainDBSPL:(double)a9 callback:(id)a10
{
  LOBYTE(v10) = 1;
  +[PHASEExternalOutputStreamController controllerWithEngine:a3 streamUUID:a4 gainMetaParameterDefinition:a5 mixerDefinition:a6 source:a7 listener:a8 normalize:a9 calibrationMode:v10 level:2 callback:a10];
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 normalize:(BOOL)a9 calibrationMode:(int64_t)a10 level:(double)a11 callback:(id)a12
{
  LOBYTE(v12) = a9;
  +[PHASEExternalOutputStreamController controllerWithEngine:a3 streamUUID:a4 gainMetaParameterDefinition:a5 mixerDefinition:a6 source:a7 listener:a8 group:a11 normalize:0 calibrationMode:v12 level:a10 callback:a12];
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 calibrationMode:(int64_t)a11 level:(double)a12 callback:(id)a13
{
  id v28 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a13;
  v26 = [NSNumber numberWithDouble:-12.0];
  LOBYTE(v27) = a10;
  +[PHASEExternalOutputStreamController controllerWithEngine:v28 streamUUID:v19 gainMetaParameterDefinition:v20 mixerDefinition:v21 source:v22 listener:v23 group:a12 normalize:v24 targetLKFS:v27 calibrationMode:v26 level:a11 callback:v25];
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 targetLKFS:(id)a11 calibrationMode:(int64_t)a12 level:(double)a13 callback:(id)a14
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = v22;
  id v25 = v23;
  id v26 = a7;
  id v27 = a8;
  id v28 = v20;
  id v29 = v27;
  id v30 = a9;
  id v31 = a11;
  v32 = (void (**)(id, void, id))a14;
  v38 = v26;
  v46[0] = 0;
  LOBYTE(v36) = a10;
  v33 = [[PHASEExternalOutputStreamController alloc] initWithEngine:v28 streamGroupUUID:v21 gainMetaParameterDefinition:v24 mixerDefinition:v25 source:v26 listener:v29 group:a13 normalize:v30 targetLKFS:v36 calibrationMode:v31 level:a12 outError:v46];
  id v34 = v46[0];
  if (v34 || !v33)
  {
    v32[2](v32, 0, v34);
  }
  else
  {
    objc_initWeak(&location, v33);
    v37 = v28;
    uint64_t v35 = *(void *)([v28 implementation] + 416);
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __189__PHASEExternalOutputStreamController_controllerWithEngine_streamUUID_gainMetaParameterDefinition_mixerDefinition_source_listener_group_normalize_targetLKFS_calibrationMode_level_callback___block_invoke;
    v43[3] = &unk_2645F7848;
    objc_copyWeak(&v44, &location);
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __189__PHASEExternalOutputStreamController_controllerWithEngine_streamUUID_gainMetaParameterDefinition_mixerDefinition_source_listener_group_normalize_targetLKFS_calibrationMode_level_callback___block_invoke_2;
    v39[3] = &unk_2645F7870;
    double v40 = v33;
    id v41 = 0;
    double v42 = v32;
    (*(void (**)(uint64_t, id, void *, void *))(*(void *)v35 + 40))(v35, v21, v43, v39);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
    id v28 = v37;
  }
}

void __189__PHASEExternalOutputStreamController_controllerWithEngine_streamUUID_gainMetaParameterDefinition_mixerDefinition_source_listener_group_normalize_targetLKFS_calibrationMode_level_callback___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained updateStreamGroupUUID:v10 streamUUID:v7 state:a4];
  }
}

void __189__PHASEExternalOutputStreamController_controllerWithEngine_streamUUID_gainMetaParameterDefinition_mixerDefinition_source_listener_group_normalize_targetLKFS_calibrationMode_level_callback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  if (v11)
  {
    id v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    *(void *)(v8 + 16) = 0;
    *(void *)(v8 + 24) = 0;
    objc_sync_exit(v7);
  }
  else
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    uint64_t v10 = *(void *)(a1 + 32);
    *(void *)(v10 + 16) = a2;
    *(void *)(v10 + 24) = a3;
    objc_sync_exit(v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)metaParametersForStreamUUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_soundEvents objectForKey:v4];
  id v7 = [v6 metaParameters];

  objc_sync_exit(v5);

  return v7;
}

- (id)soundEventForStreamUUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_soundEvents objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = self;
  objc_sync_enter(v9);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [(NSMutableDictionary *)v9->_soundEvents allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v11)
  {
    uint64_t v13 = *(void *)v22;
    *(void *)&long long v12 = 136315650;
    long long v20 = v12;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = -[NSMutableDictionary objectForKey:](v9->_soundEvents, "objectForKey:", *(void *)(*((void *)&v21 + 1) + 8 * v14), v20);
        v16 = [v15 metaParameters];
        v17 = [v16 objectForKey:v8];

        if (v17)
        {
          [v17 fadeToValue:a4 duration:a5];
        }
        else
        {
          id v19 = **(id **)(Phase::Logger::GetInstance(v18) + 432);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            id v26 = "PHASEExternalStream.mm";
            __int16 v27 = 1024;
            int v28 = 907;
            __int16 v29 = 2112;
            id v30 = v8;
            _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d setting unknown meta parameter UID %@", buf, 0x1Cu);
          }
        }

        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)updateStreamGroupUUID:(id)a3 streamUUID:(id)a4 state:(int64_t)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  v47 = v9;
  uint64_t v11 = (Phase::Logger *)[v8 isEqual:v10->_streamGroupUUID];
  if (v11)
  {
    if (a5 == 1)
    {
      v16 = [(NSMutableDictionary *)v10->_soundEvents objectForKey:v9];
      [v16 stopAndInvalidate];
      [(NSMutableDictionary *)v10->_soundEvents removeObjectForKey:v9];
    }
    else if (!a5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_engine);
      if (WeakRetained)
      {
        long long v12 = [(NSMutableDictionary *)v10->_soundEvents objectForKey:v9];
        uint64_t v13 = (PHASESoundEvent *)v12;
        if (v12)
        {
          uint64_t v14 = **(id **)(Phase::Logger::GetInstance(v12) + 432);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            id v55 = "PHASEExternalStream.mm";
            __int16 v56 = 1024;
            int v57 = 947;
            __int16 v58 = 2112;
            id v59 = v9;
            __int16 v60 = 2112;
            id v61 = v8;
            _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d got creation update for already-known external stream %@ in stream group %@", buf, 0x26u);
          }
        }
        else
        {
          id v44 = +[PHASEExternalStream newUUID];
          v18 = [PHASEExternalOutputStreamNodeDefinition alloc];
          mixerDefinition = v10->_mixerDefinition;
          uint64_t channelLayoutTag = v10->_channelLayoutTag;
          long long v21 = [v44 UUIDString];
          long long v22 = [(PHASEExternalOutputStreamNodeDefinition *)v18 initWithExternalOutputStreamUUID:v9 mixerDefinition:mixerDefinition channelLayoutTag:channelLayoutTag uid:v21];

          double v45 = v22;
          [(PHASEExternalOutputStreamNodeDefinition *)v22 setNormalize:v10->_normalize];
          [(PHASEExternalOutputStreamNodeDefinition *)v22 setTargetLKFS:v10->_targetLKFS];
          long long v23 = [v47 UUIDString];
          long long v24 = [(PHASEGeneratorNodeDefinition *)v22 mixerDefinition];
          [v24 setIdentifier:v23];

          [(PHASEGeneratorNodeDefinition *)v22 setCalibrationMode:v10->_calibrationMode level:v10->_level];
          [(PHASEGeneratorNodeDefinition *)v22 setGainMetaParameterDefinition:v10->_gainMetaParameterDefinition];
          [(PHASEGeneratorNodeDefinition *)v22 setGroup:v10->_group];
          id v25 = [PHASESoundEvent alloc];
          source = v10->_source;
          listener = v10->_listener;
          id v52 = 0;
          uint64_t v13 = [(PHASESoundEvent *)v25 initWithEngine:WeakRetained rootNode:v22 source:source listener:listener error:&v52];
          int v28 = (Phase::Logger *)v52;
          double v43 = v28;
          if (!v13 || v28)
          {
            uint64_t v32 = **(id **)(Phase::Logger::GetInstance(v28) + 432);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              id v55 = "PHASEExternalStream.mm";
              __int16 v56 = 1024;
              int v57 = 987;
              __int16 v58 = 2112;
              id v59 = v8;
              __int16 v60 = 2112;
              id v61 = v47;
              __int16 v62 = 2112;
              double v63 = v43;
              _os_log_impl(&dword_221E5E000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d Controller for external stream group %@ failed to create sound event for stream ID %@: %@", buf, 0x30u);
            }
          }
          else
          {
            __int16 v29 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(0)
                                                                                                + 432)));
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = [(PHASESoundEvent *)v13 description];
              *(_DWORD *)buf = 136316162;
              id v55 = "PHASEExternalStream.mm";
              __int16 v56 = 1024;
              int v57 = 992;
              __int16 v58 = 2112;
              id v59 = v30;
              __int16 v60 = 2112;
              id v61 = v8;
              __int16 v62 = 2112;
              double v63 = (Phase::Logger *)v47;
              _os_log_impl(&dword_221E5E000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ created for external stream group %@ for stream ID %@", buf, 0x30u);
            }
            int64_t state = v10->_state;
            if (state == 1)
            {
              [(PHASESoundEvent *)v13 prepareWithCompletion:0];
            }
            else if (state == 2)
            {
              [(PHASESoundEvent *)v13 startWithCompletion:0];
            }
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            v33 = v10->_metaParameters;
            uint64_t v34 = [(NSMutableDictionary *)v33 countByEnumeratingWithState:&v48 objects:v53 count:16];
            if (v34)
            {
              uint64_t v35 = *(void *)v49;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v49 != v35) {
                    objc_enumerationMutation(v33);
                  }
                  uint64_t v37 = *(void *)(*((void *)&v48 + 1) + 8 * i);
                  v38 = [(NSMutableDictionary *)v10->_metaParameters objectForKey:v37];
                  double v39 = [(PHASESoundEvent *)v13 metaParameters];
                  double v40 = [v39 objectForKey:v37];

                  if (v38) {
                    BOOL v41 = v40 == 0;
                  }
                  else {
                    BOOL v41 = 1;
                  }
                  if (v41) {
                    std::terminate();
                  }
                  double v42 = [v38 value];
                  [v40 setValue:v42];
                }
                uint64_t v34 = [(NSMutableDictionary *)v33 countByEnumeratingWithState:&v48 objects:v53 count:16];
              }
              while (v34);
            }

            [(NSMutableDictionary *)v10->_soundEvents setObject:v13 forKey:v47];
          }
        }
      }
      else
      {
        v17 = **(id **)(Phase::Logger::GetInstance(0) + 432);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          id v55 = "PHASEExternalStream.mm";
          __int16 v56 = 1024;
          int v57 = 938;
          __int16 v58 = 2112;
          id v59 = v8;
          _os_log_impl(&dword_221E5E000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Controller for external stream group %@ has nil engine", buf, 0x1Cu);
        }
      }
    }
  }
  else
  {
    v15 = **(id **)(Phase::Logger::GetInstance(v11) + 432);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v55 = "PHASEExternalStream.mm";
      __int16 v56 = 1024;
      int v57 = 926;
      __int16 v58 = 2112;
      id v59 = v8;
      _os_log_impl(&dword_221E5E000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d got update for unknown external stream group UUID %@", buf, 0x1Cu);
    }
  }
  objc_sync_exit(v10);
}

- (NSDictionary)metaParameters
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_metaParameters;
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSDictionary)mixers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2->_soundEvents;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = -[NSMutableDictionary objectForKey:](v2->_soundEvents, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        id v9 = [v8 mixers];
        [v3 addEntriesFromDictionary:v9];
      }
      uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = (void *)[v3 copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v10;
}

- (BOOL)prepareAndReturnError:(id *)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  if (a3) {
    *a3 = 0;
  }
  int64_t state = v4->_state;
  if (state)
  {
    uint64_t v6 = *MEMORY[0x263F08320];
    uint64_t v28 = *MEMORY[0x263F08320];
    id v7 = [NSString stringWithFormat:@"Can't prepare external stream controller for stream group UUID %@ multiple times", v4->_streamGroupUUID];
    v29[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

    uint64_t v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v8 objectForKeyedSubscript:v6];
      *(_DWORD *)buf = 136315650;
      long long v23 = "PHASEExternalStream.mm";
      __int16 v24 = 1024;
      int v25 = 1069;
      __int16 v26 = 2080;
      uint64_t v27 = [v11 UTF8String];
      _os_log_impl(&dword_221E5E000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (a3)
    {
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346922849 userInfo:v8];
    }
  }
  else
  {
    v4->_int64_t state = 1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [(NSMutableDictionary *)v4->_soundEvents allKeys];
    uint64_t v12 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v8);
          }
          long long v15 = [(NSMutableDictionary *)v4->_soundEvents objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v14)];
          [v15 prepareWithCompletion:0];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }

  objc_sync_exit(v4);
  return state == 0;
}

- (BOOL)startAndReturnError:(id *)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  if (a3) {
    *a3 = 0;
  }
  unint64_t state = v4->_state;
  if (state >= 2)
  {
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v28 = *MEMORY[0x263F08320];
    uint64_t v12 = [NSString stringWithFormat:@"Can't start external stream controller for stream group UUID %@ multiple times", v4->_streamGroupUUID];
    v29[0] = v12;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

    uint64_t v14 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                        + 432)));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v6 objectForKeyedSubscript:v11];
      *(_DWORD *)buf = 136315650;
      long long v23 = "PHASEExternalStream.mm";
      __int16 v24 = 1024;
      int v25 = 1106;
      __int16 v26 = 2080;
      uint64_t v27 = [v15 UTF8String];
      _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (a3)
    {
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346922849 userInfo:v6];
    }
  }
  else
  {
    v4->_unint64_t state = 2;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(NSMutableDictionary *)v4->_soundEvents allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = [(NSMutableDictionary *)v4->_soundEvents objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v10 startWithCompletion:0];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }

  objc_sync_exit(v4);
  return state < 2;
}

- (void)stopAndInvalidate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v2->_unint64_t state = 3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)v2->_soundEvents allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [(NSMutableDictionary *)v2->_soundEvents objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v7 stopAndInvalidate];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  [(NSMutableDictionary *)v2->_soundEvents removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_engine);
  id v9 = WeakRetained;
  if (WeakRetained && (v2->_controlToken.mStorage[0] || v2->_controlToken.mStorage[1]))
  {
    uint64_t v10 = [WeakRetained implementation];
    (*(void (**)(void, NSUUID *, unint64_t, unint64_t, void *))(**(void **)(v10 + 416)
                                                                                         + 48))(*(void *)(v10 + 416), v2->_streamGroupUUID, v2->_controlToken.mStorage[0], v2->_controlToken.mStorage[1], &__block_literal_global_201);
    v2->_controlToken.mStorage[0] = 0;
    v2->_controlToken.mStorage[1] = 0;
  }

  objc_sync_exit(v2);
}

- (void)dealloc
{
  [(PHASEExternalOutputStreamController *)self stopAndInvalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHASEExternalOutputStreamController;
  [(PHASEExternalOutputStreamController *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<PHASEExternalOutputStreamController: %p, streamGroupUUID=%@>", self, self->_streamGroupUUID];
}

+ (double)recommendedTargetLKFSForVoiceStreams
{
  return -24.0;
}

+ (double)recommendedAbsoluteCalibrationLevelForVoiceStreamsAtRecommendedTargetLKFS
{
  return 74.0;
}

+ (double)recommendedAbsoluteCalibrationLevelForVoiceStreams
{
  +[PHASEExternalOutputStreamController recommendedTargetLKFSForVoiceStreams];
  double v3 = v2;
  +[PHASEExternalOutputStreamController recommendedAbsoluteCalibrationLevelForVoiceStreamsAtRecommendedTargetLKFS];
  return -12.0 - v3 + v4;
}

+ (double)recommendedRolloffFactorForVoiceStreams
{
  return 0.75;
}

- (PHASEMixer)mixer
{
  return self->_mixer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_targetLKFS, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_mixerDefinition, 0);
  objc_storeStrong((id *)&self->_gainMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_streamGroupUUID, 0);
  objc_storeStrong((id *)&self->_metaParameters, 0);
  objc_storeStrong((id *)&self->_soundEvents, 0);

  objc_destroyWeak((id *)&self->_engine);
}

@end