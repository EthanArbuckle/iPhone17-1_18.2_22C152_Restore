@interface LPAudioPlayerMediaPlayableAdaptor
- (BOOL)hasMuteControl;
- (BOOL)isPlaying;
- (LPAudioPlayerMediaPlayableAdaptor)initWithPlayer:(id)a3;
- (void)resetPlaybackState;
- (void)setPlaying:(BOOL)a3;
@end

@implementation LPAudioPlayerMediaPlayableAdaptor

- (LPAudioPlayerMediaPlayableAdaptor)initWithPlayer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPAudioPlayerMediaPlayableAdaptor;
  v5 = [(LPAudioPlayerMediaPlayableAdaptor *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_player, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isPlaying
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  BOOL v3 = [WeakRetained state] == 2;

  return v3;
}

- (void)setPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  id v5 = WeakRetained;
  if (v3) {
    [WeakRetained play];
  }
  else {
    [WeakRetained pause];
  }
}

- (void)resetPlaybackState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  [WeakRetained reset];
}

- (BOOL)hasMuteControl
{
  return 0;
}

- (void).cxx_destruct
{
}

@end