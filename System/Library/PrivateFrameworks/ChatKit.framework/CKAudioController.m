@interface CKAudioController
- (BOOL)interrupted;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)shouldDuckOthers;
- (BOOL)shouldStopPlayingWhenSilent;
- (BOOL)shouldUseAVPlayer;
- (BOOL)shouldUseSpeaker;
- (CKAudioController)initWithMediaObjects:(id)a3 conversation:(id)a4;
- (CKAudioControllerDelegate)delegate;
- (CKAudioPlayer)audioPlayer;
- (CKConversation)conversation;
- (CKMediaObject)currentMediaObject;
- (NSArray)mediaObjects;
- (NSMutableArray)_mediaObjects;
- (double)currentMediaObjectDuration;
- (double)currentMediaObjectTime;
- (double)playbackSpeed;
- (float)volume;
- (unint64_t)audioSessionControllerOptions;
- (unint64_t)currentIndex;
- (void)_notifyPlayerDidPrepareMediaObject:(id)a3 successfully:(BOOL)a4;
- (void)_setMediaObjects:(id)a3;
- (void)addMediaObject:(id)a3;
- (void)addMediaObjects:(id)a3;
- (void)audioPlayerCurrentTimeDidChange:(id)a3;
- (void)audioPlayerDidFinishPlaying:(id)a3;
- (void)audioPlayerDidGetInterrupted;
- (void)audioPlayerDidPrepareAudioToPlay:(id)a3 successfully:(BOOL)a4;
- (void)audioSessionInterruption:(id)a3;
- (void)clearMediaPlayerInfo;
- (void)dealloc;
- (void)layoutViewsForScrubbingTime:(double)a3;
- (void)pause;
- (void)play;
- (void)playAfterDelay:(double)a3;
- (void)playListenEndSound:(id)a3;
- (void)playListenSound:(id)a3;
- (void)prepareToPlay;
- (void)setAudioPlayer:(id)a3;
- (void)setConversation:(id)a3;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setCurrentMediaPlayerInfo;
- (void)setCurrentTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPlaybackSpeed:(double)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setShouldDuckOthers:(BOOL)a3;
- (void)setShouldStopPlayingWhenSilent:(BOOL)a3;
- (void)setShouldUseAVPlayer:(BOOL)a3;
- (void)setShouldUseSpeaker:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setupMediaRemoteCommandCenter;
- (void)stop;
@end

@implementation CKAudioController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CKAudioPlayer *)self->_audioPlayer setDelegate:0];
  [(CKAudioPlayer *)self->_audioPlayer stop];
  v4.receiver = self;
  v4.super_class = (Class)CKAudioController;
  [(CKAudioController *)&v4 dealloc];
}

- (CKAudioController)initWithMediaObjects:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKAudioController;
  v8 = [(CKAudioController *)&v17 init];
  if (v8)
  {
    v9 = (void *)[v6 mutableCopy];
    [(CKAudioController *)v8 _setMediaObjects:v9];
    v8->_shouldUseSpeaker = 1;
    [(CKAudioController *)v8 setCurrentIndex:0x7FFFFFFFFFFFFFFFLL];
    [(CKAudioController *)v8 setConversation:v7];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v8 selector:sel_audioSessionInterruption_ name:*MEMORY[0x1E4F15000] object:0];
    [v10 addObserver:v8 selector:sel_applicationWillResignActive name:*MEMORY[0x1E4F43710] object:0];
    v11 = [v9 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v13 = [v9 firstObject];
      v14 = [v13 messageContext];
      int v15 = [v14 isAudioMessage];

      if (v15) {
        [(CKAudioController *)v8 setupMediaRemoteCommandCenter];
      }
    }
  }

  return v8;
}

- (NSArray)mediaObjects
{
  return (NSArray *)self->_mediaObjects;
}

- (void)addMediaObject:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAudioController *)self _mediaObjects];
  [v5 addObject:v4];
}

- (void)addMediaObjects:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAudioController *)self _mediaObjects];
  [v5 addObjectsFromArray:v4];
}

- (void)setShouldUseSpeaker:(BOOL)a3
{
  if (self->_shouldUseSpeaker != a3)
  {
    self->_shouldUseSpeaker = a3;
    if ([(CKAudioController *)self isPlaying])
    {
      id v4 = +[CKAudioSessionController shareInstance];
      objc_msgSend(v4, "activateWithOptions:completion:", -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions"), 0);
    }
  }
}

- (void)setShouldStopPlayingWhenSilent:(BOOL)a3
{
  if (self->_shouldStopPlayingWhenSilent != a3)
  {
    self->_shouldStopPlayingWhenSilent = a3;
    if ([(CKAudioController *)self isPlaying])
    {
      id v4 = +[CKAudioSessionController shareInstance];
      objc_msgSend(v4, "activateWithOptions:completion:", -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions"), 0);
    }
  }
}

- (void)setShouldDuckOthers:(BOOL)a3
{
  if (self->_shouldDuckOthers != a3)
  {
    self->_shouldDuckOthers = a3;
    if ([(CKAudioController *)self isPlaying])
    {
      id v4 = +[CKAudioSessionController shareInstance];
      objc_msgSend(v4, "activateWithOptions:completion:", -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions"), 0);
    }
  }
}

- (unint64_t)audioSessionControllerOptions
{
  unint64_t v3 = [(CKAudioController *)self shouldUseSpeaker];
  if ([(CKAudioController *)self shouldStopPlayingWhenSilent]) {
    v3 |= 2uLL;
  }
  if ([(CKAudioController *)self shouldDuckOthers]) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

- (void)play
{
  [(CKAudioController *)self playAfterDelay:0.0];

  [(CKAudioController *)self setCurrentMediaPlayerInfo];
}

- (void)playAfterDelay:(double)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(CKAudioController *)self currentIndex];
  int v6 = IMOSLoggingEnabled();
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v6) {
      goto LABEL_10;
    }
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [(CKAudioController *)self _mediaObjects];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = [v8 count];
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Playing audio message. _currentIndex was NSNotFound. [[self _mediaObjects] count]: %llu", buf, 0xCu);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_10;
    }
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = [(CKAudioController *)self currentIndex];
      v10 = [(CKAudioController *)self _mediaObjects];
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v9;
      __int16 v34 = 2048;
      uint64_t v35 = [v10 count];
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Playing %llu of %llu audio messages.", buf, 0x16u);
    }
  }

LABEL_10:
  v11 = [(CKAudioController *)self audioPlayer];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  if (v11)
  {
    if (![(CKAudioPlayer *)v11 isPlaying])
    {
      id location = 0;
      objc_initWeak(&location, v11);
      v12 = +[CKAudioSessionController shareInstance];
      unint64_t v13 = [(CKAudioController *)self audioSessionControllerOptions];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __36__CKAudioController_playAfterDelay___block_invoke;
      v27[3] = &unk_1E5629140;
      v11 = v11;
      v28 = v11;
      v31[1] = *(id *)&a3;
      objc_copyWeak(&v30, (id *)buf);
      objc_copyWeak(v31, &location);
      v29 = self;
      [v12 activateWithOptions:v13 completion:v27];

      objc_destroyWeak(v31);
      objc_destroyWeak(&v30);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    if ([(CKAudioController *)self currentIndex] == 0x7FFFFFFFFFFFFFFFLL) {
      [(CKAudioController *)self setCurrentIndex:0];
    }
    v14 = [(CKAudioController *)self _mediaObjects];
    unint64_t v15 = [(CKAudioController *)self currentIndex];
    if (v15 >= [v14 count])
    {
      v11 = 0;
    }
    else
    {
      v16 = objc_msgSend(v14, "objectAtIndex:", -[CKAudioController currentIndex](self, "currentIndex"));
      if ([v16 shouldSuppressPreview])
      {
        v11 = 0;
      }
      else
      {
        objc_super v17 = [[CKAudioPlayer alloc] initWithMediaObject:v16 shouldUseAVPlayer:[(CKAudioController *)self shouldUseAVPlayer]];
        [(CKAudioPlayer *)v17 setDelegate:self];
        [(CKAudioController *)self setAudioPlayer:v17];
        id location = 0;
        objc_initWeak(&location, v17);
        v18 = +[CKAudioSessionController shareInstance];
        unint64_t v19 = [(CKAudioController *)self audioSessionControllerOptions];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __36__CKAudioController_playAfterDelay___block_invoke_3;
        v22[3] = &unk_1E5629140;
        v11 = v17;
        v23 = v11;
        v26[1] = *(id *)&a3;
        objc_copyWeak(&v25, (id *)buf);
        objc_copyWeak(v26, &location);
        v24 = self;
        [v18 activateWithOptions:v19 completion:v22];

        v20 = [(CKAudioController *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          [(CKAudioPlayer *)v11 duration];
          [v20 audioController:self mediaObjectProgressDidChange:v16 currentTime:0.0 duration:v21];
        }

        objc_destroyWeak(v26);
        objc_destroyWeak(&v25);

        objc_destroyWeak(&location);
      }
    }
  }
  objc_destroyWeak((id *)buf);
}

void __36__CKAudioController_playAfterDelay___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 64);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  int v6 = __36__CKAudioController_playAfterDelay___block_invoke_2;
  id v7 = &unk_1E5629118;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  objc_copyWeak(&v9, (id *)(a1 + 56));
  [v2 playAfterDelay:&v4 completion:v3];
  objc_msgSend(*(id *)(a1 + 40), "setPlaying:", 1, v4, v5, v6, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
}

void __36__CKAudioController_playAfterDelay___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2) {
    [WeakRetained audioPlayerDidFinishPlaying:v4];
  }
}

void __36__CKAudioController_playAfterDelay___block_invoke_3(id *a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CKAudioController_playAfterDelay___block_invoke_4;
  aBlock[3] = &unk_1E5629140;
  id v4 = a1[4];
  v7[1] = a1[8];
  objc_copyWeak(&v6, a1 + 6);
  objc_copyWeak(v7, a1 + 7);
  id v5 = a1[5];
  v2 = (void (**)(void))_Block_copy(aBlock);
  if ([a1[5] shouldUseSpeaker]) {
    v2[2](v2);
  }
  else {
    [a1[5] playListenSound:v2];
  }

  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

void __36__CKAudioController_playAfterDelay___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 64);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __36__CKAudioController_playAfterDelay___block_invoke_5;
  id v7 = &unk_1E5629118;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  objc_copyWeak(&v9, (id *)(a1 + 56));
  [v2 playAfterDelay:&v4 completion:v3];
  objc_msgSend(*(id *)(a1 + 40), "setPlaying:", 1, v4, v5, v6, v7);
  [*(id *)(a1 + 40) setCurrentMediaPlayerInfo];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
}

void __36__CKAudioController_playAfterDelay___block_invoke_5(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2) {
    [WeakRetained audioPlayerDidFinishPlaying:v4];
  }
}

- (void)prepareToPlay
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__42;
  double v21 = __Block_byref_object_dispose__42;
  id v22 = 0;
  id v22 = [(CKAudioController *)self audioPlayer];
  if ([(id)v18[5] isPlaying])
  {
    double v3 = [(id)v18[5] mediaObject];
    [(CKAudioController *)self _notifyPlayerDidPrepareMediaObject:v3 successfully:1];
  }
  else
  {
    if ([(CKAudioController *)self currentIndex] == 0x7FFFFFFFFFFFFFFFLL) {
      [(CKAudioController *)self setCurrentIndex:0];
    }
    double v3 = [(CKAudioController *)self _mediaObjects];
    id v4 = (void *)v18[5];
    if (v4) {
      goto LABEL_6;
    }
    unint64_t v11 = [(CKAudioController *)self currentIndex];
    if (v11 >= [v3 count])
    {
      [(CKAudioController *)self _notifyPlayerDidPrepareMediaObject:0 successfully:0];
      goto LABEL_8;
    }
    id v4 = (void *)v18[5];
    if (v4)
    {
LABEL_6:
      uint64_t v5 = [v4 mediaObject];
    }
    else
    {
      uint64_t v5 = objc_msgSend(v3, "objectAtIndex:", -[CKAudioController currentIndex](self, "currentIndex"));
    }
    id v6 = (void *)v5;
    id v7 = +[CKAudioSessionController shareInstance];
    unint64_t v8 = [(CKAudioController *)self audioSessionControllerOptions];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__CKAudioController_prepareToPlay__block_invoke;
    v12[3] = &unk_1E5629168;
    id v9 = v7;
    id v13 = v9;
    v14 = self;
    id v10 = v6;
    id v15 = v10;
    v16 = &v17;
    [v9 activateWithOptions:v8 completion:v12];
  }
LABEL_8:

  _Block_object_dispose(&v17, 8);
}

uint64_t __34__CKAudioController_prepareToPlay__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isActive])
  {
    v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v2)
    {
      double v3 = -[CKAudioPlayer initWithMediaObject:shouldUseAVPlayer:]([CKAudioPlayer alloc], "initWithMediaObject:shouldUseAVPlayer:", *(void *)(a1 + 48), [*(id *)(a1 + 40) shouldUseAVPlayer]);
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDelegate:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) setAudioPlayer:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    return [v2 prepareToPlay];
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    return [v7 _notifyPlayerDidPrepareMediaObject:v8 successfully:0];
  }
}

- (void)pause
{
  double v3 = [(CKAudioController *)self audioPlayer];
  [v3 pause];

  [(CKAudioController *)self setPlaying:0];
  [(CKAudioController *)self setCurrentMediaPlayerInfo];
  id v4 = [(CKAudioController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 audioControllerDidPause:self];
  }
}

- (void)stop
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = [(CKAudioController *)self interrupted];
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Stop (interruption: %d)", (uint8_t *)v8, 8u);
    }
  }
  id v4 = [(CKAudioController *)self audioPlayer];
  [v4 stop];

  [(CKAudioController *)self setPlaying:0];
  if (![(CKAudioController *)self interrupted])
  {
    uint64_t v5 = +[CKAudioSessionController shareInstance];
    [v5 deactivate];
  }
  id v6 = [(CKAudioController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 audioControllerDidStop:self];
  }
  [(CKAudioController *)self clearMediaPlayerInfo];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"CKAudioControllerStoppedPlaybackNotification" object:0];
}

- (void)setCurrentTime:(double)a3
{
  uint64_t v5 = [(CKAudioController *)self audioPlayer];
  [v5 setVolume:0.0];

  id v6 = [(CKAudioController *)self audioPlayer];
  [v6 setCurrentTime:a3];

  [(CKAudioController *)self setCurrentMediaPlayerInfo];
  id v8 = [(CKAudioController *)self audioPlayer];
  LODWORD(v7) = 1.0;
  [v8 setVolume:v7];
}

- (void)layoutViewsForScrubbingTime:(double)a3
{
  id v6 = [(CKAudioController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(CKAudioController *)self currentMediaObject];
    [v6 audioController:self layoutViewsForScrubbingTime:v5 mediaObject:a3];
  }
}

- (void)setPlaybackSpeed:(double)a3
{
  id v4 = [(CKAudioController *)self audioPlayer];
  [v4 setPlaybackSpeed:a3];
}

- (double)playbackSpeed
{
  v2 = [(CKAudioController *)self audioPlayer];
  [v2 playbackSpeed];
  double v4 = v3;

  return v4;
}

- (CKMediaObject)currentMediaObject
{
  if (self->_currentIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    double v4 = [(CKAudioController *)self _mediaObjects];
    v2 = [v4 objectAtIndex:self->_currentIndex];
  }

  return (CKMediaObject *)v2;
}

- (double)currentMediaObjectTime
{
  v2 = [(CKAudioController *)self audioPlayer];
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (double)currentMediaObjectDuration
{
  v2 = [(CKAudioController *)self audioPlayer];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  id v5 = [(CKAudioController *)self audioPlayer];
  *(float *)&double v4 = a3;
  [v5 setVolume:v4];
}

- (float)volume
{
  v2 = [(CKAudioController *)self audioPlayer];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (void)audioPlayerDidGetInterrupted
{
  [(CKAudioController *)self setInterrupted:1];

  [(CKAudioController *)self stop];
}

- (void)audioPlayerCurrentTimeDidChange:(id)a3
{
  id v9 = a3;
  float v4 = [(CKAudioController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(CKAudioController *)self currentMediaObject];
    [v9 currentTime];
    double v7 = v6;
    [v9 duration];
    [v4 audioController:self mediaObjectProgressDidChange:v5 currentTime:v7 duration:v8];
  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAudioController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [(CKAudioController *)self currentMediaObject];
    [v5 audioController:self mediaObjectDidFinishPlaying:v6];
  }
  [v4 setDelegate:0];
  [(CKAudioController *)self setAudioPlayer:0];
  unint64_t v7 = self->_currentIndex + 1;
  double v8 = [(CKAudioController *)self _mediaObjects];
  unint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    if ([(CKAudioController *)self shouldUseSpeaker])
    {
      [(CKAudioController *)self stop];
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__CKAudioController_audioPlayerDidFinishPlaying___block_invoke;
      v10[3] = &unk_1E5620C40;
      v10[4] = self;
      [(CKAudioController *)self playListenEndSound:v10];
    }
  }
  else
  {
    ++self->_currentIndex;
    [(CKAudioController *)self play];
  }
}

uint64_t __49__CKAudioController_audioPlayerDidFinishPlaying___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

- (void)audioPlayerDidPrepareAudioToPlay:(id)a3 successfully:(BOOL)a4
{
  id v5 = [a3 mediaObject];
  [(CKAudioController *)self _notifyPlayerDidPrepareMediaObject:v5 successfully:1];
}

- (void)_notifyPlayerDidPrepareMediaObject:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  double v6 = [(CKAudioController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 audioController:self didPrepareMediaObjectToPlay:v7 successfully:v4];
  }
}

- (void)playListenSound:(id)a3
{
  id v4 = a3;
  id v5 = [CKAudioPlayer alloc];
  double v6 = [MEMORY[0x1E4F1CB10] ckURLForResource:@"MessageListen" withExtension:@"caf"];
  id v7 = [(CKAudioPlayer *)v5 initWithFileURL:v6];
  listenAudioPlayer = self->_listenAudioPlayer;
  self->_listenAudioPlayer = v7;

  id location = 0;
  objc_initWeak(&location, self);
  unint64_t v9 = self->_listenAudioPlayer;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__CKAudioController_playListenSound___block_invoke;
  v11[3] = &unk_1E5629190;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [(CKAudioPlayer *)v9 playAfterDelay:v11 completion:0.0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __37__CKAudioController_playListenSound___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  float v3 = WeakRetained;
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;

    float v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    float v3 = v6;
  }
}

- (void)playListenEndSound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CKAudioPlayer alloc];
  id v6 = [MEMORY[0x1E4F1CB10] ckURLForResource:@"MessageListenEnd" withExtension:@"caf"];
  id v7 = [(CKAudioPlayer *)v5 initWithFileURL:v6];
  listenAudioPlayer = self->_listenAudioPlayer;
  self->_listenAudioPlayer = v7;

  id location = 0;
  objc_initWeak(&location, self);
  unint64_t v9 = self->_listenAudioPlayer;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__CKAudioController_playListenEndSound___block_invoke;
  v11[3] = &unk_1E5629190;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [(CKAudioPlayer *)v9 playAfterDelay:v11 completion:0.0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __40__CKAudioController_playListenEndSound___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  float v3 = WeakRetained;
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;

    float v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    float v3 = v6;
  }
}

- (void)audioSessionInterruption:(id)a3
{
  [(CKAudioController *)self setInterrupted:1];
  id v4 = [(CKAudioController *)self audioPlayer];
  [v4 stop];

  [(CKAudioController *)self setInterrupted:0];
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    BOOL v3 = a3;
    self->_playing = a3;
    uint64_t v5 = [(CKAudioController *)self conversation];
    [v5 setCurrentlyPlayingAudio:v3];

    id v6 = [(CKAudioController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 audioControllerPlayingDidChange:self];
    }
  }
}

- (NSMutableArray)_mediaObjects
{
  return self->_mediaObjects;
}

- (void)_setMediaObjects:(id)a3
{
}

- (CKAudioControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAudioControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldUseSpeaker
{
  return self->_shouldUseSpeaker;
}

- (BOOL)shouldStopPlayingWhenSilent
{
  return self->_shouldStopPlayingWhenSilent;
}

- (BOOL)shouldDuckOthers
{
  return self->_shouldDuckOthers;
}

- (BOOL)shouldUseAVPlayer
{
  return self->_shouldUseAVPlayer;
}

- (void)setShouldUseAVPlayer:(BOOL)a3
{
  self->_shouldUseAVPlayer = a3;
}

- (CKAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaObjects, 0);

  objc_storeStrong((id *)&self->_listenAudioPlayer, 0);
}

- (void)setupMediaRemoteCommandCenter
{
  v2 = self;
  CKAudioController.setupMediaRemoteCommandCenter()();
}

- (void)setCurrentMediaPlayerInfo
{
  v2 = self;
  CKAudioController.setCurrentMediaPlayerInfo()();
}

- (void)clearMediaPlayerInfo
{
  BOOL v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_setNowPlayingInfo_, 0);
}

@end