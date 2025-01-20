@interface ANTonePlayer
- (ANTonePlayer)initWithAudioSessionID:(unsigned int)a3 endpointUUID:(id)a4;
- (AVAudioSession)audioSession;
- (AVPlayer)player;
- (AVPlayerItem)playerItem;
- (BOOL)_activateAudioSessionForPlayer:(id)a3 error:(id *)a4;
- (BOOL)usingProxyAudioSession;
- (NSUUID)endpointUUID;
- (OS_os_log)log;
- (id)handler;
- (unsigned)proxyAudioSessionID;
- (void)_callHandler:(id)a3;
- (void)_deactivateAudioSession;
- (void)_deregisterForNotificationsWithAudioSession:(id)a3;
- (void)_handleFailure;
- (void)_handlePlayerItemFailedToPlayToEnd:(id)a3;
- (void)_handlePlayerItemPlayedToEnd:(id)a3;
- (void)_playFileURL:(id)a3;
- (void)_playSystemSoundWithFileURL:(id)a3;
- (void)_registerForNotificationsWithAudioSession:(id)a3;
- (void)audioSessionInterruptionHandler:(id)a3;
- (void)dealloc;
- (void)playFileURL:(id)a3 completionHandler:(id)a4;
- (void)playerRateChangedHandler:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setHandler:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setProxyAudioSessionID:(unsigned int)a3;
- (void)setUsingProxyAudioSession:(BOOL)a3;
- (void)stop;
@end

@implementation ANTonePlayer

- (ANTonePlayer)initWithAudioSessionID:(unsigned int)a3 endpointUUID:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ANTonePlayer;
  v8 = [(ANTonePlayer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpointUUID, a4);
    v9->_proxyAudioSessionID = a3;
    v9->_usingProxyAudioSession = 0;
    ANLogBuildCategoryName();
    uint64_t v10 = ANLogWithCategory();
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(ANTonePlayer *)self audioSession];
  [(ANTonePlayer *)self _deregisterForNotificationsWithAudioSession:v3];

  v4.receiver = self;
  v4.super_class = (Class)ANTonePlayer;
  [(ANTonePlayer *)&v4 dealloc];
}

- (void)playFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(ANTonePlayer *)self setHandler:a4];
  id v7 = (void *)MEMORY[0x1E4F153E0];
  uint64_t v8 = [(ANTonePlayer *)self proxyAudioSessionID];
  v9 = [(ANTonePlayer *)self endpointUUID];
  id v19 = 0;
  uint64_t v10 = [v7 audioSessionWithProxyAudioSessionID:v8 endpointID:v9 error:&v19];
  id v11 = v19;
  [(ANTonePlayer *)self setAudioSession:v10];

  v12 = [(ANTonePlayer *)self audioSession];

  if (v12)
  {
    objc_super v13 = [(ANTonePlayer *)self audioSession];
    int v14 = [v13 opaqueSessionID];
    unsigned int v15 = [(ANTonePlayer *)self proxyAudioSessionID];

    if (v14 == v15)
    {
      [(ANTonePlayer *)self setUsingProxyAudioSession:1];
    }
    else
    {
      [(ANTonePlayer *)self setUsingProxyAudioSession:0];
      [(ANTonePlayer *)self setProxyAudioSessionID:0];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__ANTonePlayer_playFileURL_completionHandler___block_invoke;
    block[3] = &unk_1E6BCDC78;
    block[4] = self;
    id v18 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v16 = [(ANTonePlayer *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ANTonePlayer playFileURL:completionHandler:]((uint64_t)v11, v16);
    }

    [(ANTonePlayer *)self _playSystemSoundWithFileURL:v6];
  }
}

uint64_t __46__ANTonePlayer_playFileURL_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playFileURL:*(void *)(a1 + 40)];
}

- (void)stop
{
  id v2 = [(ANTonePlayer *)self player];
  [v2 pause];
}

- (void)_playSystemSoundWithFileURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)MEMORY[0x1E4F74F68];
  CFURLRef v5 = (const __CFURL *)a3;
  id v6 = [v4 sharedAVSystemController];
  int v7 = objc_msgSend(v6, "an_isCarPlayConnected");

  uint64_t v8 = [(ANTonePlayer *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = v7;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "CarPlay is Connected: %d", buf, 8u);
  }

  *(_DWORD *)buf = 0;
  AudioServicesCreateSystemSoundID(v5, (SystemSoundID *)buf);

  v9 = objc_opt_new();
  uint64_t v10 = v9;
  if (v7) {
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F18A28]];
  }
  id v11 = dispatch_get_global_queue(25, 0);
  dispatch_time_t v12 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ANTonePlayer__playSystemSoundWithFileURL___block_invoke;
  block[3] = &unk_1E6BCE288;
  int v17 = *(_DWORD *)buf;
  id v15 = v10;
  v16 = self;
  id v13 = v10;
  dispatch_after(v12, v11, block);
}

uint64_t __44__ANTonePlayer__playSystemSoundWithFileURL___block_invoke()
{
  return AudioServicesPlaySystemSoundWithOptions();
}

uint64_t __44__ANTonePlayer__playSystemSoundWithFileURL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callHandler:0];
}

- (void)_playFileURL:(id)a3
{
  objc_super v4 = [MEMORY[0x1E4F16608] playerWithURL:a3];
  [(ANTonePlayer *)self setPlayer:v4];

  CFURLRef v5 = [(ANTonePlayer *)self player];
  id v20 = 0;
  BOOL v6 = [(ANTonePlayer *)self _activateAudioSessionForPlayer:v5 error:&v20];
  id v7 = v20;

  if (v6)
  {
    uint64_t v8 = [(ANTonePlayer *)self audioSession];
    [(ANTonePlayer *)self _registerForNotificationsWithAudioSession:v8];

    v9 = [(ANTonePlayer *)self player];
    uint64_t v10 = [v9 currentItem];
    [(ANTonePlayer *)self setPlayerItem:v10];

    uint64_t v11 = [(ANTonePlayer *)self endpointUUID];
    if (!v11
      || (dispatch_time_t v12 = (void *)v11,
          [(ANTonePlayer *)self endpointUUID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = objc_msgSend(v13, "an_isLocalDevice"),
          v13,
          v12,
          v14))
    {
      id v15 = [MEMORY[0x1E4F4A948] sharedController];
      [v15 setVolumeWithOptions:1];
    }
    v16 = [(ANTonePlayer *)self player];
    [v16 play];

    int v17 = [(ANTonePlayer *)self log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v19 = 0;
      _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_DEFAULT, "Playback started", v19, 2u);
    }
  }
  else
  {
    id v18 = [(ANTonePlayer *)self log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ANTonePlayer _playFileURL:]((uint64_t)v7, v18);
    }

    [(ANTonePlayer *)self _callHandler:v7];
  }
}

- (BOOL)_activateAudioSessionForPlayer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ANTonePlayer *)self audioSession];
  [v6 setAudioSession:v7];

  if ([(ANTonePlayer *)self usingProxyAudioSession])
  {
    uint64_t v8 = [(ANTonePlayer *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v12 = 0;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "Using proxy audio session. Skipping activation.", v12, 2u);
    }

    return 1;
  }
  else
  {
    uint64_t v10 = [(ANTonePlayer *)self audioSession];
    char v11 = [v10 setActive:1 error:a4];

    return v11;
  }
}

- (void)_deactivateAudioSession
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(ANTonePlayer *)self usingProxyAudioSession])
  {
    objc_super v4 = [(ANTonePlayer *)self audioSession];
    int v5 = [v4 opaqueSessionID];

    id v6 = [(ANTonePlayer *)self audioSession];
    id v11 = 0;
    int v7 = [v6 setActive:0 withOptions:1 error:&v11];
    v3 = v11;

    uint64_t v8 = [(ANTonePlayer *)self log];
    v9 = v8;
    if (v7)
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v10 = [(ANTonePlayer *)self audioSession];
      *(_DWORD *)buf = 138412546;
      id v13 = v10;
      __int16 v14 = 1024;
      int v15 = v5;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "Deactivated audio session %@ (ID = %d)", buf, 0x12u);
    }
    else
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      uint64_t v10 = [(ANTonePlayer *)self audioSession];
      *(_DWORD *)buf = 138412802;
      id v13 = v10;
      __int16 v14 = 1024;
      int v15 = v5;
      __int16 v16 = 2112;
      int v17 = v3;
      _os_log_error_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_ERROR, "Failed to deactivate audio session %@ (ID = %d), Error = %@", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
  v3 = [(ANTonePlayer *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "Using proxy audio session. Skipping deactivation.", buf, 2u);
  }
LABEL_10:
}

- (void)_registerForNotificationsWithAudioSession:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel_audioSessionInterruptionHandler_ name:*MEMORY[0x1E4F15000] object:v5];

  int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__handleFailure name:*MEMORY[0x1E4F15030] object:0];

  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__handleFailure name:*MEMORY[0x1E4F15048] object:0];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__handlePlayerItemPlayedToEnd_ name:*MEMORY[0x1E4F16020] object:0];

  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__handlePlayerItemFailedToPlayToEnd_ name:*MEMORY[0x1E4F16030] object:0];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_playerRateChangedHandler_ name:*MEMORY[0x1E4F16068] object:0];
}

- (void)_deregisterForNotificationsWithAudioSession:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F15000] object:v5];

  int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F15030] object:0];

  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4F15048] object:0];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self name:*MEMORY[0x1E4F16020] object:0];

  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self name:*MEMORY[0x1E4F16030] object:0];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 removeObserver:self name:*MEMORY[0x1E4F16068] object:0];
}

- (void)audioSessionInterruptionHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(ANTonePlayer *)self audioSession];

    int v7 = [(ANTonePlayer *)self log];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 != v6)
    {
      if (v8)
      {
        v9 = [(ANTonePlayer *)self audioSession];
        int v18 = 138412546;
        int v19 = v9;
        __int16 v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "Received Audio Session Interruption Notification for different Audio Session. Expected: %@, Actual: %@", (uint8_t *)&v18, 0x16u);
      }
      goto LABEL_8;
    }
    if (v8)
    {
      int v18 = 138412290;
      int v19 = v5;
      _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "Received Audio Session Interruption Notification for Audio Session %@", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v10 = [v4 userInfo];
    int v7 = v10;
    if (v10)
    {
      id v11 = [v10 valueForKey:*MEMORY[0x1E4F15020]];
      dispatch_time_t v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 unsignedIntegerValue];
        if (!v13)
        {
          int v17 = [(ANTonePlayer *)self log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_DEFAULT, "Audio Session Interruption Ended. Not playing. Doing nothing.", (uint8_t *)&v18, 2u);
          }

          goto LABEL_29;
        }
        if (v13 == 1)
        {
          __int16 v14 = [(ANTonePlayer *)self log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_DEFAULT, "Audio Session Interruption Began", (uint8_t *)&v18, 2u);
          }

          int v15 = [(ANTonePlayer *)self player];
          [v15 pause];
        }
        else
        {
          int v15 = [(ANTonePlayer *)self log];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[ANTonePlayer audioSessionInterruptionHandler:].cold.4();
          }
        }
      }
      else
      {
        int v15 = [(ANTonePlayer *)self log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[ANTonePlayer audioSessionInterruptionHandler:]();
        }
      }

      [(ANTonePlayer *)self _handleFailure];
LABEL_29:

      goto LABEL_8;
    }
    __int16 v16 = [(ANTonePlayer *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ANTonePlayer audioSessionInterruptionHandler:]();
    }

    [(ANTonePlayer *)self _handleFailure];
  }
  else
  {
    int v7 = [(ANTonePlayer *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ANTonePlayer audioSessionInterruptionHandler:]();
    }
  }
LABEL_8:
}

- (void)_handleFailure
{
  v3 = [(ANTonePlayer *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "Handling Failure. Deactivating Audio Session and Ending Playback.", v4, 2u);
  }

  [(ANTonePlayer *)self _deactivateAudioSession];
  [(ANTonePlayer *)self _callHandler:0];
}

- (void)_handlePlayerItemFailedToPlayToEnd:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [(ANTonePlayer *)self playerItem];
  if (v7)
  {
    BOOL v8 = (void *)v7;
    id v9 = [(ANTonePlayer *)self playerItem];

    if (v6 == v9)
    {
      uint64_t v10 = [(ANTonePlayer *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ANTonePlayer _handlePlayerItemFailedToPlayToEnd:]();
      }

      [(ANTonePlayer *)self _handleFailure];
    }
  }
}

- (void)_handlePlayerItemPlayedToEnd:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [(ANTonePlayer *)self playerItem];
  if (v7)
  {
    BOOL v8 = (void *)v7;
    id v9 = [(ANTonePlayer *)self playerItem];

    if (v6 == v9)
    {
      uint64_t v10 = [(ANTonePlayer *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "Tone Player Finished Playing", v11, 2u);
      }

      [(ANTonePlayer *)self _deactivateAudioSession];
      [(ANTonePlayer *)self _callHandler:0];
    }
  }
}

- (void)playerRateChangedHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    id v6 = [(ANTonePlayer *)self player];

    if (v5 == v6)
    {
      uint64_t v7 = [(ANTonePlayer *)self log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        double v14 = *(double *)&v4;
        _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "|> Rate Changed Notification: %@", (uint8_t *)&v13, 0xCu);
      }

      BOOL v8 = [(ANTonePlayer *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        [v5 rate];
        int v13 = 134217984;
        double v14 = v9;
        _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "|> Player Rate: %f", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v10 = [v4 userInfo];
      id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F16070]];

      if (v11 && [v11 isEqualToString:*MEMORY[0x1E4F16080]])
      {
        dispatch_time_t v12 = [(ANTonePlayer *)self log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[ANTonePlayer playerRateChangedHandler:]();
        }

        [(ANTonePlayer *)self _handleFailure];
      }
    }
  }
}

- (void)_callHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(ANTonePlayer *)self handler];

  if (v4)
  {
    id v5 = [(ANTonePlayer *)self handler];
    ((void (**)(void, id))v5)[2](v5, v6);

    [(ANTonePlayer *)self setHandler:0];
  }
}

- (unsigned)proxyAudioSessionID
{
  return self->_proxyAudioSessionID;
}

- (void)setProxyAudioSessionID:(unsigned int)a3
{
  self->_proxyAudioSessionID = a3;
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (BOOL)usingProxyAudioSession
{
  return self->_usingProxyAudioSession;
}

- (void)setUsingProxyAudioSession:(BOOL)a3
{
  self->_usingProxyAudioSession = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

- (void)playFileURL:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA5ED000, a2, OS_LOG_TYPE_ERROR, "Failed to create Audio Session. Error = %@", (uint8_t *)&v2, 0xCu);
}

- (void)_playFileURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA5ED000, a2, OS_LOG_TYPE_ERROR, "Failed to activate Audio Session. Error = %@", (uint8_t *)&v2, 0xCu);
}

- (void)audioSessionInterruptionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "Received Audio Session Interruption Notification Without an Audio Session", v2, v3, v4, v5, v6);
}

- (void)audioSessionInterruptionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "Invalid audio session interruption notification", v2, v3, v4, v5, v6);
}

- (void)audioSessionInterruptionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "Missing audio session interruption type", v2, v3, v4, v5, v6);
}

- (void)audioSessionInterruptionHandler:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "Invalid audio session interruption type", v2, v3, v4, v5, v6);
}

- (void)_handlePlayerItemFailedToPlayToEnd:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "Tone Player Failed to Play to End ", v2, v3, v4, v5, v6);
}

- (void)playerRateChangedHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "|> Failed to set rate.", v2, v3, v4, v5, v6);
}

@end