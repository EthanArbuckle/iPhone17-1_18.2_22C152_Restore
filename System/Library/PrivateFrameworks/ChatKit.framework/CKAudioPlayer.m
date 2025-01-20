@interface CKAudioPlayer
- (BOOL)isPlaying;
- (BOOL)usesAVPlayer;
- (CADisplayLink)displayLink;
- (CKAudioPlayer)initWithFileURL:(id)a3;
- (CKAudioPlayer)initWithMediaObject:(id)a3;
- (CKAudioPlayer)initWithMediaObject:(id)a3 shouldUseAVPlayer:(BOOL)a4;
- (CKAudioPlayerDelegate)delegate;
- (CKInternalAudioPlayer)audioPlayer;
- (CKMediaObject)mediaObject;
- (double)currentTime;
- (double)duration;
- (double)playbackSpeed;
- (double)prevCurrentTime;
- (float)volume;
- (id)block;
- (void)_handleAudioPlayerInterruption:(id)a3;
- (void)dealloc;
- (void)displayLinkFired:(id)a3;
- (void)internalAudioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)internalAudioPlayerDidPrepareAudioForPlaying:(id)a3 successfully:(BOOL)a4;
- (void)pause;
- (void)playAfterDelay:(double)a3 completion:(id)a4;
- (void)prepareToPlay;
- (void)setAudioPlayer:(id)a3;
- (void)setBlock:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setMediaObject:(id)a3;
- (void)setPlaybackSpeed:(double)a3;
- (void)setPrevCurrentTime:(double)a3;
- (void)setVolume:(float)a3;
- (void)stop;
@end

@implementation CKAudioPlayer

- (void)dealloc
{
  if ([(CKInternalAudioPlayer *)self->_audioPlayer isPlaying]
    && self->_block
    && IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "CKAudioPlayer deallocated while playing, completion block won't be called.", buf, 2u);
    }
  }
  [(CKInternalAudioPlayer *)self->_audioPlayer setDelegate:0];
  [(CADisplayLink *)self->_displayLink invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CKAudioPlayer;
  [(CKAudioPlayer *)&v4 dealloc];
}

- (CKAudioPlayer)initWithMediaObject:(id)a3
{
  return [(CKAudioPlayer *)self initWithMediaObject:a3 shouldUseAVPlayer:0];
}

- (CKAudioPlayer)initWithMediaObject:(id)a3 shouldUseAVPlayer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKAudioPlayer;
  v7 = [(CKAudioPlayer *)&v16 init];
  v8 = v7;
  if (v7)
  {
    [(CKAudioPlayer *)v7 setMediaObject:v6];
    v9 = [CKInternalAudioPlayer alloc];
    v10 = [v6 fileURL];
    v11 = [(CKInternalAudioPlayer *)v9 initWithContentsOfURL:v10 playerType:v4];

    [(CKInternalAudioPlayer *)v11 setDelegate:v8];
    [(CKAudioPlayer *)v8 setAudioPlayer:v11];
    if (!v4)
    {
      v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v13 = *MEMORY[0x1E4F15000];
      v14 = [MEMORY[0x1E4F153E0] sharedInstance];
      [v12 addObserver:v8 selector:sel__handleAudioPlayerInterruption_ name:v13 object:v14];
    }
  }

  return v8;
}

- (CKAudioPlayer)initWithFileURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAudioPlayer;
  v5 = [(CKAudioPlayer *)&v9 init];
  if (v5)
  {
    id v6 = [[CKInternalAudioPlayer alloc] initWithContentsOfURL:v4 playerType:0];
    [(CKInternalAudioPlayer *)v6 setDelegate:v5];
    [(CKAudioPlayer *)v5 setAudioPlayer:v6];
    if ((!v4 || !v6) && IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v11 = v4;
        __int16 v12 = 2112;
        uint64_t v13 = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Couldn't create an audio player. URL=%@, audioPlayer=%@", buf, 0x16u);
      }
    }
  }

  return v5;
}

- (void)playAfterDelay:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = fmax(a3, 0.0);
  id v13 = v6;
  if (self->_block)
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  [(CKAudioPlayer *)self setBlock:v13];
LABEL_5:
  v8 = [(CKAudioPlayer *)self audioPlayer];
  [v8 deviceCurrentTime];
  [v8 playAtTime:v7 + v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v11 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_displayLinkFired_];
    [v11 setPreferredFramesPerSecond:60];
    __int16 v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CKAudioPlayer *)self setDisplayLink:v11];
  }
}

- (BOOL)usesAVPlayer
{
  v2 = [(CKAudioPlayer *)self audioPlayer];
  BOOL v3 = [v2 playerType] == 1;

  return v3;
}

- (void)stop
{
  BOOL v3 = [(CKAudioPlayer *)self audioPlayer];
  [v3 stop];

  id v4 = [(CKAudioPlayer *)self audioPlayer];
  [v4 resetCurrentTime];

  v5 = [(CKAudioPlayer *)self displayLink];
  [v5 invalidate];

  [(CKAudioPlayer *)self setDisplayLink:0];

  [(CKAudioPlayer *)self setPrevCurrentTime:0.0];
}

- (void)pause
{
  BOOL v3 = [(CKAudioPlayer *)self audioPlayer];
  [v3 pause];

  id v4 = [(CKAudioPlayer *)self displayLink];
  [v4 invalidate];

  [(CKAudioPlayer *)self setDisplayLink:0];
}

- (void)prepareToPlay
{
  id v2 = [(CKAudioPlayer *)self audioPlayer];
  [v2 prepareToPlay];
}

- (BOOL)isPlaying
{
  id v2 = [(CKAudioPlayer *)self audioPlayer];
  char v3 = [v2 isPlaying];

  return v3;
}

- (void)setCurrentTime:(double)a3
{
  v5 = [(CKAudioPlayer *)self audioPlayer];
  [v5 setCurrentTime:a3];

  id v6 = [(CKAudioPlayer *)self delegate];
  [v6 audioPlayerCurrentTimeDidChange:self];
}

- (double)currentTime
{
  char v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  [v3 isAudioMessagesEntryViewRecordingEnabled];

  id v4 = [(CKAudioPlayer *)self audioPlayer];
  [v4 currentTime];
  double v6 = v5;

  return v6;
}

- (void)setPlaybackSpeed:(double)a3
{
  id v4 = [(CKAudioPlayer *)self audioPlayer];
  [v4 setPlaybackSpeed:a3];
}

- (double)playbackSpeed
{
  id v2 = [(CKAudioPlayer *)self audioPlayer];
  [v2 playbackSpeed];
  double v4 = v3;

  return v4;
}

- (double)duration
{
  id v2 = [(CKAudioPlayer *)self audioPlayer];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  id v5 = [(CKAudioPlayer *)self audioPlayer];
  *(float *)&double v4 = a3;
  [v5 setVolume:v4];
}

- (float)volume
{
  id v2 = [(CKAudioPlayer *)self audioPlayer];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (void)internalAudioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = self;
  block = (void (**)(id, uint64_t, BOOL, void))v5->_block;
  double v9 = v5;
  if (block)
  {
    block[2](block, 1, v4, 0);
    id v5 = v9;
    id v7 = v9->_block;
  }
  else
  {
    id v7 = 0;
  }
  v5->_block = 0;

  v8 = [(CKAudioPlayer *)v9 displayLink];
  [v8 invalidate];

  [(CKAudioPlayer *)v9 setDisplayLink:0];
}

- (void)internalAudioPlayerDidPrepareAudioForPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CKAudioPlayer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 audioPlayerDidPrepareAudioToPlay:self successfully:v4];
  }
}

- (void)_handleAudioPlayerInterruption:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F15020]];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 1)
  {
    id v7 = [(CKAudioPlayer *)self delegate];
    [v7 audioPlayerDidGetInterrupted];
  }
}

- (void)displayLinkFired:(id)a3
{
  id v4 = [(CKAudioPlayer *)self delegate];
  [v4 audioPlayerCurrentTimeDidChange:self];
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
}

- (CKAudioPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAudioPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKInternalAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (double)prevCurrentTime
{
  return self->_prevCurrentTime;
}

- (void)setPrevCurrentTime:(double)a3
{
  self->_prevCurrentTime = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end