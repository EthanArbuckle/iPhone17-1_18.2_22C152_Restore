@interface APCListenerEngine
+ (id)listenerWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 error:(id *)a6;
+ (id)listenerWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 resultData:(id)a6 error:(id *)a7;
- (APCListenerEngine)initWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 resultData:(id)a6 error:(id *)a7;
- (BOOL)validateInputNodeWithFormat:(id)a3;
- (id)createAU:(AudioComponentDescription *)a3;
- (void)createEngineAndAttachNodes;
- (void)makeEngineConnectionsWithError:(id *)a3;
- (void)setupAudioSession;
- (void)startEngineWithError:(id *)a3;
- (void)stopEngine;
@end

@implementation APCListenerEngine

- (id)createAU:(AudioComponentDescription *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  AudioComponentDescription v13 = *a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __30__APCListenerEngine_createAU___block_invoke;
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

void __30__APCListenerEngine_createAU___block_invoke(void *a1, void *a2, void *a3)
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

+ (id)listenerWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [[APCListenerEngine alloc] initWithCodecConfig:v9 queue:v10 dataReceivedHandler:v11 resultData:0 error:a6];

  return v12;
}

+ (id)listenerWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 resultData:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [[APCListenerEngine alloc] initWithCodecConfig:v11 queue:v12 dataReceivedHandler:v13 resultData:v14 error:a7];

  return v15;
}

- (APCListenerEngine)initWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 resultData:(id)a6 error:(id *)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v38.receiver = self;
  v38.super_class = (Class)APCListenerEngine;
  v17 = [(APCListenerEngine *)&v38 init];
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    if (v13)
    {
      objc_storeStrong((id *)&v17->_codecConfig, a3);
      +[AUPasscodeDecoder registerAU];
      +[AUPasscodeDecoder getAUDesc];
      uint64_t v19 = [p_isa createAU:v37];
      id v20 = p_isa[3];
      p_isa[3] = (id)v19;

      id v21 = p_isa[3];
      if (v21)
      {
        uint64_t v22 = [v21 AUAudioUnit];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v23 = [p_isa[3] AUAudioUnit];
          id v24 = p_isa[4];
          p_isa[4] = (id)v23;

          [p_isa[4] setCodecConfig:v13];
          dispatch_semaphore_t v25 = v14;
          if (!v14)
          {
            dispatch_semaphore_t v25 = dispatch_get_global_queue(0, 0);
          }
          [p_isa[4] setDispatchQueue:v25];
          if (!v14) {

          }
          [p_isa[4] setDataHandler:v15];
          [p_isa[4] setResultData:v16];
          uint64_t v26 = [p_isa[4] resultData];
          BOOL v27 = v26 == 0;

          if (!v27)
          {
            uint64_t v28 = [p_isa[4] resultData];
            [v28 reset];
          }
          [p_isa setupAudioSession];
          [p_isa createEngineAndAttachNodes];

          goto LABEL_12;
        }
        v33 = APCLogObject();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = (objc_class *)objc_opt_class();
          v35 = NSStringFromClass(v34);
          *(_DWORD *)buf = 138412290;
          v40 = v35;
          _os_log_impl(&dword_237D0E000, v33, OS_LOG_TYPE_ERROR, "Encoder AU is not the expected class, it's a %@", buf, 0xCu);
        }
        if (a7)
        {
          *a7 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioPasscodeDomain" code:0 userInfo:0];
        }

LABEL_27:
        v29 = 0;
        goto LABEL_28;
      }
      v32 = APCLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v32, OS_LOG_TYPE_ERROR, "Failed to create the decoder AU", buf, 2u);
      }

      if (!a7) {
        goto LABEL_27;
      }
      id v31 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioPasscodeDomain" code:0 userInfo:0];
    }
    else
    {
      v30 = APCLogObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v30, OS_LOG_TYPE_ERROR, "Bad arguments to APCListenerEngine", buf, 2u);
      }

      if (!a7) {
        goto LABEL_27;
      }
      id v31 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioPasscodeDomain" code:1 userInfo:0];
    }
    v29 = 0;
    *a7 = v31;
    goto LABEL_28;
  }
LABEL_12:
  v29 = p_isa;
LABEL_28:

  return v29;
}

- (void)setupAudioSession
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EF93E0] auxiliarySession];
  session = self->_session;
  self->_session = v2;

  v4 = self->_session;
  uint64_t v5 = *MEMORY[0x263EF9050];
  id v93 = 0;
  [(AVAudioSession *)v4 setCategory:v5 withOptions:41 error:&v93];
  id v6 = v93;
  if (v6)
  {
    uint64_t v7 = APCLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v96 = (unint64_t)v6;
      _os_log_impl(&dword_237D0E000, v7, OS_LOG_TYPE_ERROR, "Error setting session category to record: %@", buf, 0xCu);
    }
  }
  v8 = self->_session;
  id v92 = v6;
  [(AVAudioSession *)v8 preferDecoupledIO:1 error:&v92];
  id v9 = v92;

  if (v9)
  {
    id v10 = APCLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v96 = (unint64_t)v9;
      _os_log_impl(&dword_237D0E000, v10, OS_LOG_TYPE_ERROR, "Error setting preferDecoupledIO on session: %@", buf, 0xCu);
    }
  }
  [(AVAudioSession *)self->_session availableInputs];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v89;
    uint64_t v13 = *MEMORY[0x263EF91E0];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v89 != v12) {
          objc_enumerationMutation(obj);
        }
        v71 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        id v15 = [v71 portType];
        int v16 = [v15 isEqualToString:v13];

        if (v16)
        {
          v18 = self->_session;
          id v87 = v9;
          [(AVAudioSession *)v18 setPreferredInput:v71 error:&v87];
          id v17 = v87;

          if (v17)
          {
            uint64_t v19 = APCLogObject();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v96 = (unint64_t)v17;
              _os_log_impl(&dword_237D0E000, v19, OS_LOG_TYPE_ERROR, "Failed to set preferred input to built-in mic: %@", buf, 0xCu);
            }
          }
          else
          {
            v72 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v71 dataSources];
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            id v73 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = [v73 countByEnumeratingWithState:&v83 objects:v99 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v84;
              uint64_t v22 = *MEMORY[0x263EF9160];
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v84 != v21) {
                    objc_enumerationMutation(v73);
                  }
                  id v24 = *(void **)(*((void *)&v83 + 1) + 8 * j);
                  dispatch_semaphore_t v25 = APCLogObject();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v26 = [v24 location];
                    BOOL v27 = [v24 orientation];
                    *(_DWORD *)buf = 138412546;
                    unint64_t v96 = (unint64_t)v26;
                    __int16 v97 = 2112;
                    id v98 = v27;
                    _os_log_impl(&dword_237D0E000, v25, OS_LOG_TYPE_INFO, "Mic location/orientation is %@ %@", buf, 0x16u);
                  }
                  uint64_t v28 = [v24 orientation];
                  int v29 = [v28 isEqualToString:v22];

                  if (v29) {
                    [v72 addObject:v24];
                  }
                }
                uint64_t v20 = [v73 countByEnumeratingWithState:&v83 objects:v99 count:16];
              }
              while (v20);
            }

            if ([v72 count])
            {
              long long v81 = 0u;
              long long v82 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              v30 = v72;
              uint64_t v31 = [v30 countByEnumeratingWithState:&v79 objects:v94 count:16];
              if (v31)
              {
                uint64_t v32 = *(void *)v80;
                uint64_t v33 = *MEMORY[0x263EF90E0];
                while (2)
                {
                  for (uint64_t k = 0; k != v31; ++k)
                  {
                    if (*(void *)v80 != v32) {
                      objc_enumerationMutation(v30);
                    }
                    v35 = *(void **)(*((void *)&v79 + 1) + 8 * k);
                    v36 = [v35 location];
                    int v37 = [v36 isEqualToString:v33];

                    if (v37)
                    {
                      v44 = APCLogObject();
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                      {
                        v45 = [v35 location];
                        v46 = [v35 orientation];
                        *(_DWORD *)buf = 138412546;
                        unint64_t v96 = (unint64_t)v45;
                        __int16 v97 = 2112;
                        id v98 = v46;
                        _os_log_impl(&dword_237D0E000, v44, OS_LOG_TYPE_INFO, "Setting preferred microphone as '%@ %@'", buf, 0x16u);
                      }
                      id v78 = 0;
                      [v71 setPreferredDataSource:v35 error:&v78];
                      id v17 = v78;
                      if (v17)
                      {
                        v47 = APCLogObject();
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          unint64_t v96 = (unint64_t)v17;
                          _os_log_impl(&dword_237D0E000, v47, OS_LOG_TYPE_ERROR, "Failed to set preferred mic source: %@", buf, 0xCu);
                        }
                      }
                      goto LABEL_52;
                    }
                  }
                  uint64_t v31 = [v30 countByEnumeratingWithState:&v79 objects:v94 count:16];
                  if (v31) {
                    continue;
                  }
                  break;
                }
              }

              objc_super v38 = APCLogObject();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                v39 = [v30 objectAtIndexedSubscript:0];
                v40 = [v39 location];
                uint64_t v41 = [v30 objectAtIndexedSubscript:0];
                v42 = [v41 orientation];
                *(_DWORD *)buf = 138412546;
                unint64_t v96 = (unint64_t)v40;
                __int16 v97 = 2112;
                id v98 = v42;
                _os_log_impl(&dword_237D0E000, v38, OS_LOG_TYPE_INFO, "Choosing first available back microphone: '%@ %@'", buf, 0x16u);
              }
              v43 = [v30 objectAtIndexedSubscript:0];
              id v77 = 0;
              [v71 setPreferredDataSource:v43 error:&v77];
              id v17 = v77;

              if (v17)
              {
                v30 = APCLogObject();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  unint64_t v96 = (unint64_t)v17;
                  _os_log_impl(&dword_237D0E000, v30, OS_LOG_TYPE_ERROR, "Failed to set preferred mic source: %@", buf, 0xCu);
                }
LABEL_52:
              }
            }
            else
            {
              id v17 = 0;
            }

            uint64_t v19 = v72;
          }

          goto LABEL_56;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v17 = v9;
LABEL_56:

  v48 = self->_session;
  v49 = [(AUPasscodeDecoder *)self->_decoderAU codecConfig];
  id v76 = 0;
  -[AVAudioSession setPreferredSampleRate:error:](v48, "setPreferredSampleRate:error:", &v76, (double)[v49 sampleRate]);
  id v50 = v76;

  if (v50)
  {
    v51 = APCLogObject();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = [(AUPasscodeDecoder *)self->_decoderAU codecConfig];
      uint64_t v53 = [v52 sampleRate];
      *(_DWORD *)buf = 134218242;
      unint64_t v96 = llround((double)v53);
      __int16 v97 = 2112;
      id v98 = v50;
      _os_log_impl(&dword_237D0E000, v51, OS_LOG_TYPE_ERROR, "Error setting preferred sample rate to %ld: %@", buf, 0x16u);
    }
  }
  NSInteger v54 = [(AVAudioSession *)self->_session inputNumberOfChannels];
  v55 = [(AUPasscodeDecoder *)self->_decoderAU codecConfig];
  LOBYTE(v54) = v54 == [v55 numChannels];

  if (v54)
  {
    id v56 = v50;
  }
  else
  {
    v57 = self->_session;
    v58 = [(AUPasscodeDecoder *)self->_decoderAU codecConfig];
    id v75 = v50;
    -[AVAudioSession setPreferredInputNumberOfChannels:error:](v57, "setPreferredInputNumberOfChannels:error:", [v58 numChannels], &v75);
    id v56 = v75;

    if (v56)
    {
      v59 = APCLogObject();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v60 = [(AUPasscodeDecoder *)self->_decoderAU codecConfig];
        uint64_t v61 = [v60 numChannels];
        *(_DWORD *)buf = 134218242;
        unint64_t v96 = v61;
        __int16 v97 = 2112;
        id v98 = v56;
        _os_log_impl(&dword_237D0E000, v59, OS_LOG_TYPE_ERROR, "Couldn't set preferred number of input channels to %ld (AU will handle the mapping): %@", buf, 0x16u);
      }
    }
  }
  [(AVAudioSession *)self->_session sampleRate];
  v62 = self->_session;
  id v74 = v56;
  double v64 = 256.0 / v63;
  BOOL v65 = [(AVAudioSession *)v62 setPreferredIOBufferDuration:&v74 error:256.0 / v63];
  id v66 = v74;

  if (!v65)
  {
    v67 = APCLogObject();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v68 = [v66 localizedDescription];
      *(_DWORD *)buf = 134218242;
      unint64_t v96 = *(void *)&v64;
      __int16 v97 = 2112;
      id v98 = v68;
      _os_log_impl(&dword_237D0E000, v67, OS_LOG_TYPE_ERROR, "Error setting preferred io buffer duration to %0.3f seconds: %@", buf, 0x16u);
    }
  }
}

- (void)createEngineAndAttachNodes
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x263EF9360]);
  engine = self->_engine;
  self->_engine = v3;

  [(AVAudioEngine *)self->_engine attachNode:self->_decoderAUNode];
  int inData = [(AVAudioSession *)self->_session opaqueSessionID];
  uint64_t v5 = [(AVAudioEngine *)self->_engine inputNode];
  id v6 = (OpaqueAudioComponentInstance *)[v5 audioUnit];

  OSStatus v7 = AudioUnitSetProperty(v6, 0x7E7u, 0, 0, &inData, 4u);
  if (v7)
  {
    v8 = APCLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v11 = v7;
      _os_log_impl(&dword_237D0E000, v8, OS_LOG_TYPE_ERROR, "Setting the audio session ID for the listener's input node failed: %d", buf, 8u);
    }
  }
}

- (BOOL)validateInputNodeWithFormat:(id)a3
{
  id v3 = a3;
  v4 = v3;
  BOOL v6 = v3 && ([v3 sampleRate], v5 > 0.0) && objc_msgSend(v4, "channelCount") != 0;

  return v6;
}

- (void)makeEngineConnectionsWithError:(id *)a3
{
  [(AVAudioUnit *)self->_decoderAUNode removeTapOnBus:0];
  double v5 = [(AVAudioEngine *)self->_engine inputNode];
  id v9 = [v5 inputFormatForBus:0];

  if ([(APCListenerEngine *)self validateInputNodeWithFormat:v9])
  {
    engine = self->_engine;
    OSStatus v7 = [(AVAudioEngine *)engine inputNode];
    [(AVAudioEngine *)engine connect:v7 to:self->_decoderAUNode format:v9];

    [(AVAudioUnit *)self->_decoderAUNode installTapOnBus:0 bufferSize:0x2000 format:v9 block:&__block_literal_global_0];
    id v8 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-10868 userInfo:0];
  }
  *a3 = v8;
}

- (void)startEngineWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (![(AVAudioEngine *)self->_engine isRunning])
  {
    session = self->_session;
    id v20 = 0;
    BOOL v6 = [(AVAudioSession *)session setActive:1 error:&v20];
    id v7 = v20;
    if (v7) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v6;
    }
    if (v8)
    {
      id v19 = 0;
      [(APCListenerEngine *)self makeEngineConnectionsWithError:&v19];
      id v9 = v19;
      if (v9)
      {
        id v10 = v9;
        OSStatus v11 = APCLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v10;
          _os_log_impl(&dword_237D0E000, v11, OS_LOG_TYPE_ERROR, "Error making engine connection: %@", buf, 0xCu);
        }
      }
      else
      {
        [(AUPasscodeDecoder *)self->_decoderAU startAudioLogCapture];
        engine = self->_engine;
        id v18 = 0;
        BOOL v14 = [(AVAudioEngine *)engine startAndReturnError:&v18];
        id v15 = v18;
        if (v15) {
          BOOL v16 = 0;
        }
        else {
          BOOL v16 = v14;
        }
        if (v16)
        {
          id v10 = 0;
LABEL_15:

          return;
        }
        id v10 = v15;
        id v17 = APCLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v10;
          _os_log_impl(&dword_237D0E000, v17, OS_LOG_TYPE_ERROR, "Error starting engine: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v10 = v7;
      uint64_t v12 = APCLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v10;
        _os_log_impl(&dword_237D0E000, v12, OS_LOG_TYPE_ERROR, "Error activating session: %@", buf, 0xCu);
      }
    }
    if (a3)
    {
      id v10 = v10;
      *a3 = v10;
    }
    goto LABEL_15;
  }
}

- (void)stopEngine
{
  [(AVAudioEngine *)self->_engine stop];
  [(AUPasscodeDecoder *)self->_decoderAU stopAudioLogCapture];
  session = self->_session;

  [(AVAudioSession *)session setActive:0 error:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecConfig, 0);
  objc_storeStrong((id *)&self->_decoderAU, 0);
  objc_storeStrong((id *)&self->_decoderAUNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end