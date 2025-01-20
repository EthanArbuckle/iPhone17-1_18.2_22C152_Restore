@interface CSSiriAudioPlaybackSessionImplAVAudioPlayerBased
- (AFAudioPlaybackRequest)request;
- (BOOL)_prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 error:(id *)a5;
- (CSSiriAudioPlaybackSessionImplAVAudioPlayerBased)initWithQueue:(id)a3 request:(id)a4 options:(unint64_t)a5;
- (NSString)description;
- (unint64_t)options;
- (void)_didNotStartWithError:(id)a3;
- (void)_didStopWithError:(id)a3;
- (void)_finalizeWithError:(id)a3;
- (void)_handleBeginInterruption;
- (void)_handleEndInterruption:(BOOL)a3;
- (void)_startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7;
- (void)_stop:(BOOL)a3;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)handleBeginInterruption;
- (void)handleEndInterruption:(BOOL)a3;
- (void)prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 completion:(id)a5;
- (void)startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7;
- (void)stop:(BOOL)a3 completion:(id)a4;
@end

@implementation CSSiriAudioPlaybackSessionImplAVAudioPlayerBased

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
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

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
  {
    request = self->_request;
    *(_DWORD *)buf = 136315906;
    v18 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased audioPlayerDecodeErrorDidOccur:error:]";
    __int16 v19 = 2112;
    v20 = request;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s request = %@, player = %@, error = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased_audioPlayerDecodeErrorDidOccur_error___block_invoke;
  block[3] = &unk_1E658D3F0;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __89__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased_audioPlayerDecodeErrorDidOccur_error___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 16)) {
    return [*(id *)(result + 40) _didStopWithError:*(void *)(result + 48)];
  }
  return result;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    *(_DWORD *)buf = 136315906;
    v15 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased audioPlayerDidFinishPlaying:successfully:]";
    __int16 v16 = 2112;
    v17 = request;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 1024;
    BOOL v21 = v4;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s request = %@, player = %@, success = %d", buf, 0x26u);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased_audioPlayerDidFinishPlaying_successfully___block_invoke;
  v11[3] = &unk_1E658D4B0;
  id v12 = v6;
  v13 = self;
  id v10 = v6;
  dispatch_async(queue, v11);
}

void *__93__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased_audioPlayerDidFinishPlaying_successfully___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[2]) {
    return (void *)[result _didStopWithError:0];
  }
  return result;
}

- (void)_finalizeWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = *MEMORY[0x1E4F4E368];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      request = self->_request;
      int v10 = 136315650;
      id v11 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _finalizeWithError:]";
      __int16 v12 = 2112;
      v13 = request;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s request = %@, error = %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    id v7 = self->_request;
    int v10 = 136315394;
    id v11 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _finalizeWithError:]";
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v10, 0x16u);
  }
  *(_WORD *)&self->_isActive = 0;
  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v4);
    id v9 = self->_completion;
    self->_completion = 0;
  }
}

- (void)_didStopWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E4F4E368];
  id v6 = *MEMORY[0x1E4F4E368];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      request = self->_request;
      int v11 = 136315650;
      __int16 v12 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didStopWithError:]";
      __int16 v13 = 2112;
      __int16 v14 = request;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s request = %@, error = %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    v8 = self->_request;
    int v11 = 136315394;
    __int16 v12 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didStopWithError:]";
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v11, 0x16u);
  }
  player = self->_player;
  if (player)
  {
    [(AVAudioPlayer *)player setDelegate:0];
    [(AVAudioPlayer *)self->_player stop];
  }
  else
  {
    int v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      __int16 v12 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didStopWithError:]";
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s Ignored because there's no audio player to destroy.", (uint8_t *)&v11, 0xCu);
    }
  }
  [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _finalizeWithError:v4];
}

- (void)_didNotStartWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
  {
    request = self->_request;
    int v7 = 136315650;
    v8 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _didNotStartWithError:]";
    __int16 v9 = 2112;
    int v10 = request;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s request = %@, error = %@", (uint8_t *)&v7, 0x20u);
  }
  [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _finalizeWithError:v4];
}

- (void)_handleEndInterruption:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = (os_log_t *)MEMORY[0x1E4F4E368];
  id v6 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    int v10 = 136315650;
    __int16 v11 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleEndInterruption:]";
    __int16 v12 = 2112;
    uint64_t v13 = request;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s _request = %@, shouldResume = %d", (uint8_t *)&v10, 0x1Cu);
  }
  if (!v3) {
    goto LABEL_7;
  }
  player = self->_player;
  if (player)
  {
    if (![(AVAudioPlayer *)player isPlaying] && ![(AVAudioPlayer *)self->_player play]) {
LABEL_7:
    }
      [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _stop:1];
  }
  else
  {
    __int16 v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      __int16 v11 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleEndInterruption:]";
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s Ignored because there's no audio player to resume playing.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_handleBeginInterruption
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (os_log_t *)MEMORY[0x1E4F4E368];
  id v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    int v7 = 136315394;
    v8 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleBeginInterruption]";
    __int16 v9 = 2112;
    int v10 = request;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s _request = %@", (uint8_t *)&v7, 0x16u);
  }
  if ([(AVAudioPlayer *)self->_player isPlaying])
  {
    [(AVAudioPlayer *)self->_player pause];
  }
  else
  {
    id v6 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      v8 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _handleBeginInterruption]";
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Ignored because there's no audio player to pause.", (uint8_t *)&v7, 0xCu);
    }
  }
  self->_isPrepared = 0;
}

- (void)_stop:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = (os_log_t *)MEMORY[0x1E4F4E368];
  id v6 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    *(_DWORD *)buf = 136315650;
    uint64_t v17 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:]";
    __int16 v18 = 2112;
    id v19 = request;
    __int16 v20 = 1024;
    BOOL v21 = v3;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s request = %@, immediately = %d", buf, 0x1Cu);
  }
  if (self->_player)
  {
    [(AFAudioPlaybackRequest *)self->_request fadeOutDuration];
    if (v3 || (double v9 = v8, v8 == 0.0))
    {
      uint64_t v13 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v17 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:]";
        _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s Stopping audio player...", buf, 0xCu);
      }
      __int16 v14 = [MEMORY[0x1E4F4E478] errorWithCode:1408 description:@"Stopped playback of AVAudioPlayer." underlyingError:0];
      [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _didStopWithError:v14];
    }
    else
    {
      [(AVAudioPlayer *)self->_player setVolume:0.0 fadeDuration:v8];
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased__stop___block_invoke;
      block[3] = &unk_1E658D4D8;
      void block[4] = self;
      dispatch_after(v10, queue, block);
    }
  }
  else
  {
    __int16 v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:]";
      _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s Ignored because there's no audio player to stop.", buf, 0xCu);
    }
  }
}

void __58__CSSiriAudioPlaybackSessionImplAVAudioPlayerBased__stop___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _stop:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_INFO, "%s Stopping audio player...", (uint8_t *)&v5, 0xCu);
  }
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F4E478] errorWithCode:1408 description:@"Stopped playback of AVAudioPlayer." underlyingError:0];
  [v3 _didStopWithError:v4];
}

- (void)_startWithOptions:(unint64_t)a3 audioSession:(id)a4 preparationHandler:(id)a5 executionHandler:(id)a6 finalizationHandler:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  uint64_t v13 = (void (**)(void))a5;
  __int16 v14 = (void (**)(void))a6;
  BOOL v15 = (void (**)(id, id))a7;
  uint64_t v16 = (os_log_t *)MEMORY[0x1E4F4E368];
  uint64_t v17 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    *(_DWORD *)buf = 136315394;
    v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:execution"
          "Handler:finalizationHandler:]";
    __int16 v45 = 2112;
    v46 = request;
    _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  if (!self->_isActive)
  {
    if (![(AVAudioPlayer *)self->_player isPlaying])
    {
      self->_isActive = 1;
      uint64_t v25 = (void *)MEMORY[0x1CB785210](v15);
      id completion = self->_completion;
      self->_id completion = v25;

      if (v13) {
        v13[2](v13);
      }
      id v42 = 0;
      BOOL v27 = [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _prepareWithOptions:a3 audioSession:v12 error:&v42];
      id v24 = v42;
      if (v27)
      {
        [(AVAudioPlayer *)self->_player setDelegate:self];
        v28 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
        {
          player = self->_player;
          *(_DWORD *)buf = 136315394;
          v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:exe"
                "cutionHandler:finalizationHandler:]";
          __int16 v45 = 2112;
          v46 = player;
          _os_log_impl(&dword_1C9338000, v28, OS_LOG_TYPE_INFO, "%s Asking audio player %@ to play...", buf, 0x16u);
        }
        BOOL v30 = [(AVAudioPlayer *)self->_player play];
        v31 = *v16;
        if (v30)
        {
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
          {
            v32 = self->_player;
            *(_DWORD *)buf = 136315394;
            v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:e"
                  "xecutionHandler:finalizationHandler:]";
            __int16 v45 = 2112;
            v46 = v32;
            _os_log_impl(&dword_1C9338000, v31, OS_LOG_TYPE_INFO, "%s Started playing audio player %@.", buf, 0x16u);
          }
          self->_isPrepared = 0;
          if (v14) {
            v14[2](v14);
          }
          [(AFAudioPlaybackRequest *)self->_request fadeInDuration];
          if (v33 > 0.0)
          {
            v34 = self->_player;
            [(AFAudioPlaybackRequest *)self->_request volume];
            int v36 = v35;
            [(AFAudioPlaybackRequest *)self->_request fadeInDuration];
            double v38 = v37;
            LODWORD(v37) = v36;
            [(AVAudioPlayer *)v34 setVolume:v37 fadeDuration:v38];
          }
        }
        else
        {
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
          {
            v41 = self->_player;
            *(_DWORD *)buf = 136315394;
            v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:e"
                  "xecutionHandler:finalizationHandler:]";
            __int16 v45 = 2112;
            v46 = v41;
            _os_log_error_impl(&dword_1C9338000, v31, OS_LOG_TYPE_ERROR, "%s Failed to play audio player %@.", buf, 0x16u);
          }
          [(AVAudioPlayer *)self->_player setDelegate:0];
          v39 = self->_player;
          self->_player = 0;

          v40 = [MEMORY[0x1E4F4E478] errorWithCode:1403 description:@"Failed to play AVAudioPlayer." underlyingError:0];
          [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _didNotStartWithError:v40];
        }
      }
      else
      {
        [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _didNotStartWithError:v24];
      }
      goto LABEL_12;
    }
    __int16 v23 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:executi"
            "onHandler:finalizationHandler:]";
      _os_log_error_impl(&dword_1C9338000, v23, OS_LOG_TYPE_ERROR, "%s Ignored because the audio player is already playing.", buf, 0xCu);
      if (!v15) {
        goto LABEL_13;
      }
    }
    else if (!v15)
    {
      goto LABEL_13;
    }
    __int16 v20 = (void *)MEMORY[0x1E4F4E478];
    BOOL v21 = @"Attempted to start audio playback session when AVAudioPlayer is already playing.";
    uint64_t v22 = 1404;
    goto LABEL_11;
  }
  id v19 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _startWithOptions:audioSession:preparationHandler:execution"
          "Handler:finalizationHandler:]";
    _os_log_error_impl(&dword_1C9338000, v19, OS_LOG_TYPE_ERROR, "%s Ignored because the session is already active.", buf, 0xCu);
    if (!v15) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    __int16 v20 = (void *)MEMORY[0x1E4F4E478];
    BOOL v21 = @"Attempted to start audio playback session when it is already active.";
    uint64_t v22 = 1405;
LABEL_11:
    id v24 = [v20 errorWithCode:v22 description:v21 underlyingError:0];
    v15[2](v15, v24);
LABEL_12:
  }
LABEL_13:
}

- (BOOL)_prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v8 = (AVAudioSession *)a4;
  if (a5) {
    *a5 = 0;
  }
  double v9 = (os_log_t *)MEMORY[0x1E4F4E368];
  if (self->_player)
  {
    if (self->_audioSession != v8)
    {
      objc_storeStrong((id *)&self->_audioSession, a4);
      [(AVAudioPlayer *)self->_player setAudioSession:v8];
      self->_isPrepared = 0;
    }
    dispatch_time_t v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      player = self->_player;
      *(_DWORD *)buf = 136315650;
      v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      __int16 v45 = 2112;
      v46 = player;
      __int16 v47 = 2112;
      v48 = v8;
      id v12 = "%s Reused audio player %@ with audio session %@.";
LABEL_8:
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, v12, buf, 0x20u);
    }
  }
  else
  {
    self->_isPrepared = 0;
    uint64_t v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_INFO, "%s Creating audio player...", buf, 0xCu);
    }
    uint64_t v17 = [(AFAudioPlaybackRequest *)self->_request itemData];

    id v18 = objc_alloc(MEMORY[0x1E4F153C0]);
    request = self->_request;
    if (v17)
    {
      __int16 v20 = [(AFAudioPlaybackRequest *)request itemData];
      uint64_t v42 = 0;
      BOOL v21 = (id *)&v42;
      uint64_t v22 = [v18 initWithData:v20 error:&v42];
    }
    else
    {
      __int16 v20 = [(AFAudioPlaybackRequest *)request itemURL];
      uint64_t v41 = 0;
      BOOL v21 = (id *)&v41;
      uint64_t v22 = [v18 initWithContentsOfURL:v20 error:&v41];
    }
    double v33 = (AVAudioPlayer *)v22;
    v34 = (AVAudioPlayer *)*v21;
    int v35 = self->_player;
    self->_player = v33;

    if (v34)
    {
      int v36 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
        __int16 v45 = 2112;
        v46 = v34;
        _os_log_error_impl(&dword_1C9338000, v36, OS_LOG_TYPE_ERROR, "%s Failed to create audio player due to error %@.", buf, 0x16u);
      }
      double v37 = self->_player;
      self->_player = 0;

      if (a5)
      {
        *a5 = [MEMORY[0x1E4F4E478] errorWithCode:1401 description:@"Failed to initialize AVAudioPlayer." underlyingError:v34];
      }

      goto LABEL_35;
    }
    objc_storeStrong((id *)&self->_audioSession, a4);
    [(AVAudioPlayer *)self->_player setAudioSession:v8];
    dispatch_time_t v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v39 = self->_player;
      *(_DWORD *)buf = 136315650;
      v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      __int16 v45 = 2112;
      v46 = v39;
      __int16 v47 = 2112;
      v48 = v8;
      id v12 = "%s Created audio player %@ with audio session %@.";
      goto LABEL_8;
    }
  }
  if (self->_isPrepared)
  {
    uint64_t v13 = *v9;
    BOOL v14 = 1;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = self->_player;
      *(_DWORD *)buf = 136315394;
      v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      __int16 v45 = 2112;
      v46 = v15;
      _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s Audio player %@ is already prepared to play.", buf, 0x16u);
    }
    goto LABEL_36;
  }
  [(AVAudioPlayer *)self->_player setNumberOfLoops:[(AFAudioPlaybackRequest *)self->_request numberOfLoops]];
  [(AFAudioPlaybackRequest *)self->_request fadeInDuration];
  double v24 = v23;
  uint64_t v25 = self->_player;
  double v26 = 0.0;
  if (v24 <= 0.0) {
    [(AFAudioPlaybackRequest *)self->_request volume];
  }
  [(AVAudioPlayer *)v25 setVolume:v26];
  BOOL v27 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v28 = self->_player;
    *(_DWORD *)buf = 136315394;
    v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
    __int16 v45 = 2112;
    v46 = v28;
    _os_log_impl(&dword_1C9338000, v27, OS_LOG_TYPE_INFO, "%s Preparing audio player %@ to play...", buf, 0x16u);
  }
  BOOL v29 = [(AVAudioPlayer *)self->_player prepareToPlay];
  BOOL v30 = *v9;
  if (!v29)
  {
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      v40 = self->_player;
      *(_DWORD *)buf = 136315394;
      v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
      __int16 v45 = 2112;
      v46 = v40;
      _os_log_error_impl(&dword_1C9338000, v30, OS_LOG_TYPE_ERROR, "%s Failed to prepare audio player %@ to play.", buf, 0x16u);
    }
    v32 = self->_player;
    self->_player = 0;

    if (a5)
    {
      [MEMORY[0x1E4F4E478] errorWithCode:1402 description:@"Failed to prepare to play AVAudioPlayer." underlyingError:0];
      BOOL v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
LABEL_35:
    BOOL v14 = 0;
    goto LABEL_36;
  }
  BOOL v14 = 1;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v31 = self->_player;
    *(_DWORD *)buf = 136315394;
    v44 = "-[CSSiriAudioPlaybackSessionImplAVAudioPlayerBased _prepareWithOptions:audioSession:error:]";
    __int16 v45 = 2112;
    v46 = v31;
    _os_log_impl(&dword_1C9338000, v30, OS_LOG_TYPE_INFO, "%s Prepared audio player %@ to play.", buf, 0x16u);
  }
  self->_isPrepared = 1;
LABEL_36:

  return v14;
}

- (void)handleEndInterruption:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _handleEndInterruption:v3];
}

- (void)handleBeginInterruption
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _handleBeginInterruption];
}

- (void)stop:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _stop:v4];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
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
  [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _startWithOptions:a3 audioSession:v16 preparationHandler:v15 executionHandler:v14 finalizationHandler:v13];
}

- (void)prepareWithOptions:(unint64_t)a3 audioSession:(id)a4 completion:(id)a5
{
  double v8 = (void (**)(id, id))a5;
  queue = self->_queue;
  id v10 = a4;
  dispatch_assert_queue_V2(queue);
  id v12 = 0;
  [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)self _prepareWithOptions:a3 audioSession:v10 error:&v12];

  id v11 = v12;
  if (v8) {
    v8[2](v8, v11);
  }
}

- (CSSiriAudioPlaybackSessionImplAVAudioPlayerBased)initWithQueue:(id)a3 request:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSSiriAudioPlaybackSessionImplAVAudioPlayerBased;
  id v11 = [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)&v16 init];
  id v12 = v11;
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
  v9.super_class = (Class)CSSiriAudioPlaybackSessionImplAVAudioPlayerBased;
  BOOL v4 = [(CSSiriAudioPlaybackSessionImplAVAudioPlayerBased *)&v9 description];
  request = self->_request;
  id v6 = AFAudioPlaybackOptionsGetNames();
  id v7 = (void *)[v3 initWithFormat:@"%@ {request = %@, options = %@, player = %@}", v4, request, v6, self->_player];

  return (NSString *)v7;
}

@end