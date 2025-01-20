@interface CSSiriAudioPlaybackSessionImplAVPlayerBased
- (AFAudioPlaybackRequest)request;
- (CSSiriAudioPlaybackSessionImplAVPlayerBased)initWithQueue:(id)a3 request:(id)a4 options:(unint64_t)a5;
- (NSString)description;
- (unint64_t)options;
- (void)_finalizeWithError:(id)a3;
- (void)_handleBeginInterruption;
- (void)_handleEndInterruption:(BOOL)a3;
- (void)_prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 completion:(id)a5;
- (void)_resetPlayerItem;
- (void)_startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7;
- (void)_stop:(BOOL)a3;
- (void)handleEndInterruption:(BOOL)a3;
- (void)playerItemDidPlayToEndTime:(id)a3;
- (void)playerItemFailedToPlayToEndTime:(id)a3;
- (void)prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 completion:(id)a5;
- (void)startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7;
- (void)stop:(BOOL)a3 completion:(id)a4;
@end

@implementation CSSiriAudioPlaybackSessionImplAVPlayerBased

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (unint64_t)options
{
  return self->_options;
}

- (AFAudioPlaybackRequest)request
{
  return self->_request;
}

- (void)playerItemFailedToPlayToEndTime:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased playerItemFailedToPlayToEndTime:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__CSSiriAudioPlaybackSessionImplAVPlayerBased_playerItemFailedToPlayToEndTime___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __79__CSSiriAudioPlaybackSessionImplAVPlayerBased_playerItemFailedToPlayToEndTime___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F4E478];
  v2 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) userInfo];
  v3 = [v5 objectForKey:*MEMORY[0x1E4F16028]];
  id v4 = [v1 errorWithCode:1424 description:@"Player item failed to play to end time." underlyingError:v3];
  [v2 _finalizeWithError:v4];
}

- (void)playerItemDidPlayToEndTime:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased playerItemDidPlayToEndTime:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CSSiriAudioPlaybackSessionImplAVPlayerBased_playerItemDidPlayToEndTime___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __74__CSSiriAudioPlaybackSessionImplAVPlayerBased_playerItemDidPlayToEndTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finalizeWithError:0];
}

- (void)_resetPlayerItem
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  playerItem = self->_playerItem;
  if (playerItem)
  {
    id v4 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      v8 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _resetPlayerItem]";
      __int16 v9 = 2112;
      __int16 v10 = playerItem;
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s Reset player item %@.", (uint8_t *)&v7, 0x16u);
    }
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x1E4F16020] object:self->_playerItem];
    [v5 removeObserver:self name:*MEMORY[0x1E4F16030] object:self->_playerItem];
    [(AVPlayer *)self->_player replaceCurrentItemWithPlayerItem:0];
    v6 = self->_playerItem;
    self->_playerItem = 0;
  }
}

- (void)_finalizeWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E368];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_DWORD *)v15 = 136315394;
    *(void *)&v15[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _finalizeWithError:]";
    *(_WORD *)&v15[12] = 2112;
    *(void *)&v15[14] = v4;
    int v7 = "%s error = %@";
    v8 = v5;
    uint32_t v9 = 22;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_DWORD *)v15 = 136315138;
    *(void *)&v15[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _finalizeWithError:]";
    int v7 = "%s ";
    v8 = v5;
    uint32_t v9 = 12;
  }
  _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, v7, v15, v9);
LABEL_7:
  if (self->_playerItem)
  {
    __int16 v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 removeObserver:self name:*MEMORY[0x1E4F16020] object:self->_playerItem];
    [v10 removeObserver:self name:*MEMORY[0x1E4F16030] object:self->_playerItem];
  }
  if (self->_isActive)
  {
    self->_isActive = 0;
    [(AVPlayer *)self->_player setRate:0.0];
    if (v4)
    {
      uint64_t v11 = [v4 domain];
      if ([v11 isEqualToString:*MEMORY[0x1E4F4E698]])
      {
        uint64_t v12 = [v4 code];

        if (v12 == 1408) {
          goto LABEL_16;
        }
      }
      else
      {
      }
      [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)self _resetPlayerItem];
    }
  }
LABEL_16:
  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v4);
    id v14 = self->_completion;
    self->_completion = 0;
  }
}

- (void)_handleEndInterruption:(BOOL)a3
{
  if (a3 && self->_isActive)
  {
    LODWORD(v3) = 1.0;
    [(AVPlayer *)self->_player setRate:v3];
  }
}

- (void)_handleBeginInterruption
{
}

- (void)_stop:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F4E478] errorWithCode:1408 description:@"Stopped playback."];
  [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)self _finalizeWithError:v4];

  [(AVPlayer *)self->_player setRate:0.0];
  player = self->_player;
  long long v10 = *MEMORY[0x1E4F1FA48];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v8 = v10;
  uint64_t v9 = v11;
  long long v6 = v10;
  uint64_t v7 = v11;
  [(AVPlayer *)player seekToTime:&v10 toleranceBefore:&v8 toleranceAfter:&v6];
}

- (void)_startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = (void (**)(void))a5;
  id v14 = a6;
  v15 = (void (**)(id, void *))a7;
  uint64_t v16 = (os_log_t *)MEMORY[0x1E4F4E368];
  v17 = (void *)*MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    v19 = v17;
    v20 = AFAudioPlaybackOptionsGetNames();
    *(_DWORD *)buf = 136315650;
    v28 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHandl"
          "er:finalizationHandler:]";
    __int16 v29 = 2112;
    v30 = (CSSiriAudioPlaybackSessionImplAVPlayerBased *)request;
    __int16 v31 = 2112;
    v32 = v20;
    _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_INFO, "%s request = %@, options = %@", buf, 0x20u);
  }
  if (self->_isActive)
  {
    v21 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHan"
            "dler:finalizationHandler:]";
      __int16 v29 = 2112;
      v30 = self;
      _os_log_error_impl(&dword_1C9338000, v21, OS_LOG_TYPE_ERROR, "%s Attempted to start %@ when it is already active.", buf, 0x16u);
      if (!v15) {
        goto LABEL_10;
      }
      goto LABEL_6;
    }
    if (v15)
    {
LABEL_6:
      v22 = [MEMORY[0x1E4F4E478] errorWithCode:1405 description:@"Attempted to start audio playback session when it is already active." underlyingError:0];
      v15[2](v15, v22);
    }
  }
  else
  {
    self->_isActive = 1;
    v23 = (void *)MEMORY[0x1CB785210](v15);
    id completion = self->_completion;
    self->_id completion = v23;

    if (v13) {
      v13[2](v13);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke;
    v25[3] = &unk_1E658AAE0;
    v25[4] = self;
    id v26 = v14;
    [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)self _prepareWithOptions:a3 audioSession:v12 completion:v25];
  }
LABEL_10:
}

void __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandl"
                           "er:executionHandler:finalizationHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      id v18 = v3;
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Failed to prepare %@ due to error %@.", buf, 0x20u);
    }
    [*(id *)(a1 + 32) _finalizeWithError:v3];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 16))
    {
      [*(id *)(v5 + 24) setRate:0.0];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 24);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke_37;
      v15[3] = &unk_1E658C8C0;
      v15[4] = v6;
      id v16 = *(id *)(a1 + 40);
      *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
      *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      long long v13 = *(_OWORD *)buf;
      uint64_t v14 = *(void *)&buf[16];
      long long v11 = *(_OWORD *)buf;
      uint64_t v12 = *(void *)&buf[16];
      [v7 seekToTime:buf toleranceBefore:&v13 toleranceAfter:&v11 completionHandler:v15];
    }
    else
    {
      long long v8 = *MEMORY[0x1E4F4E368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHan"
                             "dler:executionHandler:finalizationHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v5;
        _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s Failed to start %@ because it is already inactive after preparation.", buf, 0x16u);
        uint64_t v5 = *(void *)(a1 + 32);
      }
      uint64_t v9 = [MEMORY[0x1E4F4E478] errorWithCode:1409 description:@"Audio playback session is already inactive after preparation."];
      [(id)v5 _finalizeWithError:v9];
    }
  }
}

void __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke_37(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke_2;
  block[3] = &unk_1E658CC80;
  block[4] = v2;
  char v6 = a2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __134__CSSiriAudioPlaybackSessionImplAVPlayerBased__startWithOptions_audioSession_preparationHandler_executionHandler_finalizationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[16])
  {
    uint64_t v7 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      long long v13 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHan"
            "dler:finalizationHandler:]_block_invoke_2";
      __int16 v14 = 2112;
      v15 = v2;
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s Failed to start %@ because it is already inactive after player seek to begin.", (uint8_t *)&v12, 0x16u);
      uint64_t v2 = *(unsigned char **)(a1 + 32);
    }
    long long v8 = (void *)MEMORY[0x1E4F4E478];
    uint64_t v9 = @"Audio playback session is already inactive after player seek to begin.";
    uint64_t v10 = 1409;
    goto LABEL_13;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    long long v11 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      long long v13 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHan"
            "dler:finalizationHandler:]_block_invoke";
      __int16 v14 = 2112;
      v15 = v2;
      _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s Failed to start %@ because player failed to seek to begin.", (uint8_t *)&v12, 0x16u);
      uint64_t v2 = *(unsigned char **)(a1 + 32);
    }
    long long v8 = (void *)MEMORY[0x1E4F4E478];
    uint64_t v9 = @"Player failed to seek to begin.";
    uint64_t v10 = 1425;
LABEL_13:
    id v3 = [v8 errorWithCode:v10 description:v9];
    [v2 _finalizeWithError:v3];
    goto LABEL_14;
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel_playerItemDidPlayToEndTime_ name:*MEMORY[0x1E4F16020] object:*(void *)(*(void *)(a1 + 32) + 32)];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel_playerItemFailedToPlayToEndTime_ name:*MEMORY[0x1E4F16030] object:*(void *)(*(void *)(a1 + 32) + 32)];
  LODWORD(v4) = 1.0;
  [*(id *)(*(void *)(a1 + 32) + 24) setRate:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  char v6 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    long long v13 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _startWithOptions:audioSession:preparationHandler:executionHandl"
          "er:finalizationHandler:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s started", (uint8_t *)&v12, 0xCu);
  }
LABEL_14:
}

- (void)_prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 completion:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F4E368];
  uint64_t v10 = (void *)*MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    int v12 = v10;
    AFAudioPlaybackOptionsGetNames();
    long long v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = request;
    *(_WORD *)&buf[22] = 2112;
    v76 = v13;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s request = %@, options = %@", buf, 0x20u);
  }
  id v14 = objc_alloc(MEMORY[0x1E4F4E520]);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke;
  v73[3] = &unk_1E658C960;
  id v15 = v8;
  id v74 = v15;
  uint64_t v16 = [MEMORY[0x1E4F4E478] errorWithCode:40];
  v17 = (void *)[v14 initWithBlock:v73 defaultValue:v16];

  if ([(AVPlayerItem *)self->_playerItem status] == AVPlayerItemStatusFailed)
  {
    os_log_t v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      playerItem = self->_playerItem;
      v52 = v18;
      v53 = [(AVPlayerItem *)playerItem error];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = playerItem;
      *(_WORD *)&buf[22] = 2112;
      v76 = v53;
      _os_log_error_impl(&dword_1C9338000, v52, OS_LOG_TYPE_ERROR, "%s Player item %@ status is failed with error %@.", buf, 0x20u);
    }
    [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)self _resetPlayerItem];
  }
  if (self->_playerItem) {
    goto LABEL_17;
  }
  uint64_t v19 = [(AFAudioPlaybackRequest *)self->_request itemURL];
  if (v19)
  {
    v20 = (AVPlayerItem *)[objc_alloc(MEMORY[0x1E4F16620]) initWithURL:v19];
    v21 = self->_playerItem;
    self->_playerItem = v20;

    v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v55 = self->_playerItem;
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2112;
      v76 = v19;
      _os_log_debug_impl(&dword_1C9338000, v22, OS_LOG_TYPE_DEBUG, "%s Created player item %@ from URL %@.", buf, 0x20u);
    }
  }

  if (self->_playerItem) {
    goto LABEL_17;
  }
  v23 = [(AFAudioPlaybackRequest *)self->_request itemData];
  if (v23)
  {
    v24 = [MEMORY[0x1E4F16330] assetWithData:v23 contentType:*MEMORY[0x1E4F15AB8] options:0];
    v25 = (AVPlayerItem *)[objc_alloc(MEMORY[0x1E4F16620]) initWithAsset:v24];
    id v26 = self->_playerItem;
    self->_playerItem = v25;

    os_log_t v27 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v59 = self->_playerItem;
      v57 = v27;
      uint64_t v58 = [v23 length];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2048;
      v76 = (uint64_t (*)(uint64_t, uint64_t))v58;
      _os_log_debug_impl(&dword_1C9338000, v57, OS_LOG_TYPE_DEBUG, "%s Created player item %@ from WAVE asset with %tu bytes of data .", buf, 0x20u);
    }
  }

  if (self->_playerItem)
  {
LABEL_17:
    player = self->_player;
    if (!player)
    {
      __int16 v29 = (AVPlayer *)[objc_alloc(MEMORY[0x1E4F16608]) initWithDispatchQueue:self->_queue];
      v30 = self->_player;
      self->_player = v29;

      __int16 v31 = self->_player;
      [(AFAudioPlaybackRequest *)self->_request volume];
      -[AVPlayer setVolume:](v31, "setVolume:");
      [(AVPlayer *)self->_player setActionAtItemEnd:2];
      v32 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        v54 = self->_player;
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v54;
        _os_log_debug_impl(&dword_1C9338000, v32, OS_LOG_TYPE_DEBUG, "%s Created player %@.", buf, 0x16u);
      }
      player = self->_player;
    }
    -[AVPlayer setAudioSession:](player, "setAudioSession:", v7, v59);
    [(AVPlayer *)self->_player replaceCurrentItemWithPlayerItem:self->_playerItem];
    uint64_t v33 = [(AVPlayer *)self->_player currentItem];
    v34 = v33;
    v35 = self->_playerItem;
    if (v33 == v35)
    {
      if ([(AVPlayerItem *)v33 status] == AVPlayerItemStatusReadyToPlay)
      {
        v38 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
        {
          v56 = self->_playerItem;
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v56;
          _os_log_debug_impl(&dword_1C9338000, v38, OS_LOG_TYPE_DEBUG, "%s Player item %@ status is ready to play.", buf, 0x16u);
        }
        [v17 invokeWithValue:0];
      }
      else
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v76 = __Block_byref_object_copy__8870;
        *(void *)&long long v77 = __Block_byref_object_dispose__8871;
        *((void *)&v77 + 1) = 0;
        uint64_t v67 = 0;
        v68 = &v67;
        uint64_t v69 = 0x3032000000;
        v70 = __Block_byref_object_copy__8870;
        v71 = __Block_byref_object_dispose__8871;
        id v72 = 0;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_15;
        v66[3] = &unk_1E658A3F8;
        v66[4] = buf;
        v66[5] = &v67;
        v39 = (void *)MEMORY[0x1CB785210](v66);
        id v40 = objc_alloc(MEMORY[0x1E4F4E688]);
        queue = self->_queue;
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_2;
        v62[3] = &unk_1E658D198;
        id v42 = v17;
        id v63 = v42;
        v64 = self;
        id v43 = v39;
        id v65 = v43;
        uint64_t v44 = [v40 initWithTimeoutInterval:queue onQueue:v62 timeoutHandler:2.0];
        v45 = (void *)v68[5];
        v68[5] = v44;

        [(id)v68[5] start];
        id v60 = v42;
        id v61 = v43;
        v46 = (void *)[objc_alloc(MEMORY[0x1E4F4E4B8]) initWithQueue:self->_queue qosClass:33 asynchronous:1];
        uint64_t v47 = AFKeyValueObservingCreate();
        v48 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v47;

        _Block_object_dispose(&v67, 8);
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      v36 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v50 = self->_player;
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2112;
        v76 = (uint64_t (*)(uint64_t, uint64_t))v35;
        LOWORD(v77) = 2112;
        *(void *)((char *)&v77 + 2) = v34;
        _os_log_error_impl(&dword_1C9338000, v36, OS_LOG_TYPE_ERROR, "%s Unable to replace current item of player %@. Expected current item is %@, actual current item is %@.", buf, 0x2Au);
      }
      v37 = [MEMORY[0x1E4F4E478] errorWithCode:1420 description:@"Unable to replace current item of player."];
      [v17 invokeWithValue:v37];
    }
  }
  else
  {
    v49 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]";
      _os_log_error_impl(&dword_1C9338000, v49, OS_LOG_TYPE_ERROR, "%s Unable to create player item.", buf, 0xCu);
    }
    v34 = objc_msgSend(MEMORY[0x1E4F4E478], "errorWithCode:description:", 1423, @"Unable to create player item.", v59);
    [v17 invokeWithValue:v34];
  }
}

void __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = *MEMORY[0x1E4F4E368];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s prepared", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_15(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

uint64_t __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_2(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  id v3 = [MEMORY[0x1E4F4E478] errorWithCode:1421 description:@"Timed out when waiting for player item status to change to ready to play."];
  LODWORD(v2) = [v2 invokeWithValue:v3];

  if (v2)
  {
    uint64_t v4 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1[5] + 32);
      int v7 = 136315394;
      __int16 v8 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke_2";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Timed out when waiting for player item %@ status to change to ready to play.", (uint8_t *)&v7, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __91__CSSiriAudioPlaybackSessionImplAVPlayerBased__prepareWithOptions_audioSession_completion___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 integerValue];
    if (v5 == 2)
    {
      int v7 = [*(id *)(*(void *)(a1 + 40) + 32) error];
      __int16 v8 = *(void **)(a1 + 32);
      __int16 v9 = [MEMORY[0x1E4F4E478] errorWithCode:1422 description:@"Failed to change player item status to ready to play." underlyingError:v7];
      LODWORD(v8) = [v8 invokeWithValue:v9];

      if (v8)
      {
        uint64_t v10 = *MEMORY[0x1E4F4E368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 32);
          int v13 = 136315650;
          id v14 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke";
          __int16 v15 = 2112;
          uint64_t v16 = v12;
          __int16 v17 = 2112;
          os_log_t v18 = v7;
          _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s Failed to change player item %@ status to ready to play due to error %@.", (uint8_t *)&v13, 0x20u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else if (v5 == 1)
    {
      if ([*(id *)(a1 + 32) invokeWithValue:0])
      {
        uint64_t v6 = *MEMORY[0x1E4F4E368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 32);
          int v13 = 136315394;
          id v14 = "-[CSSiriAudioPlaybackSessionImplAVPlayerBased _prepareWithOptions:audioSession:completion:]_block_invoke";
          __int16 v15 = 2112;
          uint64_t v16 = v11;
          _os_log_debug_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEBUG, "%s Successfully changed player item %@ status to ready to play.", (uint8_t *)&v13, 0x16u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)handleEndInterruption:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)self _handleEndInterruption:v3];
}

- (void)stop:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)self _stop:v4];
  uint64_t v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    uint64_t v6 = v7;
  }
}

- (void)startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  queue = self->_queue;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  dispatch_assert_queue_V2(queue);
  [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)self _startWithOptions:a3 audioSession:v16 preparationHandler:v15 executionHandler:v14 finalizationHandler:v13];
}

- (void)prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 completion:(id)a5
{
  id v9 = a4;
  __int16 v8 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isActive)
  {
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)self _prepareWithOptions:a3 audioSession:v9 completion:v8];
  }
}

- (CSSiriAudioPlaybackSessionImplAVPlayerBased)initWithQueue:(id)a3 request:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSSiriAudioPlaybackSessionImplAVPlayerBased;
  uint64_t v11 = [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    uint64_t v13 = [v10 copy];
    request = v12->_request;
    v12->_request = (AFAudioPlaybackRequest *)v13;

    v12->_options = a5;
  }

  return v12;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)CSSiriAudioPlaybackSessionImplAVPlayerBased;
  BOOL v4 = [(CSSiriAudioPlaybackSessionImplAVPlayerBased *)&v9 description];
  request = self->_request;
  uint64_t v6 = AFAudioPlaybackOptionsGetNames();
  id v7 = (void *)[v3 initWithFormat:@"%@ {request = %@, options = %@, player = %@, playerItem = %@}", v4, request, v6, self->_player, self->_playerItem];

  return (NSString *)v7;
}

@end