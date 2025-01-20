@interface BTMediaPlayerView
+ (Class)layerClass;
- (AVPlayer)avPlayer;
- (id)playerLayer;
- (void)loadMovieLoopWithPath:(id)a3 bannerInstance:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAvPlayer:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BTMediaPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)playerLayer
{
  return [(BTMediaPlayerView *)self layer];
}

- (AVPlayer)avPlayer
{
  v2 = [(BTMediaPlayerView *)self playerLayer];
  v3 = [v2 player];

  return (AVPlayer *)v3;
}

- (void)setAvPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(BTMediaPlayerView *)self playerLayer];
  [v5 setPlayer:v4];
}

- (void)loadMovieLoopWithPath:(id)a3 bannerInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_1000060CC;
  v25[4] = sub_1000060DC;
  id v26 = 0;
  v9 = +[NSURL fileURLWithPath:v6 isDirectory:0];
  id v10 = objc_alloc_init((Class)AVPlayer);
  [(BTMediaPlayerView *)self setAvPlayer:v10];

  v11 = [(BTMediaPlayerView *)self avPlayer];
  [v11 _setParticipatesInAudioSession:0];

  v12 = [(BTMediaPlayerView *)self avPlayer];
  [v12 setPreventsDisplaySleepDuringVideoPlayback:0];

  v13 = +[AVPlayerItem playerItemWithURL:v9];
  playerItem = self->_playerItem;
  self->_playerItem = v13;

  [(AVPlayerItem *)self->_playerItem asset];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000060E4;
  v21[3] = &unk_100018598;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v23 = self;
  v24 = v25;
  id v22 = v15;
  [v15 loadValuesAsynchronouslyForKeys:&off_1000191D0 completionHandler:v21];
  v16 = [(BTMediaPlayerView *)self avPlayer];
  [v16 replaceCurrentItemWithPlayerItem:self->_playerItem];

  v17 = [(BTMediaPlayerView *)self avPlayer];
  [v17 setAudiovisualBackgroundPlaybackPolicy:3];

  v18 = [(BTMediaPlayerView *)self playerLayer];
  [v18 setHidden:0];

  v19 = [(BTMediaPlayerView *)self avPlayer];
  [v19 play];

  if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v20 = [(BTMediaPlayerView *)self avPlayer];
  [v20 addObserver:self forKeyPath:@"status" options:5 context:0];

  _Block_object_dispose(v25, 8);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v16 = a5;
  id v8 = a4;
  v9 = [(BTMediaPlayerView *)self avPlayer];
  unsigned int v10 = [v8 isEqual:v9];

  v11 = v16;
  if (v10)
  {
    v12 = [v16 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = [v12 integerValue];
    }
    else {
      id v13 = 0;
    }
    if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize()))
    {
      id v15 = v13;
      LogPrintF();
    }
    if (v13 == (id)1)
    {
      if (dword_10001EDF0 <= 30 && (dword_10001EDF0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v14 = +[NSNotificationCenter defaultCenter];
      [v14 postNotificationName:@"VideoReadyToPlay" object:self];
    }
    v11 = v16;
  }
}

- (void)start
{
  id v2 = [(BTMediaPlayerView *)self avPlayer];
  [v2 play];
}

- (void)stop
{
  v3 = [(BTMediaPlayerView *)self avPlayer];
  [v3 removeObserver:self forKeyPath:@"status" context:0];

  id v4 = [(BTMediaPlayerView *)self avPlayer];
  [v4 pause];

  [(BTMediaPlayerView *)self setAvPlayer:0];
  avLooper = self->_avLooper;
  self->_avLooper = 0;

  playerItem = self->_playerItem;
  self->_playerItem = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItem, 0);

  objc_storeStrong((id *)&self->_avLooper, 0);
}

@end