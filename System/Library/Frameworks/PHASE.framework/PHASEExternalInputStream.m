@interface PHASEExternalInputStream
+ (id)new;
+ (void)streamWithEngine:(id)a3 definition:(id)a4 startsPaused:(BOOL)a5 delegate:(id)a6 receiverBlock:(id)a7 callback:(id)a8;
+ (void)streamWithEngine:(id)a3 uuid:(id)a4 definition:(id)a5 startsPaused:(BOOL)a6 delegate:(id)a7 receiverBlock:(id)a8 callback:(id)a9;
- (BOOL)isMuted;
- (BOOL)registerMutedSpeechActivityNotification:(id)a3 outError:(id *)a4;
- (PHASEExternalInputStream)init;
- (PHASEExternalInputStream)initWithStreamGroupUUID:(id)a3 streamUUID:(id)a4 engine:(id)a5 streamDefinition:(id)a6 startsPaused:(BOOL)a7 delegate:(id)a8 receiverBlock:(id)a9;
- (PHASEExternalInputStreamDefinition)definition;
- (void)setMute:(BOOL)a3;
- (void)unregisterMutedSpeechActivityNotification;
@end

@implementation PHASEExternalInputStream

- (PHASEExternalInputStream)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEExternalInputStream)initWithStreamGroupUUID:(id)a3 streamUUID:(id)a4 engine:(id)a5 streamDefinition:(id)a6 startsPaused:(BOOL)a7 delegate:(id)a8 receiverBlock:(id)a9
{
  BOOL v10 = a7;
  id v16 = a6;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)PHASEExternalInputStream;
  v18 = [(PHASEExternalStream *)&v23 initWithEngine:a5 streamGroupUUID:a3 streamUUID:a4 startsPaused:v10 delegate:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_definition, a6);
    v20 = _Block_copy(v17);
    id receiverBlock = v19->_receiverBlock;
    v19->_id receiverBlock = v20;
  }
  return v19;
}

+ (void)streamWithEngine:(id)a3 definition:(id)a4 startsPaused:(BOOL)a5 delegate:(id)a6 receiverBlock:(id)a7 callback:(id)a8
{
  BOOL v11 = a5;
  id v18 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = +[PHASEExternalStream newUUID];
  +[PHASEExternalInputStream streamWithEngine:v18 uuid:v17 definition:v13 startsPaused:v11 delegate:v14 receiverBlock:v15 callback:v16];
}

+ (void)streamWithEngine:(id)a3 uuid:(id)a4 definition:(id)a5 startsPaused:(BOOL)a6 delegate:(id)a7 receiverBlock:(id)a8 callback:(id)a9
{
  BOOL v11 = a6;
  v87[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v61 = a4;
  id v15 = a5;
  id v59 = a7;
  id v60 = a8;
  id v16 = (void (**)(id, void, void *))a9;
  id val = v14;
  id v17 = [v15 format];
  uint64_t v18 = [v17 commonFormat];

  if (v18 != 1)
  {
    uint64_t v24 = *MEMORY[0x263F08320];
    uint64_t v86 = *MEMORY[0x263F08320];
    v25 = NSString;
    v26 = [v15 format];
    v27 = [v25 stringWithFormat:@"Can only create stream with float32 common format, not provided common format %lu", objc_msgSend(v26, "commonFormat")];
    v87[0] = v27;
    id v28 = [NSDictionary dictionaryWithObjects:v87 forKeys:&v86 count:1];

    v30 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v29)
                                                                                        + 432)));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = [v28 objectForKeyedSubscript:v24];
      *(_DWORD *)buf = 136315650;
      v73 = "PHASEExternalStream.mm";
      __int16 v74 = 1024;
      int v75 = 1365;
      __int16 v76 = 2080;
      uint64_t v77 = [v31 UTF8String];
      _os_log_impl(&dword_221E5E000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    goto LABEL_7;
  }
  v19 = [v15 format];
  v20 = [v19 channelLayout];
  if (v20)
  {
    v21 = [v15 format];
    v22 = [v21 channelLayout];
    int v23 = [v22 layoutTag];

    if (v23) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v33 = [v15 format];
  if ([v33 channelCount] != 1)
  {
    v34 = [v15 format];
    int v35 = [v34 channelCount];

    if (v35 == 2) {
      goto LABEL_12;
    }
    uint64_t v52 = *MEMORY[0x263F08320];
    uint64_t v84 = *MEMORY[0x263F08320];
    v53 = NSString;
    v54 = [v15 format];
    v55 = objc_msgSend(v53, "stringWithFormat:", @"Cannot synthesize audio channel layout with channel count %d. Please provide non-nil channel layout as part of stream definition's format.", objc_msgSend(v54, "channelCount"));
    v85 = v55;
    id v28 = [NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];

    v30 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v56)
                                                                                        + 432)));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v57 = [v28 objectForKeyedSubscript:v52];
      *(_DWORD *)buf = 136315650;
      v73 = "PHASEExternalStream.mm";
      __int16 v74 = 1024;
      int v75 = 1392;
      __int16 v76 = 2080;
      uint64_t v77 = [v57 UTF8String];
      _os_log_impl(&dword_221E5E000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
LABEL_7:

    v32 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346922849 userInfo:v28];
    v16[2](v16, 0, v32);

    goto LABEL_19;
  }

LABEL_12:
  v36 = [v15 format];
  if ([v36 channelCount] == 1) {
    uint64_t v37 = 6553601;
  }
  else {
    uint64_t v37 = 6619138;
  }

  id v38 = objc_alloc(MEMORY[0x263EF9388]);
  v39 = [v15 format];
  [v39 sampleRate];
  double v41 = v40;
  v42 = (void *)[objc_alloc(MEMORY[0x263EF9328]) initWithLayoutTag:v37];
  v43 = (void *)[v38 initStandardFormatWithSampleRate:v42 channelLayout:v41];
  [v15 setFormat:v43];

LABEL_16:
  v44 = [MEMORY[0x263F08C38] UUID];
  v45 = (Phase::Logger *)[v14 implementation];
  uint64_t v46 = *((void *)v45 + 52);
  v47 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v45)
                                                                                      + 432)));
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    id v48 = [v15 description];
    uint64_t v49 = [v48 UTF8String];
    v50 = [v61 UUIDString];
    v51 = [v44 UUIDString];
    *(_DWORD *)buf = 136316418;
    v73 = "PHASEExternalStream.mm";
    __int16 v74 = 1024;
    int v75 = 1404;
    __int16 v76 = 2080;
    uint64_t v77 = v49;
    __int16 v78 = 2112;
    v79 = v50;
    __int16 v80 = 2112;
    v81 = v51;
    __int16 v82 = 1024;
    BOOL v83 = v11;
    _os_log_impl(&dword_221E5E000, v47, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating external input stream: %s, uuid [%@, %@], startsPaused %d", buf, 0x36u);
  }
  objc_initWeak((id *)buf, val);
  objc_initWeak(&location, v59);
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __106__PHASEExternalInputStream_streamWithEngine_uuid_definition_startsPaused_delegate_receiverBlock_callback___block_invoke;
  v62[3] = &unk_2645F7820;
  objc_copyWeak(&v68, (id *)buf);
  objc_copyWeak(&v69, &location);
  v66 = v16;
  id v63 = v61;
  id v28 = v44;
  id v64 = v28;
  id v65 = v15;
  BOOL v70 = v11;
  id v67 = v60;
  (*(void (**)(uint64_t, id, id, id, BOOL, id, void *))(*(void *)v46 + 24))(v46, v63, v28, v65, v11, v67, v62);

  objc_destroyWeak(&v69);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
LABEL_19:
}

void __106__PHASEExternalInputStream_streamWithEngine_uuid_definition_startsPaused_delegate_receiverBlock_callback___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = objc_loadWeakRetained((id *)(a1 + 80));
  v6 = v5;
  if (WeakRetained && v5)
  {
    if (v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      v7 = v3;
    }
    else
    {
      v12 = [[PHASEExternalInputStream alloc] initWithStreamGroupUUID:*(void *)(a1 + 32) streamUUID:*(void *)(a1 + 40) engine:WeakRetained streamDefinition:*(void *)(a1 + 48) startsPaused:*(unsigned __int8 *)(a1 + 88) delegate:v5 receiverBlock:*(void *)(a1 + 64)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      v7 = 0;
    }
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F08320];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"engine and/or delegate has been de-allocated";
    v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    BOOL v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(Phase::Logger *)v9 objectForKeyedSubscript:v8];
      *(_DWORD *)buf = 136315650;
      id v14 = "PHASEExternalStream.mm";
      __int16 v15 = 1024;
      int v16 = 1417;
      __int16 v17 = 2080;
      uint64_t v18 = [v11 UTF8String];
      _os_log_impl(&dword_221E5E000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920806 userInfo:v9];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)setMute:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_mute != a3)
  {
    BOOL v3 = a3;
    id v5 = [(PHASEExternalStream *)self engine];
    v6 = v5;
    if (v5)
    {
      uint64_t v7 = *(void *)([v5 implementation] + 416);
      uint64_t v8 = [(PHASEExternalStream *)self uuid];
      v9 = [(PHASEExternalStream *)self streamUUID];
      (*(void (**)(uint64_t, void *, void *, BOOL))(*(void *)v7 + 64))(v7, v8, v9, v3);

      self->_mute = v3;
    }
    else
    {
      BOOL v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(0)
                                                                                          + 432)));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [(PHASEExternalStream *)self uuid];
        int v12 = 136315650;
        id v13 = "PHASEExternalStream.mm";
        __int16 v14 = 1024;
        int v15 = 1450;
        __int16 v16 = 2112;
        __int16 v17 = v11;
        _os_log_impl(&dword_221E5E000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Can't mute external input stream %@ with nil engine", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

- (BOOL)registerMutedSpeechActivityNotification:(id)a3 outError:(id *)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v7 = [(PHASEExternalStream *)self engine];
  if (v7)
  {
    [(PHASEExternalInputStream *)self unregisterMutedSpeechActivityNotification];
    uint64_t v8 = *(void *)([v7 implementation] + 416);
    v9 = _Block_copy(v6);
    id mutedSpeechActivityNotificationBlock = self->_mutedSpeechActivityNotificationBlock;
    self->_id mutedSpeechActivityNotificationBlock = v9;

    id v11 = self->_mutedSpeechActivityNotificationBlock;
    if (v11)
    {
      objc_initWeak((id *)location, v11);
      int v12 = [(PHASEExternalStream *)self streamUUID];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __77__PHASEExternalInputStream_registerMutedSpeechActivityNotification_outError___block_invoke;
      v22[3] = &unk_2645F7898;
      objc_copyWeak(&v23, (id *)location);
      (*(void (**)(uint64_t, void *, void *))(*(void *)v8 + 72))(v8, v12, v22);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F08320];
    uint64_t v29 = *MEMORY[0x263F08320];
    __int16 v14 = NSString;
    int v15 = [(PHASEExternalStream *)self streamUUID];
    __int16 v16 = [v14 stringWithFormat:@"Can't register muted speech activity on external input stream %@ with nil engine", v15];
    v30[0] = v16;
    __int16 v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];

    uint64_t v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                        + 432)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v17 objectForKeyedSubscript:v13];
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "PHASEExternalStream.mm";
      __int16 v25 = 1024;
      int v26 = 1476;
      __int16 v27 = 2080;
      uint64_t v28 = [v20 UTF8String];
      _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", location, 0x1Cu);
    }
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346922849 userInfo:v17];
    }
  }
  return v7 != 0;
}

void __77__PHASEExternalInputStream_registerMutedSpeechActivityNotification_outError___block_invoke(uint64_t a1, _DWORD *a2)
{
  id WeakRetained = (void (**)(id, PHASEMutedSpeechActivityInfo *))objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v4 = objc_alloc_init(PHASEMutedSpeechActivityInfo);
    LODWORD(v5) = *a2;
    -[PHASEMutedSpeechActivityInfo setSpeechActivityHardValue:](v4, "setSpeechActivityHardValue:", *(float *)a2 != 0.0, v5);
    v6[2](v6, v4);

    id WeakRetained = v6;
  }
}

- (void)unregisterMutedSpeechActivityNotification
{
  BOOL v3 = [(PHASEExternalStream *)self engine];
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = *(void *)([v3 implementation] + 416);
    double v5 = [(PHASEExternalStream *)self streamUUID];
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 80))(v4, v5);

    BOOL v3 = v6;
  }
}

- (PHASEExternalInputStreamDefinition)definition
{
  return self->_definition;
}

- (BOOL)isMuted
{
  return self->_mute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong(&self->_mutedSpeechActivityNotificationBlock, 0);

  objc_storeStrong(&self->_receiverBlock, 0);
}

@end