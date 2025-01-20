@interface ANPlaybackManager
+ (id)managerWithEndpointID:(id)a3;
- (ANPlaybackManager)initWithEndpointID:(id)a3;
- (ANPlaybackManagerDataSource)dataSource;
- (ANPlaybackManagerDelegate)delegate;
- (ANTrackPlayer)audioPlayer;
- (BOOL)_playAnnouncements:(id)a3 announceIDToStart:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (BOOL)_playAnnouncementsWithIDs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (BOOL)_startPlayingAnnouncements;
- (NSDictionary)lastPlayedAnnouncementInfo;
- (NSMutableDictionary)playbackInfo;
- (NSMutableOrderedSet)announcementsToPlay;
- (NSUUID)endpointID;
- (OS_dispatch_queue)playbackQueue;
- (OS_os_log)log;
- (id)_announcementsForPlaybackOptions:(unint64_t)a3 fromAnnouncements:(id)a4;
- (id)_createTrackPlayerWithAnnouncement:(id)a3 options:(unint64_t)a4 anchorPoint:(unint64_t *)a5;
- (id)_nextAnnouncementToPlay;
- (id)playbackCompletionHandler;
- (int64_t)lastAnnoucementIndex;
- (unint64_t)playbackItemCount;
- (unint64_t)playbackOptions;
- (unint64_t)playbackState;
- (void)_handlePlaybackEndedForPlayer:(id)a3 withError:(id)a4;
- (void)_nextAnnouncementWithCompletionHandler:(id)a3;
- (void)_previousAnnouncementWithCompletionHandler:(id)a3;
- (void)_startPlayingAnnouncements;
- (void)_stopAudioPlayer;
- (void)_stopPlayingAnnouncementsWithCompletionHandler:(id)a3;
- (void)_updatePlaybackInfoForAnnouncementID:(id)a3 options:(unint64_t)a4 player:(id)a5;
- (void)performPlaybackCommand:(id)a3 completionHandler:(id)a4;
- (void)setAnnouncementsToPlay:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointID:(id)a3;
- (void)setLastAnnoucementIndex:(int64_t)a3;
- (void)setPlaybackCompletionHandler:(id)a3;
- (void)trackPlayer:(id)a3 didFinishPlayingTrackType:(int64_t)a4 announcementID:(id)a5 error:(id)a6;
- (void)trackPlayer:(id)a3 didUpdatePlaybackState:(unint64_t)a4 announcementID:(id)a5;
- (void)updatePlaybackForAnnouncementID:(id)a3 options:(unint64_t)a4;
@end

@implementation ANPlaybackManager

- (ANPlaybackManager)initWithEndpointID:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ANPlaybackManager;
  v6 = [(ANPlaybackManager *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointID, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.announce.playbackQueue", v8);
    playbackQueue = v7->_playbackQueue;
    v7->_playbackQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    playbackInfo = v7->_playbackInfo;
    v7->_playbackInfo = (NSMutableDictionary *)v11;

    ANLogBuildCategoryName();
    uint64_t v13 = ANLogWithCategory();
    log = v7->_log;
    v7->_log = (OS_os_log *)v13;
  }
  return v7;
}

+ (id)managerWithEndpointID:(id)a3
{
  id v3 = a3;
  v4 = [[ANPlaybackManager alloc] initWithEndpointID:v3];

  return v4;
}

- (void)performPlaybackCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(ANPlaybackManager *)self playbackQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__ANPlaybackManager_performPlaybackCommand_completionHandler___block_invoke;
  v11[3] = &unk_1E6BCE380;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__ANPlaybackManager_performPlaybackCommand_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v4;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "Performing Playback Command: %@", buf, 0xCu);
  }

  switch([*(id *)(a1 + 32) operation])
  {
    case 0:
      id v5 = [*(id *)(a1 + 32) announcementIdentifiers];
      int v6 = objc_msgSend(WeakRetained, "_playAnnouncementsWithIDs:options:completionHandler:", v5, objc_msgSend(*(id *)(a1 + 32), "options"), *(void *)(a1 + 40));

      if (v6)
      {
        id v7 = [WeakRetained announcementsToPlay];
        v8 = [v7 lastObject];

        if (v8)
        {
          id v9 = [WeakRetained endpointID];
          v24 = +[ANAnalyticsContext contextWithEndpointID:v9];

          id v10 = +[ANAnalytics shared];
          uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
          id v12 = [v8 creationTimestamp];
          [v11 timeIntervalSinceDate:v12];
          double v14 = v13;
          v15 = [MEMORY[0x1E4F1C9C8] now];
          objc_super v16 = [v8 playbackDeadline];
          [v15 timeIntervalSinceDate:v16];
          double v18 = v17;
          v19 = (void *)MEMORY[0x1E4F4A8A8];
          v20 = [*(id *)(a1 + 32) clientIdentifier];
          uint64_t v21 = [v19 sourceFromString:v20];
          v22 = [WeakRetained announcementsToPlay];
          objc_msgSend(v10, "announcementPlayed:withTime:deadlineViolation:playbackSource:ofGroupCount:context:", v8, v21, objc_msgSend(v22, "count"), v24, v14, v18);
        }
        goto LABEL_8;
      }
      break;
    case 1:
      [WeakRetained _stopPlayingAnnouncementsWithCompletionHandler:*(void *)(a1 + 40)];
      break;
    case 2:
      [WeakRetained _nextAnnouncementWithCompletionHandler:*(void *)(a1 + 40)];
      break;
    case 3:
      [WeakRetained _previousAnnouncementWithCompletionHandler:*(void *)(a1 + 40)];
      break;
    default:
      uint64_t v23 = *(void *)(a1 + 40);
      v8 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1050, *MEMORY[0x1E4F4A730]);
      (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v8);
LABEL_8:

      break;
  }
}

- (void)updatePlaybackForAnnouncementID:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ANPlaybackManager *)self playbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ANPlaybackManager_updatePlaybackForAnnouncementID_options___block_invoke;
  block[3] = &unk_1E6BCDFE0;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __61__ANPlaybackManager_updatePlaybackForAnnouncementID_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlaybackInfoForAnnouncementID:*(void *)(a1 + 40) options:*(void *)(a1 + 48) player:0];
}

- (NSDictionary)lastPlayedAnnouncementInfo
{
  id v3 = [(ANPlaybackManager *)self playbackQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = __Block_byref_object_copy__3;
  id v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  uint64_t v4 = [(ANPlaybackManager *)self playbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ANPlaybackManager_lastPlayedAnnouncementInfo__block_invoke;
  v7[3] = &unk_1E6BCE3A8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

void __47__ANPlaybackManager_lastPlayedAnnouncementInfo__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) playbackInfo];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)playbackState
{
  uint64_t v2 = [(ANPlaybackManager *)self audioPlayer];
  unint64_t v3 = [v2 playbackState];

  return v3;
}

- (unint64_t)playbackItemCount
{
  uint64_t v2 = [(ANPlaybackManager *)self announcementsToPlay];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)_updatePlaybackInfoForAnnouncementID:(id)a3 options:(unint64_t)a4 player:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ANPlaybackManager *)self playbackQueue];
  dispatch_assert_queue_V2(v10);

  unint64_t v11 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [NSNumber numberWithUnsignedInteger:a4 & 1];
    *(_DWORD *)buf = 138412546;
    id v59 = v8;
    __int16 v60 = 2112;
    v61 = v12;
    _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "Updating Playback Info with Announcement ID = %@, Playing = %@", buf, 0x16u);
  }
  id v13 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = [(ANPlaybackManager *)self playbackInfo];
    *(_DWORD *)buf = 138412290;
    id v59 = v14;
    _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "[BEFORE] Playback Info: %@", buf, 0xCu);
  }
  if ((a4 & 1) == 0)
  {
    v15 = [(ANPlaybackManager *)self playbackInfo];
    uint64_t v16 = *MEMORY[0x1E4F4A510];
    double v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F4A510]];

    double v18 = [(ANPlaybackManager *)self playbackInfo];
    uint64_t v19 = *MEMORY[0x1E4F4A4F0];
    v20 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F4A4F0]];

    if (v17)
    {
      int v21 = [v17 BOOLValue];
      if (v8)
      {
        if (!v21 && v20 && [v20 isEqualToString:v8])
        {
          v22 = [(ANPlaybackManager *)self log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v59 = v8;
            _os_log_impl(&dword_1DA5ED000, v22, OS_LOG_TYPE_DEFAULT, "Ignoring dupe stop update for Announcement %@", buf, 0xCu);
          }

          goto LABEL_39;
        }
      }
    }
    v31 = [(ANPlaybackManager *)self playbackInfo];
    [v31 setObject:&unk_1F34A9C78 forKeyedSubscript:v16];

    v32 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v33 = [(ANPlaybackManager *)self playbackInfo];
    [v33 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F4A508]];

    v34 = [MEMORY[0x1E4F1C9C8] date];
    v35 = [(ANPlaybackManager *)self playbackInfo];
    [v35 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F4A500]];

    if (v9)
    {
      v36 = (void *)MEMORY[0x1E4F29238];
      v37 = [v9 queuePlayer];
      v38 = v37;
      if (v37)
      {
        [v37 currentTime];
      }
      else
      {
        uint64_t v52 = 0;
        uint64_t v53 = 0;
        uint64_t v54 = 0;
      }
      v39 = [v36 valueWithCMTime:&v52];
      v40 = [(ANPlaybackManager *)self playbackInfo];
      [v40 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F4A4F8]];
    }
    if (!v8) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v8)
  {
    uint64_t v23 = [(ANPlaybackManager *)self playbackInfo];
    [v23 setObject:&unk_1F34A9C60 forKeyedSubscript:*MEMORY[0x1E4F4A510]];

    v24 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v25 = [(ANPlaybackManager *)self playbackInfo];
    [v25 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F4A528]];

    uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v27 = [(ANPlaybackManager *)self playbackInfo];
    [v27 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F4A520]];

    if (v9)
    {
      v28 = (void *)MEMORY[0x1E4F29238];
      v29 = [v9 queuePlayer];
      v30 = v29;
      if (v29)
      {
        [v29 currentTime];
      }
      else
      {
        uint64_t v55 = 0;
        uint64_t v56 = 0;
        uint64_t v57 = 0;
      }
      v41 = [v28 valueWithCMTime:&v55];
      v42 = [(ANPlaybackManager *)self playbackInfo];
      [v42 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F4A518]];
    }
    v43 = [(ANPlaybackManager *)self playbackInfo];
    [v43 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F4A508]];

    v44 = [(ANPlaybackManager *)self playbackInfo];
    [v44 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F4A500]];

    v45 = [(ANPlaybackManager *)self playbackInfo];
    [v45 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F4A4F8]];

    uint64_t v19 = *MEMORY[0x1E4F4A4F0];
LABEL_30:
    v46 = [(ANPlaybackManager *)self playbackInfo];
    [v46 setObject:v8 forKeyedSubscript:v19];

LABEL_31:
    v47 = [(ANPlaybackManager *)self playbackInfo];
    double v17 = [v47 objectForKeyedSubscript:v19];

    if (v17)
    {
      v48 = [(ANPlaybackManager *)self delegate];
      v49 = v48;
      if (a4) {
        [v48 playbackManager:self didStartPlayingAnnouncement:v17];
      }
      else {
        [v48 playbackManager:self didFinishPlayingAnnouncement:v17 withOptions:a4];
      }
    }
    v50 = [(ANPlaybackManager *)self log];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = [(ANPlaybackManager *)self playbackInfo];
      *(_DWORD *)buf = 138412290;
      id v59 = v51;
      _os_log_impl(&dword_1DA5ED000, v50, OS_LOG_TYPE_DEFAULT, "[AFTER] Playback Info: %@", buf, 0xCu);
    }
    goto LABEL_39;
  }
  double v17 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[ANPlaybackManager _updatePlaybackInfoForAnnouncementID:options:player:](v17);
  }
LABEL_39:
}

- (void)_stopPlayingAnnouncementsWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  id v5 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Stopping Playback", v8, 2u);
  }

  [(ANPlaybackManager *)self _stopAudioPlayer];
  id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1037, *MEMORY[0x1E4F4A730]);
  id v7 = [(ANPlaybackManager *)self audioPlayer];
  [(ANPlaybackManager *)self _handlePlaybackEndedForPlayer:v7 withError:v6];

  v4[2](v4, 0);
}

- (void)_nextAnnouncementWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    uint64_t v19 = "-[ANPlaybackManager _nextAnnouncementWithCompletionHandler:]";
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
  }

  id v6 = [(ANPlaybackManager *)self audioPlayer];
  uint64_t v7 = [v6 playbackState];

  if (v7 == 1)
  {
    id v8 = [(ANPlaybackManager *)self audioPlayer];
    int v9 = [v8 numberActiveTracks];

    if (v9 > 1)
    {
      id v13 = [(ANPlaybackManager *)self audioPlayer];
      [v13 nextWithCompletionHandler:v4];
      goto LABEL_9;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F4A730];
    uint64_t v12 = 1021;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F4A730];
    uint64_t v12 = 1020;
  }
  id v13 = objc_msgSend(v10, "an_errorWithCode:component:", v12, v11);
  v4[2](v4, v13);
  double v14 = +[ANAnalytics shared];
  uint64_t v15 = [v13 code];
  uint64_t v16 = [(ANPlaybackManager *)self endpointID];
  double v17 = +[ANAnalyticsContext contextWithEndpointID:v16];
  [v14 error:v15 context:v17];

LABEL_9:
}

- (void)_previousAnnouncementWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    double v14 = "-[ANPlaybackManager _previousAnnouncementWithCompletionHandler:]";
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v6 = [(ANPlaybackManager *)self audioPlayer];
  uint64_t v7 = [v6 playbackState];

  if (v7 == 1)
  {
    id v8 = [(ANPlaybackManager *)self audioPlayer];
    [v8 previousWithCompletionHandler:v4];
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1020, *MEMORY[0x1E4F4A730]);
    v4[2](v4, v8);
    int v9 = +[ANAnalytics shared];
    uint64_t v10 = [v8 code];
    uint64_t v11 = [(ANPlaybackManager *)self endpointID];
    uint64_t v12 = +[ANAnalyticsContext contextWithEndpointID:v11];
    [v9 error:v10 context:v12];
  }
}

- (BOOL)_playAnnouncements:(id)a3 announceIDToStart:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  int v13 = [(ANPlaybackManager *)self audioPlayer];
  uint64_t v14 = [v13 playbackState];

  if (v14)
  {
    uint64_t v15 = [(ANPlaybackManager *)self log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v44 = v14;
      _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_DEFAULT, "Already playing. Current playback state = %{public}lu. Stopping before proceeding.", buf, 0xCu);
    }

    [(ANPlaybackManager *)self _stopAudioPlayer];
    uint64_t v16 = [(ANPlaybackManager *)self audioPlayer];
    [(ANPlaybackManager *)self _handlePlaybackEndedForPlayer:v16 withError:0];
  }
  self->_playbackOptions = a5;
  [(ANPlaybackManager *)self setLastAnnoucementIndex:0];
  double v17 = [(ANPlaybackManager *)self dataSource];
  [v17 cleanUpOldAnnouncementsForPlaybackManager:self];

  id v18 = objc_alloc(MEMORY[0x1E4F1CA70]);
  uint64_t v19 = [(ANPlaybackManager *)self _announcementsForPlaybackOptions:a5 fromAnnouncements:v10];
  uint64_t v20 = (void *)[v18 initWithArray:v19];
  [(ANPlaybackManager *)self setAnnouncementsToPlay:v20];

  if (v11)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    int v21 = [(ANPlaybackManager *)self announcementsToPlay];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v39;
LABEL_8:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = [*(id *)(*((void *)&v38 + 1) + 8 * v25) identifier];
        char v27 = [v26 isEqual:v11];

        if (v27) {
          break;
        }
        [(ANPlaybackManager *)self setLastAnnoucementIndex:[(ANPlaybackManager *)self lastAnnoucementIndex] + 1];
        if (v23 == ++v25)
        {
          uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v23) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

    unint64_t v28 = [(ANPlaybackManager *)self lastAnnoucementIndex];
    v29 = [(ANPlaybackManager *)self announcementsToPlay];
    unint64_t v30 = [v29 count];

    if (v28 >= v30) {
      [(ANPlaybackManager *)self setLastAnnoucementIndex:0];
    }
  }
  v31 = [(ANPlaybackManager *)self announcementsToPlay];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    [(ANPlaybackManager *)self setPlaybackCompletionHandler:v12];
    BOOL v33 = [(ANPlaybackManager *)self _startPlayingAnnouncements];
  }
  else
  {
    v34 = [(ANPlaybackManager *)self log];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA5ED000, v34, OS_LOG_TYPE_DEFAULT, "Received playback request but there is nothing to play. Not returning error.", buf, 2u);
    }

    [(ANPlaybackManager *)self setAnnouncementsToPlay:0];
    v12[2](v12, 0);
    v35 = [(ANPlaybackManager *)self delegate];
    v36 = [(ANPlaybackManager *)self audioPlayer];
    objc_msgSend(v35, "playbackManager:didUpdatePlaybackState:announcement:", self, objc_msgSend(v36, "playbackState"), 0);

    BOOL v33 = 0;
  }

  return v33;
}

- (BOOL)_playAnnouncementsWithIDs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 firstObject];
  id v11 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    uint64_t v19 = "-[ANPlaybackManager _playAnnouncementsWithIDs:options:completionHandler:]";
    __int16 v20 = 2112;
    int v21 = v10;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%s: announceIDToStart %@, options %ld", (uint8_t *)&v18, 0x20u);
  }

  uint64_t v12 = [v8 count];
  int v13 = [(ANPlaybackManager *)self dataSource];
  uint64_t v14 = v13;
  if (v12) {
    [v13 playbackManager:self announcementsForIdentifiers:v8];
  }
  else {
  uint64_t v15 = [v13 announcementsForPlaybackManager:self];
  }

  BOOL v16 = [(ANPlaybackManager *)self _playAnnouncements:v15 announceIDToStart:v10 options:a4 completionHandler:v9];
  return v16;
}

- (id)_announcementsForPlaybackOptions:(unint64_t)a3 fromAnnouncements:(id)a4
{
  char v4 = a3;
  char v5 = ~(_BYTE)a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if ((v5 & 0xC0) == 0) {
    goto LABEL_2;
  }
  if (v4 < 0)
  {
    id v8 = [v6 unplayedAnnouncements];
  }
  else
  {
    if ((v4 & 0x40) == 0)
    {
LABEL_2:
      id v8 = v6;
      goto LABEL_7;
    }
    id v8 = [v6 playedAnnouncements];
  }
LABEL_7:
  id v9 = v8;

  return v9;
}

- (id)_nextAnnouncementToPlay
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (([(ANPlaybackManager *)self playbackOptions] & 0x20) != 0)
  {
    unint64_t v3 = [(ANPlaybackManager *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "Checking for new announcements to play", buf, 2u);
    }

    char v4 = [(ANPlaybackManager *)self dataSource];
    uint64_t v5 = [v4 announcementsForPlaybackManager:self];

    v43 = (void *)v5;
    id v6 = [(ANPlaybackManager *)self _announcementsForPlaybackOptions:[(ANPlaybackManager *)self playbackOptions] fromAnnouncements:v5];
    uint64_t v7 = [(ANPlaybackManager *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = [(ANPlaybackManager *)self playbackOptions];
      uint64_t v9 = [v6 count];
      *(_DWORD *)buf = 134218240;
      unint64_t v49 = v8;
      __int16 v50 = 2048;
      uint64_t v51 = v9;
      _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "Current Announcements in Storage for Playback Options (%lu): %lu", buf, 0x16u);
    }

    id v10 = [(ANPlaybackManager *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(ANPlaybackManager *)self announcementsToPlay];
      uint64_t v12 = [v11 count];
      *(_DWORD *)buf = 134217984;
      unint64_t v49 = v12;
      _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "Current Announcements in Playback Queue: = %lu", buf, 0xCu);
    }
    int v13 = [(ANPlaybackManager *)self announcementsToPlay];
    uint64_t v14 = [v13 lastObject];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          __int16 v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          int v21 = [v14 receiptTimestamp];
          [v21 timeIntervalSince1970];
          double v23 = v22;
          uint64_t v24 = [v20 receiptTimestamp];
          [v24 timeIntervalSince1970];
          double v26 = v25;

          if (v23 <= v26)
          {
            char v27 = [(ANPlaybackManager *)self announcementsToPlay];
            char v28 = [v27 containsObject:v20];

            if ((v28 & 1) == 0)
            {
              v29 = [(ANPlaybackManager *)self announcementsToPlay];
              [v29 addObject:v20];

              unint64_t v30 = [(ANPlaybackManager *)self log];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v31 = [v20 identifier];
                *(_DWORD *)buf = 138412290;
                unint64_t v49 = (unint64_t)v31;
                _os_log_impl(&dword_1DA5ED000, v30, OS_LOG_TYPE_DEFAULT, "Added Announcement to Play Queue: %@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v17);
    }
  }
  uint64_t v32 = [(ANPlaybackManager *)self announcementsToPlay];
  if (v32)
  {
    BOOL v33 = [(ANPlaybackManager *)self announcementsToPlay];
    unint64_t v34 = [v33 count];
    unint64_t v35 = [(ANPlaybackManager *)self lastAnnoucementIndex];

    if (v34 <= v35)
    {
      uint64_t v32 = 0;
    }
    else
    {
      v36 = [(ANPlaybackManager *)self announcementsToPlay];
      uint64_t v32 = objc_msgSend(v36, "objectAtIndex:", -[ANPlaybackManager lastAnnoucementIndex](self, "lastAnnoucementIndex"));

      v37 = [(ANPlaybackManager *)self log];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v38 = [(ANPlaybackManager *)self lastAnnoucementIndex] + 1;
        long long v39 = [(ANPlaybackManager *)self announcementsToPlay];
        uint64_t v40 = [v39 count];
        long long v41 = [v32 identifier];
        *(_DWORD *)buf = 134218498;
        unint64_t v49 = v38;
        __int16 v50 = 2048;
        uint64_t v51 = v40;
        __int16 v52 = 2112;
        uint64_t v53 = v41;
        _os_log_impl(&dword_1DA5ED000, v37, OS_LOG_TYPE_DEFAULT, "Next Announcement To Play (%ld of %ld): %@", buf, 0x20u);
      }
      [(ANPlaybackManager *)self setLastAnnoucementIndex:[(ANPlaybackManager *)self lastAnnoucementIndex] + 1];
    }
  }
  return v32;
}

- (id)_createTrackPlayerWithAnnouncement:(id)a3 options:(unint64_t)a4 anchorPoint:(unint64_t *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [v8 playbackDeadline];
  id v10 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "PlaybackDeadline: %@", (uint8_t *)&buf, 0xCu);
  }

  if ((a4 & 0x10) != 0)
  {
    uint64_t v14 = [ANAnchorTrackPlayer alloc];
    id v15 = [(ANPlaybackManager *)self endpointID];
    uint64_t v16 = [(ANTrackPlayer *)v14 initWithOptions:a4 endpointUUID:v15];

    int v13 = v16;
    memset(&buf, 0, sizeof(buf));
    if (v8) {
      [v8 cmStartTime];
    }
    unint64_t v17 = [v8 machStartTime];
    if ((a4 & 4) != 0)
    {
      memset(&v60, 0, sizeof(v60));
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&v60, HostTimeClock);
      CMTime time1 = v60;
      CMTime time2 = buf;
      if (CMTimeCompare(&time1, &time2) == 1)
      {
        [MEMORY[0x1E4F4A940] machTimeToSeconds:v17];
        CMTimeValue v20 = v19;
        if (([v8 statusFlags] & 3) == 0)
        {
          int v21 = [(ANPlaybackManager *)self log];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            [MEMORY[0x1E4F4A940] machTimeToSeconds:mach_absolute_time()];
            LODWORD(time1.value) = 134218240;
            *(CMTimeValue *)((char *)&time1.value + 4) = v20;
            LOWORD(time1.flags) = 2048;
            *(void *)((char *)&time1.flags + 2) = v22;
            _os_log_impl(&dword_1DA5ED000, v21, OS_LOG_TYPE_DEFAULT, "Announcement will play in the past: %f, now: %f", (uint8_t *)&time1, 0x16u);
          }

          double v23 = +[ANAnalytics shared];
          uint64_t v24 = [(ANPlaybackManager *)self endpointID];
          double v25 = +[ANAnalyticsContext contextWithEndpointID:v24];
          [v23 error:5003 context:v25];
        }
        [MEMORY[0x1E4F4A940] machTimeToSeconds:mach_absolute_time()];
        double v27 = v26;
        char v28 = [MEMORY[0x1E4F4A8E0] sharedInstance];
        v29 = [v28 numberForDefault:*MEMORY[0x1E4F4A5B0]];
        [v29 doubleValue];
        Float64 v31 = v30;

        CMTimeMakeWithSeconds(&rhs, v31, v60.timescale);
        CMTime time2 = v60;
        CMTimeAdd(&time1, &time2, &rhs);
        CMTime buf = time1;
        unint64_t v17 = [MEMORY[0x1E4F4A940] secondsToMachTime:v27 + v31];
        uint64_t v32 = [(ANPlaybackManager *)self log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(time1.value) = 134218240;
          *(CMTimeValue *)((char *)&time1.value + 4) = buf.value / buf.timescale;
          LOWORD(time1.flags) = 2048;
          *(void *)((char *)&time1.flags + 2) = v17;
          _os_log_impl(&dword_1DA5ED000, v32, OS_LOG_TYPE_DEFAULT, "Updated CM Start Time = %lld, Mach Start Time = %llu", (uint8_t *)&time1, 0x16u);
        }
      }
    }
    CMTime v57 = buf;
    [(ANSimpleTrackPlayer *)v13 setStartTime:&v57];
    *a5 = v17;
  }
  else
  {
    id v11 = [ANSimpleTrackPlayer alloc];
    uint64_t v12 = [(ANPlaybackManager *)self endpointID];
    int v13 = [(ANTrackPlayer *)v11 initWithOptions:a4 endpointUUID:v12];

    *a5 = mach_absolute_time();
  }
  [(ANTrackPlayer *)v13 setDelegate:self];
  BOOL v33 = [(ANPlaybackManager *)self playbackQueue];
  [(ANTrackPlayer *)v13 setDelegateQueue:v33];

  unint64_t v34 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  unint64_t v35 = [v34 numberForDefault:*MEMORY[0x1E4F4A5C8]];
  [v35 doubleValue];
  [(ANTrackPlayer *)v13 setSilenceBetweenEachTrack:v36 / 1000.0];

  if ((a4 & 2) != 0)
  {
    v37 = (void *)MEMORY[0x1E4F1CB10];
    int64_t v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v39 = [v38 pathForResource:@"AnnounceNotification" ofType:@"wav"];
    uint64_t v40 = [v37 fileURLWithPath:v39];
    [(ANTrackPlayer *)v13 setAudioFileAtStart:v40];

    long long v41 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    v42 = [v41 numberForDefault:*MEMORY[0x1E4F4A5D0]];
    [v42 doubleValue];
    double v44 = v43;

    [(ANTrackPlayer *)v13 setTrimStartTone:v44];
  }
  if ((a4 & 8) == 0)
  {
    long long v45 = (void *)MEMORY[0x1E4F1CB10];
    long long v46 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v47 = [v46 pathForResource:@"AnnounceInBetween" ofType:@"wav"];
    v48 = [v45 fileURLWithPath:v47];
    [(ANTrackPlayer *)v13 setAudioFileTransition:v48];

    unint64_t v49 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    __int16 v50 = [v49 numberForDefault:*MEMORY[0x1E4F4A5E0]];
    [v50 doubleValue];
    double v52 = v51;

    [(ANTrackPlayer *)v13 setTrimTransitionTone:v52];
  }
  uint64_t v53 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  uint64_t v54 = [v53 numberForDefault:*MEMORY[0x1E4F4A5B8]];
  [v54 doubleValue];
  [(ANTrackPlayer *)v13 setPreviousSkipGoesToPreviousTrackDelta:v55 / 1000.0];

  return v13;
}

- (BOOL)_startPlayingAnnouncements
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(ANPlaybackManager *)self announcementsToPlay];
    uint64_t v5 = [v4 count];
    uint64_t v6 = v5 - [(ANPlaybackManager *)self lastAnnoucementIndex];
    uint64_t v7 = [(ANPlaybackManager *)self announcementsToPlay];
    *(_DWORD *)CMTime buf = 134218240;
    uint64_t v44 = v6;
    __int16 v45 = 2048;
    uint64_t v46 = [v7 count];
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "Will Play (%ld of %ld) Announcements", buf, 0x16u);
  }
  id v8 = [(ANPlaybackManager *)self _nextAnnouncementToPlay];
  if (v8)
  {
    uint64_t v9 = [(ANPlaybackManager *)self endpointID];
    int v10 = objc_msgSend(v9, "an_isLocalDevice");

    if (v10)
    {
      unint64_t v11 = [(ANPlaybackManager *)self playbackOptions] & 2;
      unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL | ([(ANPlaybackManager *)self playbackOptions] >> 8) & 1;
      int v13 = [MEMORY[0x1E4F4A948] sharedController];
      [v13 setVolumeWithOptions:v12];
    }
    uint64_t v42 = 0;
    uint64_t v14 = [(ANPlaybackManager *)self _createTrackPlayerWithAnnouncement:v8 options:[(ANPlaybackManager *)self playbackOptions] anchorPoint:&v42];
    [(ANPlaybackManager *)self setAudioPlayer:v14];

    id v15 = v8;
    *(void *)&long long v16 = 138412546;
    long long v40 = v16;
    while (1)
    {
      uint64_t v17 = objc_msgSend(v15, "filePath", v40);
      BOOL v18 = v17 != 0;
      if (!v17) {
        break;
      }
      CMTimeValue v19 = (void *)v17;
      CMTimeValue v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
      int v21 = v20;
      if (v20)
      {
        [v20 audioDuration];
        if (v22 == 0.0)
        {
          uint64_t v23 = *(void *)&v22;
          uint64_t v24 = [(ANPlaybackManager *)self log];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = v40;
            uint64_t v44 = (uint64_t)v21;
            __int16 v45 = 2048;
            uint64_t v46 = v23;
            _os_log_error_impl(&dword_1DA5ED000, v24, OS_LOG_TYPE_ERROR, "Adding empty audio file to player: %@, duration = %f seconds", buf, 0x16u);
          }

          double v25 = +[ANAnalytics shared];
          double v26 = [(ANPlaybackManager *)self endpointID];
          double v27 = +[ANAnalyticsContext contextWithEndpointID:v26];
          [v25 error:5032 context:v27];
        }
      }
      char v28 = [(ANPlaybackManager *)self audioPlayer];
      v29 = [v15 filePath];
      double v30 = [v15 identifier];
      [v28 add:v29 announcementID:v30];

      uint64_t v31 = [(ANPlaybackManager *)self _nextAnnouncementToPlay];

      id v15 = (id)v31;
      if (!v31)
      {
        id v15 = [(ANPlaybackManager *)self audioPlayer];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __47__ANPlaybackManager__startPlayingAnnouncements__block_invoke;
        v41[3] = &unk_1E6BCE3D0;
        v41[4] = self;
        v41[5] = v42;
        [v15 playWithCompletionHandler:v41];
        goto LABEL_19;
      }
    }
    BOOL v33 = [(ANPlaybackManager *)self log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      [(ANPlaybackManager *)(uint64_t)v15 _startPlayingAnnouncements];
    }

    unint64_t v34 = +[ANAnalytics shared];
    unint64_t v35 = [(ANPlaybackManager *)self endpointID];
    double v36 = +[ANAnalyticsContext contextWithEndpointID:v35];
    [v34 error:5034 context:v36];

    v37 = [(ANPlaybackManager *)self audioPlayer];
    int64_t v38 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 5034, *MEMORY[0x1E4F4A730]);
    [(ANPlaybackManager *)self _handlePlaybackEndedForPlayer:v37 withError:v38];

LABEL_19:
  }
  else
  {
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1022, *MEMORY[0x1E4F4A730]);
    [(ANPlaybackManager *)self _handlePlaybackEndedForPlayer:0 withError:v32];

    BOOL v18 = 0;
  }

  return v18;
}

void __47__ANPlaybackManager__startPlayingAnnouncements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) playbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ANPlaybackManager__startPlayingAnnouncements__block_invoke_2;
  block[3] = &unk_1E6BCDFE0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __47__ANPlaybackManager__startPlayingAnnouncements__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v3 = [*(id *)(a1 + 40) audioPlayer];
    objc_msgSend(v2, "_handlePlaybackEndedForPlayer:withError:");
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) delegate];
    [v3 playbackManager:*(void *)(a1 + 40) didStartPlayingAnnouncementsAtMachAbsoluteTime:*(void *)(a1 + 48)];
  }
}

- (void)_stopAudioPlayer
{
  id v3 = [(ANPlaybackManager *)self audioPlayer];

  if (v3)
  {
    char v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    uint64_t v5 = [(ANPlaybackManager *)self audioPlayer];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__ANPlaybackManager__stopAudioPlayer__block_invoke;
    v7[3] = &unk_1E6BCE238;
    id v8 = v4;
    uint64_t v6 = v4;
    [v5 stopWithCompletionHandler:v7];

    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __37__ANPlaybackManager__stopAudioPlayer__block_invoke(uint64_t a1)
{
}

- (void)_handlePlaybackEndedForPlayer:(id)a3 withError:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  [(ANPlaybackManager *)self setAnnouncementsToPlay:0];
  [v6 end];
  if (v17) {
    uint64_t v7 = 10;
  }
  else {
    uint64_t v7 = 14;
  }
  id v8 = [v6 activelyPlayingAnnouncementID];
  [(ANPlaybackManager *)self _updatePlaybackInfoForAnnouncementID:v8 options:v7 player:v6];

  if (v17)
  {
    id v9 = v17;
    if ([v17 code] != 1037) {
      goto LABEL_8;
    }
  }
  id v9 = 0;
LABEL_8:
  uint64_t v10 = [(ANPlaybackManager *)self playbackCompletionHandler];

  if (v10)
  {
    uint64_t v11 = [(ANPlaybackManager *)self playbackCompletionHandler];
    ((void (**)(void, void *))v11)[2](v11, v9);

    [(ANPlaybackManager *)self setPlaybackCompletionHandler:0];
  }
  if (v9)
  {
    unint64_t v12 = +[ANAnalytics shared];
    uint64_t v13 = [v9 code];
    uint64_t v14 = [(ANPlaybackManager *)self endpointID];
    id v15 = +[ANAnalyticsContext contextWithEndpointID:v14];
    [v12 error:v13 context:v15];
  }
  long long v16 = [(ANPlaybackManager *)self delegate];
  [v16 playbackManagerDidFinishPlayingAnnouncements:self];
}

- (void)trackPlayer:(id)a3 didUpdatePlaybackState:(unint64_t)a4 announcementID:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(ANPlaybackManager *)self playbackQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218242;
    unint64_t v16 = a4;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "Did Update Playback State: %lu, AnnouncementID: %@", (uint8_t *)&v15, 0x16u);
  }

  unint64_t v12 = [(ANPlaybackManager *)self delegate];
  uint64_t v13 = [(ANPlaybackManager *)self audioPlayer];
  objc_msgSend(v12, "playbackManager:didUpdatePlaybackState:announcement:", self, objc_msgSend(v13, "playbackState"), v8);

  if (a4 == 1) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 2;
  }
  [(ANPlaybackManager *)self _updatePlaybackInfoForAnnouncementID:v8 options:v14 player:v9];
}

- (void)trackPlayer:(id)a3 didFinishPlayingTrackType:(int64_t)a4 announcementID:(id)a5 error:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(ANPlaybackManager *)self playbackQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = [(ANPlaybackManager *)self log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136315138;
    long long v39 = "-[ANPlaybackManager trackPlayer:didFinishPlayingTrackType:announcementID:error:]";
    _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v38, 0xCu);
  }

  id v15 = [(ANPlaybackManager *)self audioPlayer];

  if (v15 == v10)
  {
    unint64_t v16 = [(ANPlaybackManager *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 134218242;
      long long v39 = (const char *)a4;
      __int16 v40 = 2112;
      int64_t v41 = (int64_t)v11;
      _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "Audio Player Finished Playing trackType: %ld, AnnouncementID: %@", (uint8_t *)&v38, 0x16u);
    }

    if (v12)
    {
      __int16 v17 = [(ANPlaybackManager *)self log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ANPlaybackManager trackPlayer:didFinishPlayingTrackType:announcementID:error:]((uint64_t)v11, (uint64_t)v12, v17);
      }

      [(ANPlaybackManager *)self _stopAudioPlayer];
      id v18 = self;
      id v19 = v10;
      id v20 = v12;
LABEL_10:
      [(ANPlaybackManager *)v18 _handlePlaybackEndedForPlayer:v19 withError:v20];
      goto LABEL_11;
    }
    if (([(ANPlaybackManager *)self playbackOptions] & 0x20) != 0)
    {
      int v21 = [(ANPlaybackManager *)self log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1DA5ED000, v21, OS_LOG_TYPE_DEFAULT, "Looking for new announcements", (uint8_t *)&v38, 2u);
      }

      uint64_t v22 = [(ANPlaybackManager *)self _nextAnnouncementToPlay];
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        do
        {
          uint64_t v24 = [(ANPlaybackManager *)self audioPlayer];
          double v25 = [v23 filePath];
          double v26 = [v23 identifier];
          [v24 add:v25 announcementID:v26];

          uint64_t v27 = [(ANPlaybackManager *)self _nextAnnouncementToPlay];

          uint64_t v23 = (void *)v27;
        }
        while (v27);
      }
    }
    char v28 = [(ANPlaybackManager *)self audioPlayer];
    int v29 = [v28 numberActiveTracks];

    if (!v29)
    {
      uint64_t v32 = [(ANPlaybackManager *)self log];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1DA5ED000, v32, OS_LOG_TYPE_DEFAULT, "Audio Player Finished, we are done!", (uint8_t *)&v38, 2u);
      }

      [(ANPlaybackManager *)self _stopAudioPlayer];
      id v18 = self;
      id v19 = v10;
      id v20 = 0;
      goto LABEL_10;
    }
    double v30 = [(ANPlaybackManager *)self log];
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (a4)
    {
      if (v31)
      {
        int v38 = 136315394;
        long long v39 = "-[ANPlaybackManager trackPlayer:didFinishPlayingTrackType:announcementID:error:]";
        __int16 v40 = 2048;
        int64_t v41 = a4;
        _os_log_impl(&dword_1DA5ED000, v30, OS_LOG_TYPE_DEFAULT, "%s: Ignoring track player of type %ld", (uint8_t *)&v38, 0x16u);
      }
    }
    else
    {
      if (v31)
      {
        int v38 = 136315138;
        long long v39 = "-[ANPlaybackManager trackPlayer:didFinishPlayingTrackType:announcementID:error:]";
        _os_log_impl(&dword_1DA5ED000, v30, OS_LOG_TYPE_DEFAULT, "%s: there are still outstanding players. Keep Announce active", (uint8_t *)&v38, 0xCu);
      }

      [(ANPlaybackManager *)self _updatePlaybackInfoForAnnouncementID:v11 options:14 player:v10];
      BOOL v33 = [(ANPlaybackManager *)self audioPlayer];
      uint64_t v34 = [v33 playbackState];

      if (v34)
      {
        unint64_t v35 = [(ANPlaybackManager *)self audioPlayer];
        double v36 = [v35 activelyPlayingAnnouncementID];
        [(ANPlaybackManager *)self _updatePlaybackInfoForAnnouncementID:v36 options:3 player:v10];
      }
      else
      {
        v37 = ANLogHandlePlaybackManager();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = 138412290;
          long long v39 = (const char *)&stru_1F34A0E10;
          _os_log_impl(&dword_1DA5ED000, v37, OS_LOG_TYPE_DEFAULT, "%@Audio Player is stopped. Not updating playback info.", (uint8_t *)&v38, 0xCu);
        }
      }
    }
  }
LABEL_11:
}

- (NSUUID)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(id)a3
{
}

- (ANPlaybackManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANPlaybackManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ANPlaybackManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (ANPlaybackManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (ANTrackPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (NSMutableDictionary)playbackInfo
{
  return self->_playbackInfo;
}

- (NSMutableOrderedSet)announcementsToPlay
{
  return self->_announcementsToPlay;
}

- (void)setAnnouncementsToPlay:(id)a3
{
}

- (int64_t)lastAnnoucementIndex
{
  return self->_lastAnnoucementIndex;
}

- (void)setLastAnnoucementIndex:(int64_t)a3
{
  self->_lastAnnoucementIndex = a3;
}

- (unint64_t)playbackOptions
{
  return self->_playbackOptions;
}

- (OS_dispatch_queue)playbackQueue
{
  return self->_playbackQueue;
}

- (id)playbackCompletionHandler
{
  return self->_playbackCompletionHandler;
}

- (void)setPlaybackCompletionHandler:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_playbackCompletionHandler, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_announcementsToPlay, 0);
  objc_storeStrong((id *)&self->_playbackInfo, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpointID, 0);
}

- (void)_updatePlaybackInfoForAnnouncementID:(os_log_t)log options:player:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA5ED000, log, OS_LOG_TYPE_ERROR, "Announcement ID nil when updating state to playing", v1, 2u);
}

- (void)_startPlayingAnnouncements
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA5ED000, a2, OS_LOG_TYPE_ERROR, "Announcement does not contain a file path. Announcement: %@", (uint8_t *)&v2, 0xCu);
}

- (void)trackPlayer:(os_log_t)log didFinishPlayingTrackType:announcementID:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DA5ED000, log, OS_LOG_TYPE_ERROR, "Audio Player Finished Playing with error. AnnouncementID = %@, Error = %@", (uint8_t *)&v3, 0x16u);
}

@end