@interface IMAudioPlayer
+ (IMAudioPlayer)audioPlayerWithContentsOfURL:(id)a3;
+ (IMAudioPlayer)audioPlayerWithContentsOfURL:(id)a3 shouldUseAVPlayer:(BOOL)a4;
- (BOOL)isPlaying;
- (BOOL)usesAVPlayer;
- (IMAudioPlayer)initWithContentsOfURL:(id)a3;
- (IMAudioPlayer)initWithContentsOfURL:(id)a3 shouldUseAVPlayer:(BOOL)a4;
- (IMAudioPlayerDelegate)delegate;
- (IMDisplayLink)displayLink;
- (IMInternalAVAudioPlayer)audioPlayer;
- (NSURL)audioURL;
- (double)currentTime;
- (double)duration;
- (double)prevCurrentTime;
- (float)volume;
- (id)block;
- (void)dealloc;
- (void)internalAVAudioPlayerDidPrepareAudioForPlaying:(id)a3 successfully:(BOOL)a4;
- (void)internalAudioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)pause;
- (void)playAfterDelay:(double)a3 completion:(id)a4;
- (void)prepareToPlay;
- (void)setAudioPlayer:(id)a3;
- (void)setAudioURL:(id)a3;
- (void)setBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setPrevCurrentTime:(double)a3;
- (void)setVolume:(float)a3;
- (void)startTimer;
- (void)stop;
- (void)stopTimer;
- (void)timerDidExpire:(id)a3;
@end

@implementation IMAudioPlayer

- (void)dealloc
{
  if (objc_msgSend_isPlaying(self->_audioPlayer, a2, v2) && self->_block)
  {
    v6 = objc_msgSend_audio(IMSharedUILogs, v4, v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2180FAC14(v6);
    }
  }
  objc_msgSend_setDelegate_(self->_audioPlayer, v4, 0);
  objc_msgSend_stopTimer(self, v7, v8);
  v9.receiver = self;
  v9.super_class = (Class)IMAudioPlayer;
  [(IMAudioPlayer *)&v9 dealloc];
}

- (IMAudioPlayer)initWithContentsOfURL:(id)a3 shouldUseAVPlayer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IMAudioPlayer;
  id v9 = [(IMAudioPlayer *)&v18 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_copy(v6, v7, v8);
    v11 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v10;

    v12 = [IMInternalAVAudioPlayer alloc];
    v14 = objc_msgSend_initWithContentsOfURL_playerType_(v12, v13, *((void *)v9 + 1), v4);
    objc_msgSend_setDelegate_(v14, v15, (uint64_t)v9);
    objc_msgSend_setAudioPlayer_(v9, v16, (uint64_t)v14);
  }
  return (IMAudioPlayer *)v9;
}

- (IMAudioPlayer)initWithContentsOfURL:(id)a3
{
  return (IMAudioPlayer *)objc_msgSend_initWithContentsOfURL_shouldUseAVPlayer_(self, a2, (uint64_t)a3, 0);
}

+ (IMAudioPlayer)audioPlayerWithContentsOfURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  shouldUseAVPlayer = objc_msgSend_initWithContentsOfURL_shouldUseAVPlayer_(v4, v5, (uint64_t)v3, 0);

  return (IMAudioPlayer *)shouldUseAVPlayer;
}

+ (IMAudioPlayer)audioPlayerWithContentsOfURL:(id)a3 shouldUseAVPlayer:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  shouldUseAVPlayer = objc_msgSend_initWithContentsOfURL_shouldUseAVPlayer_(v6, v7, (uint64_t)v5, v4);

  return (IMAudioPlayer *)shouldUseAVPlayer;
}

- (void)playAfterDelay:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v9 = fmax(a3, 0.0);
  id v19 = v6;
  if (self->_block)
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  objc_msgSend_setBlock_(self, v7, (uint64_t)v19);
LABEL_5:
  uint64_t v10 = objc_msgSend_audioPlayer(self, v7, v8);
  objc_msgSend_deviceCurrentTime(v10, v11, v12);
  objc_msgSend_playAtTime_(v10, v14, v15, v9 + v13);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained) {
    objc_msgSend_startTimer(self, v17, v18);
  }
}

- (BOOL)usesAVPlayer
{
  id v3 = objc_msgSend_audioPlayer(self, a2, v2);
  BOOL v6 = objc_msgSend_playerType(v3, v4, v5) == 1;

  return v6;
}

- (void)startTimer
{
  objc_msgSend_stopTimer(self, a2, v2);
  objc_msgSend_displayLinkWithTarget_selector_(IMDisplayLink, v4, (uint64_t)self, sel_timerDidExpire_);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_schedule(v8, v5, v6);
  objc_msgSend_setDisplayLink_(self, v7, (uint64_t)v8);
}

- (void)stopTimer
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    objc_msgSend_invalidate(displayLink, a2, v2);
    uint64_t v5 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)timerDidExpire:(id)a3
{
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audioPlayerCurrentTimeDidChange_(v5, v4, (uint64_t)self);
}

- (void)stop
{
  BOOL v4 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_setDelegate_(v4, v5, 0);

  id v8 = objc_msgSend_audioPlayer(self, v6, v7);
  objc_msgSend_stop(v8, v9, v10);

  objc_msgSend_stopTimer(self, v11, v12);
}

- (void)pause
{
  BOOL v4 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_pause(v4, v5, v6);

  objc_msgSend_stopTimer(self, v7, v8);
}

- (void)prepareToPlay
{
  objc_msgSend_audioPlayer(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prepareToPlay(v5, v3, v4);
}

- (BOOL)isPlaying
{
  id v3 = objc_msgSend_audioPlayer(self, a2, v2);
  char isPlaying = objc_msgSend_isPlaying(v3, v4, v5);

  return isPlaying;
}

- (double)currentTime
{
  double prevCurrentTime = self->_prevCurrentTime;
  uint64_t v5 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_currentTime(v5, v6, v7);
  double v9 = v8;

  if (prevCurrentTime >= v9) {
    double result = prevCurrentTime;
  }
  else {
    double result = v9;
  }
  self->_double prevCurrentTime = result;
  return result;
}

- (double)duration
{
  id v3 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_duration(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (void)setVolume:(float)a3
{
  objc_msgSend_audioPlayer(self, a2, v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&double v5 = a3;
  objc_msgSend_setVolume_(v8, v6, v7, v5);
}

- (float)volume
{
  uint64_t v3 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_volume(v3, v4, v5);
  float v7 = v6;

  return v7;
}

- (void)internalAudioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = self;
  block = (void (**)(id, uint64_t, BOOL, void))v5->_block;
  uint64_t v10 = v5;
  if (block)
  {
    block[2](block, 1, v4, 0);
    uint64_t v5 = v10;
    id v7 = v10->_block;
  }
  else
  {
    id v7 = 0;
  }
  v5->_block = 0;

  objc_msgSend_stopTimer(v10, v8, v9);
}

- (void)internalAVAudioPlayerDidPrepareAudioForPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_audioPlayerDidPrepareAudioToPlay_successfully_(v7, v6, (uint64_t)self, v4);
  }
}

- (NSURL)audioURL
{
  return self->_audioURL;
}

- (void)setAudioURL:(id)a3
{
}

- (IMAudioPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMAudioPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMInternalAVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (double)prevCurrentTime
{
  return self->_prevCurrentTime;
}

- (void)setPrevCurrentTime:(double)a3
{
  self->_double prevCurrentTime = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (IMDisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioURL, 0);
}

@end