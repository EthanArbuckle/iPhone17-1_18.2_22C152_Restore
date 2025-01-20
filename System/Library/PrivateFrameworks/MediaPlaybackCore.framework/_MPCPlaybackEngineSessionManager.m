@interface _MPCPlaybackEngineSessionManager
+ (id)archivesAtURL:(id)a3;
- (BOOL)isStateRestorationSupported;
- (MPCPlaybackEngine)playbackEngine;
- (NSMutableArray)sessionArchives;
- (NSMutableDictionary)sessionIdentifierArchiveMap;
- (NSString)stateRestorationSessionIdentifier;
- (OS_dispatch_queue)serialQueue;
- (_MPCPlaybackEngineSessionManager)initWithPlaybackEngine:(id)a3;
- (id)_playbackSessionsDirectory;
- (void)deleteSessionWithIdentifier:(id)a3 completion:(id)a4;
- (void)saveSessionWithCompletion:(id)a3;
- (void)setStateRestorationSessionIdentifier:(id)a3;
- (void)setStateRestorationSupported:(BOOL)a3;
@end

@implementation _MPCPlaybackEngineSessionManager

- (NSString)stateRestorationSessionIdentifier
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 stringForKey:@"LastPlaybackSessionIdentifier"];

  return (NSString *)v3;
}

- (_MPCPlaybackEngineSessionManager)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPCPlaybackEngineSessionManager;
  v5 = [(_MPCPlaybackEngineSessionManager *)&v14 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlaybackCore._MPCPlaybackEngineSessionManager/serialQueue", v6);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    sessionArchives = v5->_sessionArchives;
    v5->_sessionArchives = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    sessionIdentifierArchiveMap = v5->_sessionIdentifierArchiveMap;
    v5->_sessionIdentifierArchiveMap = (NSMutableDictionary *)v11;

    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    [v4 addEngineObserver:v5];
  }

  return v5;
}

- (BOOL)isStateRestorationSupported
{
  return self->_stateRestorationSupported;
}

- (void)saveSessionWithCompletion:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  dispatch_queue_t v7 = [WeakRetained queueController];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v43 = [MEMORY[0x263F08690] currentHandler];
      [v43 handleFailureInMethod:a2 object:self file:@"_MPCPlaybackEngineSessionManager.m" lineNumber:117 description:@"Session management only available with MPCQueueController"];
    }
    if (self->_stateRestorationSupported)
    {
      v8 = [MEMORY[0x263F892E8] sharedSecurityInfo];
      if ([v8 isContentProtectionEnabled]
        && ([v8 isDeviceClassCUnlocked] & 1) == 0)
      {
        v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion: [before first unlock] skipping save", (uint8_t *)&buf, 0xCu);
        }

        v22 = (void *)MEMORY[0x263F087E8];
        v23 = @"Can't save an archive before first unlock (cannot write to container data).";
        uint64_t v24 = 1;
      }
      else
      {
        if ([v7 containsRestorableContent])
        {
          uint64_t v9 = [WeakRetained mediaRemotePublisher];
          v10 = [v9 infoCenter];

          uint64_t v11 = [v7 sessionID];
          v12 = [v10 nowPlayingContentItem];
          v13 = v12;
          if (v12)
          {
            v47 = v11;
            objc_super v14 = [v12 userInfo];
            v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F11BB0]];
            int v16 = [v15 BOOLValue];

            if (v16)
            {
              v17 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackSessionManagerError", 2, @"Opting not to save an archive with a placeholder content item.");
              v5[2](v5, 0, v17);
            }
            else
            {
              v27 = [(_MPCPlaybackEngineSessionManager *)self _playbackSessionsDirectory];
              v28 = [v47 stringByAppendingPathExtension:@"playbackSessionArchive"];
              [v27 URLByAppendingPathComponent:v28 isDirectory:1];
              uint64_t v29 = v44 = v13;

              v30 = [_MPCPlaybackSessionArchive alloc];
              v45 = (void *)v29;
              uint64_t v31 = v29;
              v13 = v44;
              v32 = [(_MPCPlaybackSessionArchive *)v30 initWithURL:v31 identifier:v47];
              [(_MPCPlaybackSessionArchive *)v32 setContentItem:v44];
              group = dispatch_group_create();
              v33 = [MEMORY[0x263F12178] standardUserDefaults];
              int v34 = [v33 archiveSessionArtwork];

              if (v34)
              {
                v35 = [v10 playbackQueueDataSource];
                if (objc_opt_respondsToSelector())
                {
                  dispatch_group_enter(group);
                  v36 = [v10 nowPlayingContentItem];
                  v57[0] = MEMORY[0x263EF8330];
                  v57[1] = 3221225472;
                  v57[2] = __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke;
                  v57[3] = &unk_2643C6688;
                  v57[4] = self;
                  v58 = group;
                  v59 = v32;
                  id v37 = (id)objc_msgSend(v35, "nowPlayingInfoCenter:artworkForContentItem:size:completion:", v10, v36, v57, 1200.0, 1200.0);
                }
              }
              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v61 = 0x3032000000;
              v62 = __Block_byref_object_copy__32625;
              v63 = __Block_byref_object_dispose__32626;
              id v64 = 0;
              dispatch_group_enter(group);
              serialQueue = self->_serialQueue;
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_45;
              block[3] = &unk_2643C66B0;
              id v53 = v7;
              v39 = v32;
              v55 = group;
              p_long long buf = &buf;
              v54 = v39;
              v40 = group;
              dispatch_async(serialQueue, block);
              v41 = self->_serialQueue;
              v48[0] = MEMORY[0x263EF8330];
              v48[1] = 3221225472;
              v48[2] = __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_49;
              v48[3] = &unk_2643C66D8;
              v51 = &buf;
              v48[4] = self;
              v49 = v39;
              v50 = v5;
              v42 = v39;
              dispatch_group_notify(v40, v41, v48);

              _Block_object_dispose(&buf, 8);
            }
            uint64_t v11 = v47;
          }
          else
          {
            v26 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackSessionManagerError", 2, @"Can't save an archive without a now playing content item.");
            v5[2](v5, 0, v26);
          }
          goto LABEL_29;
        }
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion: [containsRestorableContent = NO] skipping save", (uint8_t *)&buf, 0xCu);
        }

        v22 = (void *)MEMORY[0x263F087E8];
        v23 = @"Opting not to save an archive that does not contain restorable content";
        uint64_t v24 = 3;
      }
      v10 = objc_msgSend(v22, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackSessionManagerError", v24, v23);
      v5[2](v5, 0, v10);
LABEL_29:

      goto LABEL_30;
    }
    v18 = (void *)MEMORY[0x263F087E8];
    v19 = @"MPCError";
    v20 = @"Playback engine doesn't support state restoration";
  }
  else
  {
    v18 = (void *)MEMORY[0x263F087E8];
    v19 = @"MPCPlaybackSessionManagerError";
    v20 = @"Can't save an archive without a QueueController";
  }
  v8 = objc_msgSend(v18, "msv_errorWithDomain:code:debugDescription:", v19, 2, v20);
  v5[2](v5, 0, v8);
LABEL_30:
}

- (void)setStateRestorationSupported:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_stateRestorationSupported != v3)
  {
    self->_stateRestorationSupported = v3;
    serialQueue = self->_serialQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65___MPCPlaybackEngineSessionManager_setStateRestorationSupported___block_invoke;
    v6[3] = &unk_2643C6628;
    BOOL v7 = v3;
    v6[4] = self;
    dispatch_async(serialQueue, v6);
  }
}

+ (id)archivesAtURL:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v24 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = *MEMORY[0x263EFF6A8];
  uint64_t v6 = *MEMORY[0x263EFF5F8];
  v31[0] = *MEMORY[0x263EFF6A8];
  v31[1] = v6;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  v8 = v4;
  v23 = v3;
  uint64_t v9 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v7 options:4 errorHandler:0];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v25 = 0;
        int v16 = [v15 getResourceValue:&v25 forKey:v5 error:0];
        id v17 = v25;
        v18 = v17;
        if (v16 && [v17 BOOLValue])
        {
          v19 = [v15 pathExtension];
          int v20 = [v19 isEqualToString:@"playbackSessionArchive"];

          if (v20)
          {
            v21 = [[_MPCPlaybackSessionArchive alloc] initWithURL:v15];
            if (v21) {
              [v24 addObject:v21];
            }
            else {
              [v8 removeItemAtURL:v15 error:0];
            }
          }
          else
          {
            [v8 removeItemAtURL:v15 error:0];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  [v24 sortUsingComparator:&__block_literal_global_32666];

  return v24;
}

- (id)_playbackSessionsDirectory
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [v2 URLsForDirectory:9 inDomains:1];
  id v4 = [v3 lastObject];

  uint64_t v5 = [v4 URLByAppendingPathComponent:@"PlaybackSessions" isDirectory:1];
  uint64_t v6 = [v5 path];
  [v2 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

  return v5;
}

- (void)setStateRestorationSessionIdentifier:(id)a3
{
  id v6 = a3;
  uint64_t v3 = [v6 length];
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v5 = v4;
  if (v3) {
    [v4 setObject:v6 forKey:@"LastPlaybackSessionIdentifier"];
  }
  else {
    [v4 removeObjectForKey:@"LastPlaybackSessionIdentifier"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifierArchiveMap, 0);
  objc_storeStrong((id *)&self->_sessionArchives, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (NSMutableDictionary)sessionIdentifierArchiveMap
{
  return self->_sessionIdentifierArchiveMap;
}

- (NSMutableArray)sessionArchives
{
  return self->_sessionArchives;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)deleteSessionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  if (self->_stateRestorationSupported)
  {
    v8 = [(NSMutableDictionary *)self->_sessionIdentifierArchiveMap objectForKeyedSubscript:v6];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
      id v10 = [v8 packageURL];
      id v13 = 0;
      [v9 removeItemAtURL:v10 error:&v13];
      id v11 = v13;

      if (!v11)
      {
        [(NSMutableDictionary *)self->_sessionIdentifierArchiveMap setObject:0 forKeyedSubscript:v6];
        [(NSMutableArray *)self->_sessionArchives removeObjectIdenticalTo:v8];
      }
      v7[2](v7, v11);
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:999 userInfo:0];
      v7[2](v7, v12);
    }
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 2, @"Playback engine doesn't support state restoration");
    v7[2](v7, v8);
  }
}

@end