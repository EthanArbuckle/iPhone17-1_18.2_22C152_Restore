@interface MPCSingleTrackAudioProcessor
- (BOOL)configureQueueItem:(id)a3;
- (BOOL)shouldAttachAudioTapToItem:(id)a3;
- (MPCPlaybackEngine)playbackEngine;
- (MPCSingleTrackAudioProcessing)selfRef;
- (MPCSingleTrackAudioProcessor)initWithPlaybackEngine:(id)a3;
- (opaqueMTAudioProcessingTap)audioProcessingTap;
- (unsigned)creationFlags;
- (void)_createAudioTap;
- (void)_destroyAudioTap;
- (void)dealloc;
- (void)finalizeTap:(opaqueMTAudioProcessingTap *)a3;
- (void)recreateAudioTap;
- (void)setSelfRef:(id)a3;
@end

@implementation MPCSingleTrackAudioProcessor

- (MPCSingleTrackAudioProcessor)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCSingleTrackAudioProcessor;
  v5 = [(MPCSingleTrackAudioProcessor *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
  }

  return v6;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playbackEngine);

  objc_storeStrong((id *)&self->_selfRef, 0);
}

- (void)setSelfRef:(id)a3
{
}

- (MPCSingleTrackAudioProcessing)selfRef
{
  return self->_selfRef;
}

- (void)_destroyAudioTap
{
  audioProcessingTap = self->_audioProcessingTap;
  if (audioProcessingTap)
  {
    CFRelease(audioProcessingTap);
    self->_audioProcessingTap = 0;
  }
}

- (void)_createAudioTap
{
  v22[1] = *MEMORY[0x263EF8340];
  callbacks.version = 0;
  callbacks.clientInfo = self;
  callbacks.init = (MTAudioProcessingTapInitCallback)_MPCAudioTapInit_30222;
  callbacks.finalize = (MTAudioProcessingTapFinalizeCallback)_MPCAudioTapFinalize_30221;
  callbacks.prepare = (MTAudioProcessingTapPrepareCallback)_MPCAudioTapPrepareCallback_30220;
  callbacks.process = (MTAudioProcessingTapProcessCallback)_MPCAudioTapProcess_30215;
  callbacks.unprepare = (MTAudioProcessingTapUnprepareCallback)_MPCAudioTapUnprepareCallback_30214;
  MTAudioProcessingTapCreationFlags v3 = [(MPCSingleTrackAudioProcessor *)self creationFlags];
  MTAudioProcessingTapRef tapOut = 0;
  OSStatus v4 = MTAudioProcessingTapCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &callbacks, v3, &tapOut);
  if (!v4) {
    goto LABEL_24;
  }
  OSStatus v5 = v4;
  v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08410];
  uint64_t v8 = v4;
  uint64_t v21 = *MEMORY[0x263F08320];
  memset(v20, 0, 20);
  __darwin_ct_rune_t v9 = bswap32(v4);
  *(__darwin_ct_rune_t *)((char *)v20 + 1) = v9;
  uint64_t v10 = MEMORY[0x263EF8318];
  if ((v9 & 0x80) != 0)
  {
    if (!__maskrune((char)v9, 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v9 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  unsigned int v11 = (__int16)v9 >> 8;
  if ((v9 & 0x8000) != 0)
  {
    if (!__maskrune(v11, 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(v10 + 4 * v11 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SHIBYTE(v20[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v20[0]), 0x40000uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(v10 + 4 * SHIBYTE(v20[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SLOBYTE(v20[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v20[1]), 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(v10 + 4 * SLOBYTE(v20[1]) + 60) & 0x40000) != 0)
  {
LABEL_17:
    strcpy((char *)&v20[1] + 1, "'");
    LOBYTE(v20[0]) = 39;
    goto LABEL_20;
  }
LABEL_19:
  __sprintf_chk((char *)v20, 0, 0x14uLL, "%d", v5);
LABEL_20:
  v12 = [NSString stringWithUTF8String:v20];
  v22[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v14 = [v6 errorWithDomain:v7 code:v8 userInfo:v13];

  id v15 = v14;
  if (!v15)
  {
LABEL_24:
    objc_storeStrong((id *)&self->_selfRef, self);
    v16 = 0;
    self->_audioProcessingTap = tapOut;
    goto LABEL_25;
  }
  v16 = v15;
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v20[0] = 138543618;
    *(void *)&v20[1] = self;
    LOWORD(v20[3]) = 2114;
    *(void *)((char *)&v20[3] + 2) = v16;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Error creating audio tap: %{public}@", (uint8_t *)v20, 0x16u);
  }

LABEL_25:
}

- (void)recreateAudioTap
{
  [(MPCSingleTrackAudioProcessor *)self _destroyAudioTap];

  [(MPCSingleTrackAudioProcessor *)self _createAudioTap];
}

- (void)finalizeTap:(opaqueMTAudioProcessingTap *)a3
{
}

- (unsigned)creationFlags
{
  return 1;
}

- (BOOL)shouldAttachAudioTapToItem:(id)a3
{
  return 1;
}

- (BOOL)configureQueueItem:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isAssetLoaded]
    && [(MPCSingleTrackAudioProcessor *)self shouldAttachAudioTapToItem:v4])
  {
    OSStatus v5 = [(MPCSingleTrackAudioProcessor *)self audioProcessingTap];
    v34 = [v4 playerItem];
    v6 = [v34 asset];
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__30223;
    v48 = __Block_byref_object_dispose__30224;
    id v49 = 0;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __51__MPCSingleTrackAudioProcessor_configureQueueItem___block_invoke;
    v39[3] = &unk_2643C5508;
    v42 = &v50;
    id v8 = v6;
    id v40 = v8;
    v43 = &v44;
    __darwin_ct_rune_t v9 = v7;
    v41 = v9;
    [v8 loadValuesAsynchronouslyForKeys:&unk_26CC196A0 completionHandler:v39];
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v9, v10))
    {
      BOOL v11 = 0;
LABEL_41:

      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(&v50, 8);

      goto LABEL_42;
    }
    uint64_t v12 = v51[3];
    switch(v12)
    {
      case 2:
        id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v56 = self;
          __int16 v57 = 2114;
          id v58 = v4;
          _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Tracks loaded for %{public}@ - Setting up audio tap", buf, 0x16u);
        }

        v32 = [MEMORY[0x263EFA780] audioMixInputParameters];
        v16 = [v8 tracks];
        v17 = [v16 firstObject];
        -[NSObject setTrackID:](v32, "setTrackID:", [v17 trackID]);

        [v32 setAudioTapProcessor:v5];
        v31 = [v34 audioMix];
        v30 = [MEMORY[0x263EFA778] audioMix];
        id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (v31)
        {
          v18 = _MPCLogCategoryPlayback();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [v31 inputParameters];
            *(_DWORD *)buf = 138543874;
            v56 = self;
            __int16 v57 = 2114;
            id v58 = v4;
            __int16 v59 = 2114;
            v60 = v19;
            _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Found existing audio mix on %{public}@ - Input parameters: %{public}@", buf, 0x20u);
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v20 = [v31 inputParameters];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v54 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v36;
            while (2)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v36 != v22) {
                  objc_enumerationMutation(v20);
                }
                v24 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                if ([v24 audioTapProcessor]
                  && (opaqueMTAudioProcessingTap *)[v24 audioTapProcessor] == v5)
                {
                  v28 = _MPCLogCategoryPlayback();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v56 = self;
                    __int16 v57 = 2114;
                    id v58 = v4;
                    _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Audio tap already setup [Not changing existing audio mix] - item: %{public}@", buf, 0x16u);
                  }

                  goto LABEL_39;
                }
                if (![v24 audioTapProcessor]) {
                  [v33 addObject:v24];
                }
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v54 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }
        }
        [v33 addObject:v32];
        [v30 setInputParameters:v33];
        [v34 setAudioMix:v30];

LABEL_39:
        BOOL v11 = 1;
        v13 = v32;
        goto LABEL_40;
      case 3:
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)v45[5];
          *(_DWORD *)buf = 138543874;
          v56 = self;
          __int16 v57 = 2114;
          id v58 = v4;
          __int16 v59 = 2114;
          v60 = v25;
          id v14 = "[AP] - %{public}@ - Error loading tracks [No audio tap setup possible] - item: %{public}@ - error: %{public}@";
          v26 = v13;
          uint32_t v27 = 32;
LABEL_34:
          _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_ERROR, v14, buf, v27);
        }
        break;
      case 4:
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v56 = self;
          __int16 v57 = 2114;
          id v58 = v4;
          id v14 = "[AP] - %{public}@ - Tracks loading cancelled [No audio tap setup possible] - item: %{public}@";
LABEL_33:
          v26 = v13;
          uint32_t v27 = 22;
          goto LABEL_34;
        }
        break;
      default:
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v56 = self;
          __int16 v57 = 2114;
          id v58 = v4;
          id v14 = "[AP] - %{public}@ - Tracks loading failed without reason [No audio tap setup possible] - item: %{public}@";
          goto LABEL_33;
        }
        break;
    }
    BOOL v11 = 0;
LABEL_40:

    goto LABEL_41;
  }
  BOOL v11 = 0;
LABEL_42:

  return v11;
}

intptr_t __51__MPCSingleTrackAudioProcessor_configureQueueItem___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 statusOfValueForKey:@"tracks" error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (opaqueMTAudioProcessingTap)audioProcessingTap
{
  result = self->_audioProcessingTap;
  if (!result)
  {
    [(MPCSingleTrackAudioProcessor *)self _createAudioTap];
    return self->_audioProcessingTap;
  }
  return result;
}

- (void)dealloc
{
  [(MPCSingleTrackAudioProcessor *)self _destroyAudioTap];
  v3.receiver = self;
  v3.super_class = (Class)MPCSingleTrackAudioProcessor;
  [(MPCSingleTrackAudioProcessor *)&v3 dealloc];
}

@end