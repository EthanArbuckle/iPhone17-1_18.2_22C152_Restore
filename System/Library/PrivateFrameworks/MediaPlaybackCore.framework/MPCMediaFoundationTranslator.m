@interface MPCMediaFoundationTranslator
- (AVPlayerPlaybackCoordinator)playbackCoordinator;
- (BOOL)canSkipInDirection:(int64_t)a3 fromItem:(id)a4;
- (MPCMediaFoundationTranslator)initWithPlaybackEngine:(id)a3;
- (MPCPlaybackEngine)playbackEngine;
- (NSMapTable)mapping;
- (NSString)targetContentItemID;
- (id)MPAVItemForMFPlayerItem:(id)a3;
- (id)_MPAVItemForContentItemID:(id)a3 allowReuse:(BOOL)a4;
- (id)contentItemIDsFromOffset:(int64_t)a3 toOffset:(int64_t)a4 nowPlayingIndex:(int64_t *)a5;
- (id)itemToFollowItem:(id)a3 direction:(int64_t)a4 distance:(int64_t)a5 reason:(int64_t)a6;
- (id)queueItemForContentItemID:(id)a3 allowReuse:(BOOL)a4 error:(id *)a5;
- (id)queueItemForPlayerItem:(id)a3 allowReuse:(BOOL)a4;
- (void)invalidateCache;
- (void)invalidateCacheWithContentItemID:(id)a3;
- (void)setMPAVItem:(id)a3 forMFPlayerItem:(id)a4;
- (void)setPlaybackEngine:(id)a3;
- (void)updatePlayerPlaybackCoordinator:(id)a3;
@end

@implementation MPCMediaFoundationTranslator

- (id)contentItemIDsFromOffset:(int64_t)a3 toOffset:(int64_t)a4 nowPlayingIndex:(int64_t *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v8 = [(MPCMediaFoundationTranslator *)self playbackEngine];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 queueController];
    v11 = [v10 contentItemIDsFromOffset:a3 toOffset:a4 mode:3 nowPlayingIndex:a5];
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v9 engineID];
      v14 = [v10 sessionID];
      int64_t v15 = *a5;
      v16 = objc_msgSend(v11, "msv_compactDescription");
      int v18 = 138544642;
      v19 = v13;
      __int16 v20 = 2114;
      v21 = v14;
      __int16 v22 = 2048;
      int64_t v23 = a3;
      __int16 v24 = 2048;
      int64_t v25 = a4;
      __int16 v26 = 2048;
      int64_t v27 = v15;
      __int16 v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] contentItemIDsFromOffset:%ld toOffset:%ld nowPlayingIndex:%ld | receive natural playback items [] contentItemIDs=[%{public}@]", (uint8_t *)&v18, 0x3Eu);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (MPCMediaFoundationTranslator)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaFoundationTranslator;
  v5 = [(MPCMediaFoundationTranslator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    mapping = v5->_mapping;
    v5->_mapping = (NSMapTable *)v6;

    objc_storeWeak((id *)&v5->_playbackEngine, v4);
  }

  return v5;
}

- (void)updatePlayerPlaybackCoordinator:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_playbackCoordinator, a3);
  uint64_t v6 = [(MPCMediaFoundationTranslator *)self playbackEngine];
  v7 = [v6 queueController];
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = [v6 engineID];
    v10 = [v7 sessionID];
    v11 = [v7 musicSharePlay];
    int v13 = 138544130;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    __int16 v20 = v11;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] updatePlayerPlaybackCoordinator:… | updating playback coordinator [engine update] playbackCoordinator=%{public}@ musicSharePlayBehavior=%{public}@", (uint8_t *)&v13, 0x2Au);
  }
  v12 = [v7 musicSharePlay];
  [v12 updatePlaybackCoordinator:v5];
}

- (AVPlayerPlaybackCoordinator)playbackCoordinator
{
  return self->_playbackCoordinator;
}

- (void)invalidateCache
{
  id v2 = [(MPCMediaFoundationTranslator *)self mapping];
  [v2 removeAllObjects];
}

- (id)queueItemForContentItemID:(id)a3 allowReuse:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_super v9 = [(MPCMediaFoundationTranslator *)self playbackEngine];
  v10 = [v9 queueController];
  v11 = [(MPCMediaFoundationTranslator *)self _MPAVItemForContentItemID:v8 allowReuse:v6];
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v9 engineID];
    v14 = [v10 sessionID];
    *(_DWORD *)buf = 138544386;
    __int16 v17 = v13;
    __int16 v18 = 2114;
    __int16 v19 = v14;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    __int16 v24 = 2114;
    int64_t v25 = v11;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] queueItemForContentItemID:%{public}@ allowReuse:%{BOOL}u | receive queue item [] item=%{public}@", buf, 0x30u);
  }
  if (a5 && !v11)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3007, @"Failed to resolve queue item with contentItemID:%@ allowReuse:%d", v8, v6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_MPAVItemForContentItemID:(id)a3 allowReuse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4
    || ([(MPCMediaFoundationTranslator *)self mapping],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:v6],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    objc_super v9 = [(MPCMediaFoundationTranslator *)self playbackEngine];
    v10 = [v9 queueController];
    id v8 = [v10 itemForContentItemID:v6 allowReuse:v4];

    if (v8)
    {
      v11 = [(MPCMediaFoundationTranslator *)self mapping];
      [v11 setObject:v8 forKey:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v8;
        int v13 = [v9 eventStream];
        [v12 setEventStream:v13];

        v14 = [v9 playerID];
        [v12 setPlayerID:v14];
      }
    }
  }

  return v8;
}

- (NSMapTable)mapping
{
  return self->_mapping;
}

- (BOOL)canSkipInDirection:(int64_t)a3 fromItem:(id)a4
{
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MPCMediaFoundationTranslator.m", 165, @"Invalid parameter not satisfying: %@", @"[(MPAVItem *)queueItem isKindOfClass:[MPAVItem class]]" object file lineNumber description];
  }
  id v8 = [(MPCMediaFoundationTranslator *)self playbackEngine];
  objc_super v9 = [v8 queueController];

  if (a3)
  {
    if (a3 != 1)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
    v10 = [v7 contentItemID];
    char v11 = [v9 canNextTrackForContentItemID:v10 reason:0];
  }
  else
  {
    v10 = [v7 contentItemID];
    char v11 = [v9 canPreviousTrackForContentItemID:v10 reason:0];
  }
  BOOL v12 = v11;

LABEL_9:
  return v12;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong((id *)&self->_playbackCoordinator, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (void)setPlaybackEngine:(id)a3
{
}

- (id)itemToFollowItem:(id)a3 direction:(int64_t)a4 distance:(int64_t)a5 reason:(int64_t)a6
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v11 = a3;
  if (a6 == 1)
  {
    v64 = [MEMORY[0x263F08690] currentHandler];
    [v64 handleFailureInMethod:a2 object:self file:@"MPCMediaFoundationTranslator.m" lineNumber:96 description:@"No longer support skipping via MF."];
  }
  SEL v67 = a2;
  v68 = v11;
  BOOL v12 = [(MPCMediaFoundationTranslator *)self playbackEngine];
  int v13 = [v12 queueController];
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [v12 engineID];
    [v13 sessionID];
    v16 = v13;
    __int16 v18 = v17 = v12;
    uint64_t v19 = [v11 contentItemID];
    __int16 v20 = (void *)v19;
    *(_DWORD *)buf = 138544642;
    id v21 = "backward";
    v71 = v15;
    if (a4 == 1) {
      id v21 = "forward";
    }
    __int16 v72 = 2114;
    v73 = v18;
    __int16 v74 = 2114;
    uint64_t v75 = v19;
    __int16 v76 = 2080;
    v77 = v21;
    __int16 v78 = 2048;
    int64_t v79 = a5;
    __int16 v80 = 1024;
    int v81 = a6;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ direction:%s distance:%ld reason:%d | enumerating content items [MF sync]", buf, 0x3Au);

    BOOL v12 = v17;
    int v13 = v16;
  }
  uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
  __int16 v22 = [v13 contentItemIDsFromOffset:-5 toOffset:5 mode:3 nowPlayingIndex:&v69];
  if (v69 != 0x7FFFFFFFFFFFFFFFLL)
  {
    __int16 v24 = v68;
    BOOL v23 = [v68 contentItemID];
    if (v23)
    {
      uint64_t v29 = [v22 indexOfObject:v23];
      if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = [v12 engineID];
          v32 = [v13 sessionID];
          [v68 contentItemID];
          v34 = v33 = v12;
          *(_DWORD *)buf = 138543874;
          v71 = v31;
          __int16 v72 = 2114;
          v73 = v32;
          __int16 v74 = 2114;
          uint64_t v75 = (uint64_t)v34;
          v35 = "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning nil [unable to find last item, NSNotFound]";
LABEL_33:
          _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, v35, buf, 0x20u);

          BOOL v12 = v33;
        }
LABEL_34:
        __int16 v28 = 0;
LABEL_54:

        goto LABEL_55;
      }
      BOOL v37 = v29 == 10 && a4 == 1;
      if (v37 || !(v29 | a4))
      {
        uint64_t v40 = [v22 count];
        uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        BOOL v41 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (v40 != 11)
        {
          if (v41)
          {
            v43 = [v12 engineID];
            [v13 sessionID];
            v45 = v44 = v12;
            v46 = [v68 contentItemID];
            *(_DWORD *)buf = 138543874;
            v71 = v43;
            __int16 v72 = 2114;
            v73 = v45;
            __int16 v74 = 2114;
            uint64_t v75 = (uint64_t)v46;
            _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning nil [unable to find last item]", buf, 0x20u);

            BOOL v12 = v44;
          }

          uint64_t v30 = [MEMORY[0x263F08690] currentHandler];
          [v30 handleFailureInMethod:v67 object:self file:@"MPCMediaFoundationTranslator.m" lineNumber:124 description:@"[unexpected] {-5, 5} was too small to find the last item in the player."];
          goto LABEL_34;
        }
        if (!v41) {
          goto LABEL_34;
        }
LABEL_32:
        v31 = [v12 engineID];
        v32 = [v13 sessionID];
        [v68 contentItemID];
        v34 = v33 = v12;
        *(_DWORD *)buf = 138543874;
        v71 = v31;
        __int16 v72 = 2114;
        v73 = v32;
        __int16 v74 = 2114;
        uint64_t v75 = (uint64_t)v34;
        v35 = "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning nil [no more items]";
        goto LABEL_33;
      }
      if (a4 == 1) {
        uint64_t v38 = 1;
      }
      else {
        uint64_t v38 = -1;
      }
      uint64_t v36 = v29 + v38;
      uint64_t v69 = v29 + v38;
    }
    else
    {
      uint64_t v36 = v69;
    }
    if (v36 == [v22 count])
    {
      uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      goto LABEL_32;
    }
    uint64_t v30 = [v22 objectAtIndexedSubscript:v69];
    v65 = v12;
    if (a6 == 3)
    {
      uint64_t v39 = 0;
    }
    else
    {
      v42 = [v68 contentItemID];
      if (v30 == v42) {
        uint64_t v39 = 0;
      }
      else {
        uint64_t v39 = [v30 isEqual:v42] ^ 1;
      }
    }
    __int16 v28 = objc_msgSend(v13, "itemForContentItemID:allowReuse:", v30, v39, v65);
    v47 = [v28 itemError];
    if (v47)
    {
    }
    else if (![v28 isAssetLoaded] {
           || ([v28 avPlayerItem],
    }
               v53 = objc_claimAutoreleasedReturnValue(),
               [v53 error],
               v54 = objc_claimAutoreleasedReturnValue(),
               v54,
               v53,
               !v54))
    {
LABEL_49:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v55 = v28;
        v56 = [v66 eventStream];
        [v55 setEventStream:v56];

        v57 = [v66 playerID];
        [v55 setPlayerID:v57];
      }
      v58 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = [v66 engineID];
        v60 = [v13 sessionID];
        v61 = [v24 contentItemID];
        v62 = [v28 contentItemID];
        *(_DWORD *)buf = 138544130;
        v71 = v59;
        __int16 v72 = 2114;
        v73 = v60;
        __int16 v74 = 2114;
        uint64_t v75 = (uint64_t)v61;
        __int16 v76 = 2114;
        v77 = v62;
        _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning %{public}@", buf, 0x2Au);

        __int16 v24 = v68;
      }

      BOOL v12 = v66;
      goto LABEL_54;
    }
    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [v66 engineID];
      v50 = [v13 sessionID];
      v51 = [v68 contentItemID];
      *(_DWORD *)buf = 138543874;
      v71 = v49;
      __int16 v72 = 2114;
      v73 = v50;
      __int16 v74 = 2114;
      uint64_t v75 = (uint64_t)v51;
      _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | disallowing reuse [reused next item was marked failed]", buf, 0x20u);

      __int16 v24 = v68;
    }

    uint64_t v52 = [v13 itemForContentItemID:v30 allowReuse:0];

    __int16 v28 = (void *)v52;
    goto LABEL_49;
  }
  BOOL v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  __int16 v24 = v68;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v25 = [v12 engineID];
    uint64_t v26 = [v13 sessionID];
    int64_t v27 = [v68 contentItemID];
    *(_DWORD *)buf = 138543874;
    v71 = v25;
    __int16 v72 = 2114;
    v73 = v26;
    __int16 v74 = 2114;
    uint64_t v75 = (uint64_t)v27;
    _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning nil [unable to find now playing item]", buf, 0x20u);
  }
  __int16 v28 = 0;
LABEL_55:

  return v28;
}

- (id)queueItemForPlayerItem:(id)a3 allowReuse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 contentItemID];
  id v7 = [(MPCMediaFoundationTranslator *)self _MPAVItemForContentItemID:v6 allowReuse:v4];

  return v7;
}

- (void)invalidateCacheWithContentItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCMediaFoundationTranslator *)self mapping];
  [v5 removeObjectForKey:v4];
}

- (NSString)targetContentItemID
{
  id v2 = [(MPCMediaFoundationTranslator *)self playbackEngine];
  v3 = [v2 queueController];
  id v4 = [v3 targetContentItemID];

  return (NSString *)v4;
}

- (void)setMPAVItem:(id)a3 forMFPlayerItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(MPCMediaFoundationTranslator *)self mapping];
  id v8 = [v6 contentItemID];

  if (v9) {
    [v7 setObject:v9 forKey:v8];
  }
  else {
    [v7 removeObjectForKey:v8];
  }
}

- (id)MPAVItemForMFPlayerItem:(id)a3
{
  id v4 = [a3 contentItemID];
  id v5 = [(MPCMediaFoundationTranslator *)self _MPAVItemForContentItemID:v4 allowReuse:1];

  return v5;
}

@end