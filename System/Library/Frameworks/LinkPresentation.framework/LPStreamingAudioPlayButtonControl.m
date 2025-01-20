@interface LPStreamingAudioPlayButtonControl
- (LPStreamingAudioPlayButtonControl)initWithAudio:(id)a3 style:(id)a4 theme:(id)a5 player:(id)a6;
- (id)playable;
- (void)audioPlayer:(id)a3 didChangeProgress:(float)a4;
- (void)audioPlayer:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)buttonPressed:(id)a3;
- (void)dealloc;
@end

@implementation LPStreamingAudioPlayButtonControl

- (LPStreamingAudioPlayButtonControl)initWithAudio:(id)a3 style:(id)a4 theme:(id)a5 player:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [(LPPlayButtonControl *)self initWithStyle:v9 theme:v10];
  v13 = v12;
  if (v12)
  {
    p_player = (id *)&v12->_player;
    objc_storeStrong((id *)&v12->_player, a6);
    v15 = [[LPAudioPlayerMediaPlayableAdaptor alloc] initWithPlayer:*p_player];
    playableAdaptor = v13->_playableAdaptor;
    v13->_playableAdaptor = v15;

    [*p_player addClient:v13];
    id v17 = *p_player;
    [*p_player progress];
    -[LPStreamingAudioPlayButtonControl audioPlayer:didChangeProgress:](v13, "audioPlayer:didChangeProgress:", v17);
    -[LPStreamingAudioPlayButtonControl audioPlayer:didTransitionToState:](v13, "audioPlayer:didTransitionToState:", *p_player, [*p_player state]);
    v18 = v13;
  }

  return v13;
}

- (void)dealloc
{
  [(LPAudioPlayer *)self->_player removeClient:self];
  v3.receiver = self;
  v3.super_class = (Class)LPStreamingAudioPlayButtonControl;
  [(LPStreamingAudioPlayButtonControl *)&v3 dealloc];
}

- (void)audioPlayer:(id)a3 didTransitionToState:(unint64_t)a4
{
  [(LPPlayButtonControl *)self setPlayButtonState:(a4 & 0xFFFFFFFFFFFFFFFBLL) != 0];
  [(LPPlayButtonControl *)self showPlayIndicator:a4 - 3 < 0xFFFFFFFFFFFFFFFELL];
  if (a4 == 1)
  {
    [(LPPlayButtonControl *)self beginIndeterminateAnimation];
  }
  else
  {
    [(LPPlayButtonControl *)self endIndeterminateAnimation];
  }
}

- (void)audioPlayer:(id)a3 didChangeProgress:(float)a4
{
  [(LPAudioPlayer *)self->_player progress];

  -[LPPlayButtonControl setProgress:animated:](self, "setProgress:animated:", 1);
}

- (void)buttonPressed:(id)a3
{
  if ([(LPAudioPlayer *)self->_player state] == 1 || [(LPAudioPlayer *)self->_player state] == 2)
  {
    player = self->_player;
    [(LPAudioPlayer *)player pause];
  }
  else
  {
    v5 = self->_player;
    [(LPAudioPlayer *)v5 play];
  }
}

- (id)playable
{
  return self->_playableAdaptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playableAdaptor, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end