@interface LPMediaPlaybackManager
+ (id)shared;
- (BOOL)_sharedSessionHasPlayingAudio;
- (BOOL)releaseDecodingResourcesForInactivePlayers;
- (LPMediaPlaybackManager)init;
- (id)audioSession;
- (void)_deactivateAllPlayingMediaPlayersExcept:(id)a3;
- (void)_updateAudioSessionCategory;
- (void)_volumeChanged;
- (void)addMediaPlayer:(id)a3;
- (void)mediaPlayer:(id)a3 didChangeMutedState:(BOOL)a4;
- (void)mediaPlayer:(id)a3 didChangePlayingState:(BOOL)a4;
- (void)removeMediaPlayer:(id)a3;
- (void)volumeChanged:(id)a3;
@end

@implementation LPMediaPlaybackManager

- (LPMediaPlaybackManager)init
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)LPMediaPlaybackManager;
  v2 = [(LPMediaPlaybackManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    mediaPlayers = v2->_mediaPlayers;
    v2->_mediaPlayers = (NSHashTable *)v3;

    v5 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    v6 = (void *)MEMORY[0x1E4F74ED8];
    v12[0] = *MEMORY[0x1E4F74ED8];
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v5 setAttribute:v7 forKey:*MEMORY[0x1E4F74EA8] error:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_volumeChanged_ name:*v6 object:0];

    v9 = v2;
  }

  return v2;
}

+ (id)shared
{
  v2 = (void *)shared_singleton_0;
  if (!shared_singleton_0)
  {
    uint64_t v3 = objc_alloc_init(LPMediaPlaybackManager);
    v4 = (void *)shared_singleton_0;
    shared_singleton_0 = (uint64_t)v3;

    v2 = (void *)shared_singleton_0;
  }

  return v2;
}

- (void)addMediaPlayer:(id)a3
{
}

- (void)removeMediaPlayer:(id)a3
{
}

- (void)mediaPlayer:(id)a3 didChangePlayingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && [v6 isActive]) {
    [(LPMediaPlaybackManager *)self _deactivateAllPlayingMediaPlayersExcept:v6];
  }
  [(LPMediaPlaybackManager *)self _updateAudioSessionCategory];
}

- (void)mediaPlayer:(id)a3 didChangeMutedState:(BOOL)a4
{
  id v6 = a3;
  if (!a4) {
    [(LPMediaPlaybackManager *)self _deactivateAllPlayingMediaPlayersExcept:v6];
  }
  [(LPMediaPlaybackManager *)self _updateAudioSessionCategory];
}

- (void)_deactivateAllPlayingMediaPlayersExcept:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_mediaPlayers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v10 + 1) + 8 * v8);
        if (v9 != v4
          && objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "isActive", (void)v10)
          && [v9 isPlaying])
        {
          [v9 setActive:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)releaseDecodingResourcesForInactivePlayers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_mediaPlayers;
  int v3 = 0;
  uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          v3 |= objc_msgSend(v7, "releaseDecodingResourcesIfInactive", (void)v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

- (id)audioSession
{
  v2 = (void *)audioSession_session;
  if (!audioSession_session)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F153E0]) initAuxiliarySession];
    uint64_t v4 = (void *)audioSession_session;
    audioSession_session = v3;

    [(id)audioSession_session setCategory:*MEMORY[0x1E4F14F68] error:0];
    v2 = (void *)audioSession_session;
  }

  return v2;
}

- (BOOL)_sharedSessionHasPlayingAudio
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_mediaPlayers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isMuted", (void)v8) & 1) == 0
          && [v6 isPlaying]
          && ([v6 usesSharedAudioSession] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

- (void)_updateAudioSessionCategory
{
  id v8 = [(LPMediaPlaybackManager *)self audioSession];
  BOOL v3 = [(LPMediaPlaybackManager *)self _sharedSessionHasPlayingAudio];
  uint64_t v4 = (id *)MEMORY[0x1E4F14F98];
  if (!v3) {
    uint64_t v4 = (id *)MEMORY[0x1E4F14F68];
  }
  id v5 = *v4;
  uint64_t v6 = [v8 category];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0) {
    [v8 setCategory:v5 error:0];
  }
}

- (void)_volumeChanged
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v4 = self->_mediaPlayers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v35;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v35 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
      if (([v8 isFullScreen] & 1) != 0
        || ([v8 isMuted] & 1) == 0 && (objc_msgSend(v8, "isPlaying") & 1) != 0)
      {
        break;
      }
      if ([v8 shouldUnmuteWhenUserAdjustsVolume]
        && [v8 isPlaying])
      {
        [v3 addObject:v8];
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v10)
    {
      uint64_t v4 = 0;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          unint64_t v14 = [v13 lastInteractionTimestamp];
          if (v14 > [(NSHashTable *)v4 lastInteractionTimestamp])
          {
            uint64_t v15 = v13;

            uint64_t v4 = v15;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v10);

      if (v4)
      {
        [(NSHashTable *)v4 setActive:1];
        goto LABEL_36;
      }
    }
    else
    {
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v9;
    v17 = 0;
    uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v27;
      double v20 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          objc_msgSend(v22, "unobscuredAreaFraction", (void)v26);
          double v24 = v23;
          if (v23 > v20)
          {
            id v25 = v22;

            v17 = v25;
            double v20 = v24;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v18);
    }

    [v17 setActive:1];
    uint64_t v4 = 0;
  }
LABEL_36:
}

- (void)volumeChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F74AE0]];
  char v6 = [v5 isEqualToString:@"ExplicitVolumeChange"];

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__LPMediaPlaybackManager_volumeChanged___block_invoke;
    block[3] = &unk_1E5B04DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __40__LPMediaPlaybackManager_volumeChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _volumeChanged];
}

- (void).cxx_destruct
{
}

@end