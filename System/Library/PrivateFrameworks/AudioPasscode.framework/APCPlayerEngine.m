@interface APCPlayerEngine
+ (id)playerWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 error:(id *)a6;
- (APCPlayerEmbedInfo)embeddingInfo;
- (APCPlayerEngine)initWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 error:(id *)a6;
- (BOOL)startEngine;
- (BOOL)startEngineAtTime:(unint64_t)a3;
- (BOOL)startEngineAtTime:(unint64_t)a3 withBeginning:(id)a4;
- (BOOL)startEngineAtTime:(unint64_t)a3 withBeginning:(id)a4 callbackTime:(unint64_t)a5;
- (OS_dispatch_queue)dispatchQueue;
- (float)evaluateAsset;
- (id)beginningCallback;
- (id)createAU:(AudioComponentDescription *)a3;
- (id)stopEngineCompletion;
- (void)_playbackBufferLoopCompletionHdlr;
- (void)_stopAudioEngineAndSession;
- (void)createEngineAndAttachNodes;
- (void)endPasscodeEmbedding;
- (void)makeEngineConnections;
- (void)setBeginningCallback:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEmbeddingInfo:(id)a3;
- (void)setStopEngineCompletion:(id)a3;
- (void)setupAudioSession;
- (void)startAPCPlayLoop;
- (void)startAPCPlayLoopAtTime:(unint64_t)a3;
- (void)stopEngine:(BOOL)a3 withCompletion:(id)a4;
- (void)stopEngineAfterMinimumLoops:(unint64_t)a3 withCompletion:(id)a4;
- (void)stopEngineWithFadeOut:(float)a3 completion:(id)a4;
@end

@implementation APCPlayerEngine

- (id)createAU:(AudioComponentDescription *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  AudioComponentDescription v13 = *a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __28__APCPlayerEngine_createAU___block_invoke;
  v12[3] = &unk_264CFE3F0;
  v12[4] = &v14;
  v12[5] = &v26;
  v12[6] = &v20;
  [MEMORY[0x263EF9438] instantiateWithComponentDescription:&v13 options:0 completionHandler:v12];
  v4 = v21[5];
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  intptr_t v6 = dispatch_semaphore_wait(v4, v5);
  if (v27[5] || v6)
  {
    v8 = APCLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v27[5];
      if (v9)
      {
        v10 = [(id)v27[5] localizedDescription];
      }
      else
      {
        v10 = @"AVAudioUnit instantiateWithComponentDescription timed out";
      }
      *(_DWORD *)buf = 138412290;
      v33 = v10;
      _os_log_impl(&dword_237D0E000, v8, OS_LOG_TYPE_ERROR, "AU instatiation failed with %@", buf, 0xCu);
      if (v9) {
    }
      }
    id v7 = 0;
  }
  else
  {
    id v7 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v7;
}

void __28__APCPlayerEngine_createAU___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

+ (id)playerWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [[APCPlayerEngine alloc] initWithAssetURL:v9 codecConfig:v10 payload:v11 error:a6];

  return v12;
}

- (APCPlayerEngine)initWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 error:(id *)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v51.receiver = self;
  v51.super_class = (Class)APCPlayerEngine;
  AudioComponentDescription v13 = [(APCPlayerEngine *)&v51 init];
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_37;
  }
  if (v10 && v11 && v12)
  {
    v13->_isRunning = 0;
    v13->_prePlayVolume = 0.5;
    +[AUPasscodeEncoder registerAU];
    +[AUPasscodeEncoder getAUDesc];
    uint64_t v15 = [(APCPlayerEngine *)v14 createAU:v50];
    encoderAUNode = v14->_encoderAUNode;
    v14->_encoderAUNode = (AVAudioUnit *)v15;

    v17 = v14->_encoderAUNode;
    if (v17)
    {
      v18 = [(AVAudioUnit *)v17 AUAudioUnit];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = APCLogObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          *(_DWORD *)buf = 138412290;
          id v53 = v32;
          _os_log_impl(&dword_237D0E000, v30, OS_LOG_TYPE_ERROR, "Encoder AU is not the expected class, it is a %@", buf, 0xCu);
        }
        if (a6)
        {
          *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioPasscodeDomain" code:0 userInfo:0];
        }

        goto LABEL_36;
      }
      uint64_t v19 = [(AVAudioUnit *)v14->_encoderAUNode AUAudioUnit];
      encoderAU = v14->_encoderAU;
      v14->_encoderAU = (AUPasscodeEncoder *)v19;

      id v49 = 0;
      v21 = (void *)[objc_alloc(MEMORY[0x263EF9380]) initForReading:v10 error:&v49];
      id v22 = v49;
      if (v22)
      {
        id v23 = v22;
        v24 = APCLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v23;
          _os_log_impl(&dword_237D0E000, v24, OS_LOG_TYPE_ERROR, "Failed to open the player asset: %@", buf, 0xCu);
        }

        if (a6)
        {
          id v23 = v23;
          *a6 = v23;
        }
        int v25 = 1;
      }
      else
      {
        id v33 = objc_alloc(MEMORY[0x263EF93B0]);
        uint64_t v34 = [v21 processingFormat];
        uint64_t v35 = objc_msgSend(v33, "initWithPCMFormat:frameCapacity:", v34, objc_msgSend(v21, "length"));
        assetBuffer = v14->_assetBuffer;
        v14->_assetBuffer = (AVAudioPCMBuffer *)v35;

        objc_msgSend(v11, "setPayloadLengthBytes:", objc_msgSend(v12, "length"));
        v37 = [v21 processingFormat];
        [v37 sampleRate];
        [v11 setSampleRate:(uint64_t)v38];

        [(AUPasscodeEncoder *)v14->_encoderAU setPayload:v12];
        [(AUPasscodeEncoder *)v14->_encoderAU setCodecConfig:v11];
        -[AUPasscodeEncoder setAssetLength:](v14->_encoderAU, "setAssetLength:", [v21 length]);
        objc_initWeak(&location, v14);
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __62__APCPlayerEngine_initWithAssetURL_codecConfig_payload_error___block_invoke;
        v46[3] = &unk_264CFE418;
        objc_copyWeak(&v47, &location);
        [(AUPasscodeEncoder *)v14->_encoderAU setAssetEndedAndSilencedHandler:v46];
        v39 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x263EF93C8]);
        player = v14->_player;
        v14->_player = v39;

        v41 = v14->_assetBuffer;
        id v45 = 0;
        [v21 readIntoBuffer:v41 error:&v45];
        id v23 = v45;
        if (v23)
        {
          v42 = APCLogObject();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v23;
            _os_log_impl(&dword_237D0E000, v42, OS_LOG_TYPE_ERROR, "Failed to read the asset file into the PCM buffer (Error=%@)", buf, 0xCu);
          }

          if (a6) {
            *a6 = v23;
          }
          int v25 = 1;
        }
        else
        {
          [(APCPlayerEngine *)v14 setupAudioSession];
          [(APCPlayerEngine *)v14 createEngineAndAttachNodes];
          [(APCPlayerEngine *)v14 makeEngineConnections];
          callbackDispatchSrc = v14->_callbackDispatchSrc;
          v14->_callbackDispatchSrc = 0;

          int v25 = 0;
        }
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location);
      }

      if (v25)
      {
LABEL_36:
        v29 = 0;
        goto LABEL_38;
      }
LABEL_37:
      v29 = v14;
      goto LABEL_38;
    }
    uint64_t v28 = APCLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237D0E000, v28, OS_LOG_TYPE_ERROR, "Failed to create the encoder AU", buf, 2u);
    }

    if (!a6) {
      goto LABEL_36;
    }
    id v27 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioPasscodeDomain" code:0 userInfo:0];
  }
  else
  {
    uint64_t v26 = APCLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237D0E000, v26, OS_LOG_TYPE_ERROR, "Bad arguments to APCPlayerEngine", buf, 2u);
    }

    if (!a6) {
      goto LABEL_36;
    }
    id v27 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioPasscodeDomain" code:1 userInfo:0];
  }
  v29 = 0;
  *a6 = v27;
LABEL_38:

  return v29;
}

void __62__APCPlayerEngine_initWithAssetURL_codecConfig_payload_error___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopAudioEngineAndSession];

  id v5 = objc_loadWeakRetained(v1);
  v2 = [v5 stopEngineCompletion];

  if (v2)
  {
    id v6 = objc_loadWeakRetained(v1);
    v3 = [v6 stopEngineCompletion];
    v3[2]();
  }
}

- (void)setupAudioSession
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EF93E0] auxiliarySession];
  session = self->_session;
  self->_session = v3;

  id v5 = self->_session;
  uint64_t v6 = *MEMORY[0x263EF9060];
  id v38 = 0;
  [(AVAudioSession *)v5 setCategory:v6 error:&v38];
  id v7 = v38;
  if (v7)
  {
    v8 = APCLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v40 = (unint64_t)v7;
      _os_log_impl(&dword_237D0E000, v8, OS_LOG_TYPE_ERROR, "Error setting session category to record: %@", buf, 0xCu);
    }
  }
  id v9 = self->_session;
  uint64_t v10 = *MEMORY[0x263EF9108];
  id v37 = 0;
  [(AVAudioSession *)v9 setMode:v10 error:&v37];
  id v11 = v37;
  if (v11)
  {
    id v12 = APCLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v40 = (unint64_t)v11;
      _os_log_impl(&dword_237D0E000, v12, OS_LOG_TYPE_ERROR, "Error setting session mode to default: %@", buf, 0xCu);
    }
  }
  AudioComponentDescription v13 = self->_session;
  uint64_t v14 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
  id v36 = 0;
  -[AVAudioSession setPreferredSampleRate:error:](v13, "setPreferredSampleRate:error:", &v36, (double)[v14 sampleRate]);
  id v15 = v36;

  if (v15)
  {
    uint64_t v16 = APCLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
      uint64_t v18 = [v17 sampleRate];
      *(_DWORD *)buf = 134218242;
      unint64_t v40 = llround((double)v18);
      __int16 v41 = 2112;
      id v42 = v15;
      _os_log_impl(&dword_237D0E000, v16, OS_LOG_TYPE_ERROR, "Error setting preferred sample rate to %ld: %@", buf, 0x16u);
    }
  }
  NSInteger v19 = [(AVAudioSession *)self->_session outputNumberOfChannels];
  uint64_t v20 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
  LOBYTE(v19) = v19 == [v20 numChannels];

  if (v19)
  {
    id v21 = v15;
  }
  else
  {
    id v22 = self->_session;
    id v23 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
    id v35 = v15;
    -[AVAudioSession setPreferredOutputNumberOfChannels:error:](v22, "setPreferredOutputNumberOfChannels:error:", [v23 numChannels], &v35);
    id v21 = v35;

    if (v21)
    {
      v24 = APCLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
        uint64_t v26 = [v25 numChannels];
        *(_DWORD *)buf = 134218242;
        unint64_t v40 = v26;
        __int16 v41 = 2112;
        id v42 = v21;
        _os_log_impl(&dword_237D0E000, v24, OS_LOG_TYPE_ERROR, "Could not set preferred number of output channels to %ld (AU will handle the mapping): %@", buf, 0x16u);
      }
    }
  }
  [(AVAudioSession *)self->_session sampleRate];
  id v27 = self->_session;
  id v34 = v21;
  double v29 = 256.0 / v28;
  BOOL v30 = [(AVAudioSession *)v27 setPreferredIOBufferDuration:&v34 error:256.0 / v28];
  id v31 = v34;

  if (!v30)
  {
    v32 = APCLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = [v31 localizedDescription];
      *(_DWORD *)buf = 134218242;
      unint64_t v40 = *(void *)&v29;
      __int16 v41 = 2112;
      id v42 = v33;
      _os_log_impl(&dword_237D0E000, v32, OS_LOG_TYPE_ERROR, "Error setting preferred io buffer duration to %0.3f seconds: %@", buf, 0x16u);
    }
  }
}

- (void)createEngineAndAttachNodes
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x263EF9360]);
  engine = self->_engine;
  self->_engine = v3;

  [(AVAudioEngine *)self->_engine attachNode:self->_encoderAUNode];
  [(AVAudioEngine *)self->_engine attachNode:self->_player];
  id v5 = [(AVAudioEngine *)self->_engine outputNode];
  uint64_t v6 = (OpaqueAudioComponentInstance *)[v5 audioUnit];

  int inData = [(AVAudioSession *)self->_session opaqueSessionID];
  OSStatus v7 = AudioUnitSetProperty(v6, 0x7E7u, 0, 0, &inData, 4u);
  if (v7)
  {
    v8 = APCLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v11 = v7;
      _os_log_impl(&dword_237D0E000, v8, OS_LOG_TYPE_ERROR, "Setting the audio session ID for the player's output node failed: %d", buf, 8u);
    }
  }
}

- (void)makeEngineConnections
{
  id v6 = [(AVAudioPCMBuffer *)self->_assetBuffer format];
  -[AVAudioEngine connect:to:format:](self->_engine, "connect:to:format:", self->_player, self->_encoderAUNode);
  engine = self->_engine;
  encoderAUNode = self->_encoderAUNode;
  id v5 = [(AVAudioEngine *)engine outputNode];
  [(AVAudioEngine *)engine connect:encoderAUNode to:v5 format:v6];
}

- (float)evaluateAsset
{
  v3 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
  assetBuffer = self->_assetBuffer;
  id v20 = 0;
  +[APCCodecFactory evaluateCarrierWithConfig:v3 carrier:assetBuffer embeddingResult:&v20];
  float v6 = v5;
  id v7 = v20;

  if (v7)
  {
    v8 = [(AVAudioUnit *)self->_encoderAUNode AUAudioUnit];
    [v8 setPasscodeEmbedInfo:v7];
    id v9 = [NSNumber numberWithInt:108];
    uint64_t v10 = [v7 objectForKey:v9];
    uint64_t v11 = [v10 unsignedIntegerValue];

    uint64_t v12 = [NSNumber numberWithInt:1000];
    AudioComponentDescription v13 = [v7 objectForKey:v12];
    uint64_t v14 = [v13 unsignedIntegerValue];

    id v15 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
    uint64_t v16 = [v15 sampleRate];

    v17 = [[APCPlayerEmbedInfo alloc] initWithPasscodeDurationNSec:(unint64_t)((double)(unint64_t)(v14 + v11) / (double)v16 * 1000000000.0)];
    embeddingInfo = self->_embeddingInfo;
    self->_embeddingInfo = v17;
  }
  return v6;
}

- (BOOL)startEngine
{
  return [(APCPlayerEngine *)self startEngineAtTime:0 withBeginning:0];
}

- (BOOL)startEngineAtTime:(unint64_t)a3
{
  return [(APCPlayerEngine *)self startEngineAtTime:a3 withBeginning:0];
}

- (BOOL)startEngineAtTime:(unint64_t)a3 withBeginning:(id)a4
{
  return [(APCPlayerEngine *)self startEngineAtTime:a3 withBeginning:0 callbackTime:300];
}

- (BOOL)startEngineAtTime:(unint64_t)a3 withBeginning:(id)a4 callbackTime:(unint64_t)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a4;
  engine = self->_engine;
  if (!engine)
  {
    uint64_t v10 = APCLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Audio engine is nil while trying to start it!";
LABEL_9:
      _os_log_impl(&dword_237D0E000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    }
LABEL_10:
    char v9 = 0;
LABEL_45:

    goto LABEL_46;
  }
  if (!self->_player)
  {
    uint64_t v10 = APCLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Encoded asset player is nil while trying to start the audio engine!";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (![(AVAudioEngine *)engine isRunning])
  {
    session = self->_session;
    id v44 = 0;
    char v9 = [(AVAudioSession *)session setActive:1 error:&v44];
    AudioComponentDescription v13 = v44;
    if (v13) {
      char v14 = 0;
    }
    else {
      char v14 = v9;
    }
    if ((v14 & 1) == 0)
    {
      uint64_t v10 = v13;
      id v15 = APCLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v46 = (unint64_t)v10;
        _os_log_impl(&dword_237D0E000, v15, OS_LOG_TYPE_ERROR, "Error activating session: %@", buf, 0xCu);
      }
      goto LABEL_44;
    }
    id v15 = [MEMORY[0x263F544E0] sharedAVSystemController];
    [v15 getActiveCategoryVolume:&self->_prePlayVolume andName:0];
    +[APCDefaults floatForDefault:0];
    -[NSObject setActiveCategoryVolumeTo:](v15, "setActiveCategoryVolumeTo:");
    uint64_t v16 = self->_engine;
    id v43 = 0;
    char v9 = [(AVAudioEngine *)v16 startAndReturnError:&v43];
    uint64_t v10 = v43;
    if (v10) {
      char v17 = 0;
    }
    else {
      char v17 = v9;
    }
    if ((v17 & 1) == 0)
    {
      id v22 = APCLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [v10 localizedDescription];
        *(_DWORD *)buf = 138412290;
        unint64_t v46 = (unint64_t)v26;
        _os_log_impl(&dword_237D0E000, v22, OS_LOG_TYPE_ERROR, "Couldn't start audio engine, %@", buf, 0xCu);
      }
      goto LABEL_43;
    }
    if (v7)
    {
      uint64_t v18 = __udivti3();
      uint64_t v19 = mach_absolute_time();
      uint64_t v20 = v19;
      if (a3 && v19 + v18 > a3)
      {
        id v21 = APCLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_237D0E000, v21, OS_LOG_TYPE_ERROR, "APCPlayer start time is too early to set up a beginning callback", buf, 2u);
        }

        id v22 = APCLogObject();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = 134218496;
        unint64_t v46 = a3;
        __int16 v47 = 2048;
        uint64_t v48 = v20;
        __int16 v49 = 2048;
        uint64_t v50 = v20 + v18;
        id v23 = "- Input hostTime: %llu, Current Time: %llu, Min expected Time: %llu";
        v24 = v22;
        uint32_t v25 = 32;
        goto LABEL_41;
      }
      uint64_t v27 = __udivti3();
      if (a3 - v18 >= v20) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = -v27;
      }
      double v29 = [(APCPlayerEngine *)self dispatchQueue];
      if (v29) {
        [(APCPlayerEngine *)self dispatchQueue];
      }
      else {
      BOOL v30 = dispatch_get_global_queue(0, 0);
      }
      id v31 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v30);
      callbackDispatchSrc = self->_callbackDispatchSrc;
      self->_callbackDispatchSrc = v31;

      if (!self->_callbackDispatchSrc)
      {
        id v22 = APCLogObject();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
LABEL_42:
          char v9 = 0;
LABEL_43:

          goto LABEL_44;
        }
        *(_WORD *)buf = 0;
        id v23 = "APCPlayer can't schedule the beginning callback timer";
        v24 = v22;
        uint32_t v25 = 2;
LABEL_41:
        _os_log_impl(&dword_237D0E000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
        goto LABEL_42;
      }
      id v33 = (void *)MEMORY[0x237E2DE80](v7);
      id beginningCallback = self->_beginningCallback;
      self->_id beginningCallback = v33;

      id v35 = self->_callbackDispatchSrc;
      dispatch_time_t v36 = dispatch_time(0, v28 & ~(v28 >> 63));
      int64_t v37 = [(AUPasscodeEncoder *)self->_encoderAU assetLength];
      id v38 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
      dispatch_source_set_timer(v35, v36, 1000000000 * v37 / (unint64_t)[v38 sampleRate], 0);

      v39 = self->_callbackDispatchSrc;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __64__APCPlayerEngine_startEngineAtTime_withBeginning_callbackTime___block_invoke;
      handler[3] = &unk_264CFE440;
      id v42 = v7;
      dispatch_source_set_event_handler(v39, handler);
      dispatch_resume((dispatch_object_t)self->_callbackDispatchSrc);
    }
    [(APCPlayerEngine *)self startAPCPlayLoopAtTime:a3];
    [(AVAudioPlayerNode *)self->_player play];
    char v9 = 1;
LABEL_44:

    goto LABEL_45;
  }
  char v9 = 1;
LABEL_46:

  return v9;
}

uint64_t __64__APCPlayerEngine_startEngineAtTime_withBeginning_callbackTime___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_playbackBufferLoopCompletionHdlr
{
  if (self->_requestingStop)
  {
    [(APCPlayerEngine *)self _stopAudioEngineAndSession];
    self->_requestingStop = 0;
    if (self->_stopEngineCompletion)
    {
      v3 = [(APCPlayerEngine *)self dispatchQueue];
      if (v3) {
        [(APCPlayerEngine *)self dispatchQueue];
      }
      else {
      v4 = dispatch_get_global_queue(0, 0);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__APCPlayerEngine__playbackBufferLoopCompletionHdlr__block_invoke;
      block[3] = &unk_264CFE468;
      block[4] = self;
      dispatch_async(v4, block);
    }
  }
  else
  {
    [(APCPlayerEngine *)self startAPCPlayLoop];
  }
}

uint64_t __52__APCPlayerEngine__playbackBufferLoopCompletionHdlr__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 104) + 16))();
}

- (void)startAPCPlayLoop
{
}

- (void)startAPCPlayLoopAtTime:(unint64_t)a3
{
  v3 = (void *)a3;
  if (a3) {
    v3 = (void *)[objc_alloc(MEMORY[0x263EF9430]) initWithHostTime:a3];
  }
  player = self->_player;
  assetBuffer = self->_assetBuffer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__APCPlayerEngine_startAPCPlayLoopAtTime___block_invoke;
  v7[3] = &unk_264CFE468;
  v7[4] = self;
  [(AVAudioPlayerNode *)player scheduleBuffer:assetBuffer atTime:v3 options:4 completionHandler:v7];
}

void __42__APCPlayerEngine_startAPCPlayLoopAtTime___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dispatchQueue];
  if (v2)
  {
    v3 = [*(id *)(a1 + 32) dispatchQueue];
  }
  else
  {
    v3 = MEMORY[0x263EF83A0];
    id v4 = MEMORY[0x263EF83A0];
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__APCPlayerEngine_startAPCPlayLoopAtTime___block_invoke_2;
  block[3] = &unk_264CFE468;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

uint64_t __42__APCPlayerEngine_startAPCPlayLoopAtTime___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playbackBufferLoopCompletionHdlr];
}

- (void)_stopAudioEngineAndSession
{
  [(AVAudioPlayerNode *)self->_player pause];
  [(AVAudioEngine *)self->_engine pause];
  [(AUPasscodeEncoder *)self->_encoderAU reset];
  [(AVAudioPlayerNode *)self->_player reset];
  v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
  *(float *)&double v4 = self->_prePlayVolume;
  id v5 = v3;
  [v3 setActiveCategoryVolumeTo:v4];
  [(AVAudioSession *)self->_session setActive:0 error:0];
}

- (void)endPasscodeEmbedding
{
  if ([(AVAudioEngine *)self->_engine isRunning])
  {
    encoderAU = self->_encoderAU;
    [(AUPasscodeEncoder *)encoderAU setEmbedPasscode:0];
  }
}

- (void)stopEngine:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if (v4) {
    self->_requestingStop = 1;
  }
  else {
    [(AUPasscodeEncoder *)self->_encoderAU setSilenceOutputOnNextAssetEnding:1];
  }
  float v6 = (void *)MEMORY[0x237E2DE80](v10);
  id stopEngineCompletion = self->_stopEngineCompletion;
  self->_id stopEngineCompletion = v6;

  callbackDispatchSrc = self->_callbackDispatchSrc;
  if (callbackDispatchSrc)
  {
    dispatch_source_cancel(callbackDispatchSrc);
    char v9 = self->_callbackDispatchSrc;
    self->_callbackDispatchSrc = 0;
  }
}

- (void)stopEngineWithFadeOut:(float)a3 completion:(id)a4
{
  float v6 = (void *)MEMORY[0x237E2DE80](a4, a2);
  id stopEngineCompletion = self->_stopEngineCompletion;
  self->_id stopEngineCompletion = v6;

  if ([(AVAudioEngine *)self->_engine isRunning])
  {
    *(float *)&double v8 = a3;
    [(AUPasscodeEncoder *)self->_encoderAU setFadeOutTimeSeconds:v8];
    [(AUPasscodeEncoder *)self->_encoderAU setTriggerFadeOut:1];
  }
  else if (self->_stopEngineCompletion)
  {
    char v9 = [(APCPlayerEngine *)self dispatchQueue];
    if (v9) {
      [(APCPlayerEngine *)self dispatchQueue];
    }
    else {
    id v10 = dispatch_get_global_queue(0, 0);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__APCPlayerEngine_stopEngineWithFadeOut_completion___block_invoke;
    block[3] = &unk_264CFE468;
    block[4] = self;
    dispatch_async(v10, block);
  }
  callbackDispatchSrc = self->_callbackDispatchSrc;
  if (callbackDispatchSrc)
  {
    dispatch_source_cancel(callbackDispatchSrc);
    uint64_t v12 = self->_callbackDispatchSrc;
    self->_callbackDispatchSrc = 0;
  }
}

uint64_t __52__APCPlayerEngine_stopEngineWithFadeOut_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 104) + 16))();
}

- (void)stopEngineAfterMinimumLoops:(unint64_t)a3 withCompletion:(id)a4
{
  float v6 = (void *)MEMORY[0x237E2DE80](a4, a2);
  id stopEngineCompletion = self->_stopEngineCompletion;
  self->_id stopEngineCompletion = v6;

  if ([(AVAudioEngine *)self->_engine isRunning])
  {
    [(AUPasscodeEncoder *)self->_encoderAU setNumLoopsToStopAfter:a3];
  }
  else if (self->_stopEngineCompletion)
  {
    double v8 = [(APCPlayerEngine *)self dispatchQueue];
    if (v8) {
      [(APCPlayerEngine *)self dispatchQueue];
    }
    else {
    char v9 = dispatch_get_global_queue(0, 0);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__APCPlayerEngine_stopEngineAfterMinimumLoops_withCompletion___block_invoke;
    block[3] = &unk_264CFE468;
    block[4] = self;
    dispatch_async(v9, block);
  }
  callbackDispatchSrc = self->_callbackDispatchSrc;
  if (callbackDispatchSrc)
  {
    dispatch_source_cancel(callbackDispatchSrc);
    uint64_t v11 = self->_callbackDispatchSrc;
    self->_callbackDispatchSrc = 0;
  }
}

uint64_t __62__APCPlayerEngine_stopEngineAfterMinimumLoops_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 104) + 16))();
}

- (void)setDispatchQueue:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
  encoderAU = self->_encoderAU;
  if (encoderAU) {
    [(AUPasscodeEncoder *)encoderAU setDispatchQueue:v6];
  }
}

- (APCPlayerEmbedInfo)embeddingInfo
{
  if (self->_embeddingInfo)
  {
    v3 = [(AVAudioUnit *)self->_encoderAUNode AUAudioUnit];
    BOOL v4 = [v3 passcodeEmbedInfo];
    id v5 = [NSNumber numberWithInt:1001];
    id v6 = [v4 objectForKey:v5];
    uint64_t v7 = [v6 unsignedIntegerValue];

    [(APCPlayerEmbedInfo *)self->_embeddingInfo setMeasPasscodeDuration:v7];
    embeddingInfo = self->_embeddingInfo;
  }
  else
  {
    embeddingInfo = 0;
  }

  return embeddingInfo;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setEmbeddingInfo:(id)a3
{
}

- (id)beginningCallback
{
  return self->_beginningCallback;
}

- (void)setBeginningCallback:(id)a3
{
}

- (id)stopEngineCompletion
{
  return self->_stopEngineCompletion;
}

- (void)setStopEngineCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopEngineCompletion, 0);
  objc_storeStrong(&self->_beginningCallback, 0);
  objc_storeStrong((id *)&self->_embeddingInfo, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackDispatchSrc, 0);
  objc_storeStrong((id *)&self->_assetBuffer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_encoderAU, 0);
  objc_storeStrong((id *)&self->_encoderAUNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end