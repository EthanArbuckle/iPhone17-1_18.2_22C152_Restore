@interface AVMediaPlaybackControls
- (AVMediaPlaybackControls)initWithPlayer:(id)a3;
- (AVMediaPlaybackControls)initWithSource:(id)a3;
- (AVMediaPlaybackControlsDelegate)delegate;
- (AVMediaPlaybackControlsSource)source;
- (AVMediaSecondaryPlaybackControlConfiguration)backwardSecondaryControlConfiguration;
- (AVMediaSecondaryPlaybackControlConfiguration)forwardSecondaryControlConfiguration;
- (AVMobileChromelessPlaybackControlsView)playbackControlsView;
- (AVPlayer)player;
- (AVPlayerController)playerController;
- (CGSize)intrinsicContentSize;
- (uint64_t)_commonInit;
- (uint64_t)_updateBackwardSecondaryControlIcon;
- (uint64_t)_updateForwardSecondaryControlIcon;
- (void)_startObservations;
- (void)_updatePlayPauseButtonIcon;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)playbackControlsViewBackwardSecondaryControlWasPressed:(id)a3;
- (void)playbackControlsViewForwardSecondaryControlWasPressed:(id)a3;
- (void)playbackControlsViewPlayPauseButtonWasPressed:(id)a3;
- (void)setBackwardSecondaryControlConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForwardSecondaryControlConfiguration:(id)a3;
- (void)setPlaybackControlsView:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation AVMediaPlaybackControls

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_playbackControlsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_forwardSecondaryControlConfiguration, 0);
  objc_storeStrong((id *)&self->_backwardSecondaryControlConfiguration, 0);

  objc_storeStrong((id *)&self->_observationController, 0);
}

- (void)setPlayerController:(id)a3
{
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlaybackControlsView:(id)a3
{
}

- (AVMobileChromelessPlaybackControlsView)playbackControlsView
{
  return self->_playbackControlsView;
}

- (void)setDelegate:(id)a3
{
}

- (AVMediaPlaybackControlsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMediaPlaybackControlsDelegate *)WeakRetained;
}

- (AVMediaPlaybackControlsSource)source
{
  return self->_source;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)playbackControlsViewForwardSecondaryControlWasPressed:(id)a3
{
  id v9 = a3;
  if (self->_player)
  {
    if ([v9 forwardSecondaryControlIcon])
    {
      if ([v9 forwardSecondaryControlIcon] != 2) {
        goto LABEL_7;
      }
      v4 = [(AVMediaPlaybackControls *)self playerController];
      [v4 seekToEnd:self];
    }
    else
    {
      v4 = [(AVMediaPlaybackControls *)self playerController];
      [v4 currentTime];
      [v4 seekToTime:v5 + 10.0];
    }
  }
LABEL_7:
  v6 = [(AVMediaPlaybackControls *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(AVMediaPlaybackControls *)self delegate];
    [v8 mediaPlaybackControlsForwardSecondaryControlPressed:self];
  }
}

- (void)playbackControlsViewBackwardSecondaryControlWasPressed:(id)a3
{
  id v9 = a3;
  if (self->_player && ![v9 backwardSecondaryControlIcon])
  {
    v4 = [(AVMediaPlaybackControls *)self playerController];
    [v4 currentTime];
    [v4 seekToTime:v5 + -10.0];
  }
  v6 = [(AVMediaPlaybackControls *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(AVMediaPlaybackControls *)self delegate];
    [v8 mediaPlaybackControlsBackwardSecondaryControlPressed:self];
  }
}

- (void)playbackControlsViewPlayPauseButtonWasPressed:(id)a3
{
  id v8 = a3;
  if (self->_player)
  {
    v4 = [(AVMediaPlaybackControls *)self playerController];
    [v4 togglePlayback:self];
  }
  double v5 = [(AVMediaPlaybackControls *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(AVMediaPlaybackControls *)self delegate];
    [v7 mediaPlaybackControlsPlayPauseButtonPressed:self];
  }
}

- (AVMediaSecondaryPlaybackControlConfiguration)forwardSecondaryControlConfiguration
{
  v2 = (void *)[(AVMediaSecondaryPlaybackControlConfiguration *)self->_forwardSecondaryControlConfiguration copy];

  return (AVMediaSecondaryPlaybackControlConfiguration *)v2;
}

- (void)setForwardSecondaryControlConfiguration:(id)a3
{
  if (self->_forwardSecondaryControlConfiguration != a3)
  {
    v4 = (AVMediaSecondaryPlaybackControlConfiguration *)[a3 copy];
    forwardSecondaryControlConfiguration = self->_forwardSecondaryControlConfiguration;
    self->_forwardSecondaryControlConfiguration = v4;

    -[AVMediaPlaybackControls _updateForwardSecondaryControlIcon]((uint64_t)self);
  }
}

- (uint64_t)_updateForwardSecondaryControlIcon
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 424);
    v3 = *(void **)(v1 + 456);
    if (v2)
    {
      uint64_t v4 = [v2 type];
      if (v4 == 1) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 2 * (v4 == 2);
      }
      [v3 setForwardSecondaryControlIcon:v5];
      objc_msgSend(*(id *)(v1 + 456), "setForwardSecondaryControlEnabled:", objc_msgSend(*(id *)(v1 + 424), "isEnabled"));
      char v6 = *(void **)(v1 + 456);
      uint64_t v7 = 1;
    }
    else
    {
      char v6 = *(void **)(v1 + 456);
      uint64_t v7 = 0;
    }
    return [v6 setShowsForwardSecondaryPlaybackButton:v7];
  }
  return result;
}

- (AVMediaSecondaryPlaybackControlConfiguration)backwardSecondaryControlConfiguration
{
  v2 = (void *)[(AVMediaSecondaryPlaybackControlConfiguration *)self->_backwardSecondaryControlConfiguration copy];

  return (AVMediaSecondaryPlaybackControlConfiguration *)v2;
}

- (void)setBackwardSecondaryControlConfiguration:(id)a3
{
  if (self->_backwardSecondaryControlConfiguration != a3)
  {
    uint64_t v4 = (AVMediaSecondaryPlaybackControlConfiguration *)[a3 copy];
    backwardSecondaryControlConfiguration = self->_backwardSecondaryControlConfiguration;
    self->_backwardSecondaryControlConfiguration = v4;

    -[AVMediaPlaybackControls _updateBackwardSecondaryControlIcon]((uint64_t)self);
  }
}

- (uint64_t)_updateBackwardSecondaryControlIcon
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 416);
    v3 = *(void **)(v1 + 456);
    if (v2)
    {
      uint64_t v4 = [v2 type];
      if (v4 == 1) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 2 * (v4 == 2);
      }
      [v3 setBackwardSecondaryControlIcon:v5];
      objc_msgSend(*(id *)(v1 + 456), "setBackwardSecondaryControlEnabled:", objc_msgSend(*(id *)(v1 + 416), "isEnabled"));
      char v6 = *(void **)(v1 + 456);
      uint64_t v7 = 1;
    }
    else
    {
      char v6 = *(void **)(v1 + 456);
      uint64_t v7 = 0;
    }
    return [v6 setShowsBackwardSecondaryPlaybackButton:v7];
  }
  return result;
}

- (void)setSource:(id)a3
{
  uint64_t v5 = (AVMediaPlaybackControlsSource *)a3;
  if (self->_source != v5)
  {
    uint64_t v7 = v5;
    [(AVObservationController *)self->_observationController stopAllObservation];
    player = self->_player;
    self->_player = 0;

    objc_storeStrong((id *)&self->_source, a3);
    -[AVMediaPlaybackControls _startObservations]((uint64_t)self);
    -[AVMediaPlaybackControls _updatePlayPauseButtonIcon](self);
    uint64_t v5 = v7;
  }
}

- (void)_startObservations
{
  v6[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(void *)(a1 + 432))
    {
      v2 = *(void **)(a1 + 408);
      v6[0] = @"playerController.rate";
      v6[1] = @"playerController.timeControlStatus";
      v6[2] = @"playerController.playbackSuspended";
      v6[3] = @"playerController.suspendedRate";
      v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
      id v4 = (id)[v2 startObserving:a1 keyPaths:v3 observationHandler:&__block_literal_global_3622];
    }
    else if (*(void *)(a1 + 440))
    {
      id v5 = (id)[*(id *)(a1 + 408) startObserving:a1 keyPath:@"source.playing" observationHandler:&__block_literal_global_52];
    }
  }
}

- (void)_updatePlayPauseButtonIcon
{
  if (a1)
  {
    if (a1[54])
    {
      v2 = [a1 playerController];
      if ([v2 timeControlStatus])
      {
        BOOL v3 = 0;
      }
      else
      {
        [v2 rate];
        BOOL v3 = v6 == 0.0;
      }
      if (objc_msgSend(v2, "avkit_isAVPlayerControllerOrSubclass"))
      {
        [v2 suspendedRate];
        int v8 = [v2 isPlaybackSuspended] ^ 1 | (v7 == 0.0);
      }
      else
      {
        int v8 = 1;
      }
      uint64_t v5 = v3 & v8;
    }
    else
    {
      id v4 = (void *)a1[55];
      if (v4) {
        uint64_t v5 = [v4 isPlaying] ^ 1;
      }
      else {
        uint64_t v5 = 1;
      }
    }
    id v9 = [a1 playbackControlsView];
    [v9 setPlayPauseButtonShowsPlayIcon:v5];
  }
}

void __45__AVMediaPlaybackControls__startObservations__block_invoke_2(uint64_t a1, void *a2)
{
}

void __45__AVMediaPlaybackControls__startObservations__block_invoke(uint64_t a1, void *a2)
{
}

- (void)setPlayer:(id)a3
{
  int v8 = (AVPlayer *)a3;
  if (self->_player != v8)
  {
    [(AVObservationController *)self->_observationController stopAllObservation];
    source = self->_source;
    self->_source = 0;

    objc_storeStrong((id *)&self->_player, a3);
    double v6 = [[AVPlayerController alloc] initWithPlayer:v8];
    playerController = self->_playerController;
    self->_playerController = v6;

    -[AVMediaPlaybackControls _startObservations]((uint64_t)self);
    -[AVMediaPlaybackControls _updatePlayPauseButtonIcon](self);
  }
}

- (CGSize)intrinsicContentSize
{
  [(AVMobileChromelessPlaybackControlsView *)self->_playbackControlsView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AVMediaPlaybackControls;
  [(AVMediaPlaybackControls *)&v4 layoutSubviews];
  double v3 = [(AVMediaPlaybackControls *)self playbackControlsView];
  [(AVMediaPlaybackControls *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)didMoveToWindow
{
  v10.receiver = self;
  v10.super_class = (Class)AVMediaPlaybackControls;
  [(AVMediaPlaybackControls *)&v10 didMoveToWindow];
  double v3 = [(AVMediaPlaybackControls *)self window];

  if (v3)
  {
    if (self)
    {
      if (!self->_observationController)
      {
        objc_super v4 = [[AVObservationController alloc] initWithOwner:self];
        observationController = self->_observationController;
        self->_observationController = v4;
      }
      -[AVMediaPlaybackControls _startObservations]((uint64_t)self);
      if (!self->_playbackControlsView)
      {
        double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
        double v7 = [v6 traitCollection];

        int v8 = [[AVMobileChromelessControlsStyleSheet alloc] initWithTraitCollection:v7];
        id v9 = [[AVMobileChromelessPlaybackControlsView alloc] initWithStyleSheet:v8];
        [(AVMobileChromelessPlaybackControlsView *)v9 setAutoresizingMask:0];
        [(AVMobileChromelessPlaybackControlsView *)v9 setDelegate:self];
        [(AVMobileChromelessPlaybackControlsView *)v9 setShowsPlayPauseButton:1];
        [(AVMediaPlaybackControls *)self setPlaybackControlsView:v9];
        [(AVMediaPlaybackControls *)self addSubview:self->_playbackControlsView];
      }
    }
    else
    {
      -[AVMediaPlaybackControls _startObservations](0);
    }
    -[AVMediaPlaybackControls _updatePlayPauseButtonIcon](self);
    -[AVMediaPlaybackControls _updateBackwardSecondaryControlIcon]((uint64_t)self);
    -[AVMediaPlaybackControls _updateForwardSecondaryControlIcon]((uint64_t)self);
  }
  else if (self)
  {
    [(AVObservationController *)self->_observationController stopAllObservation];
  }
}

- (void)dealloc
{
  if (self) {
    [(AVObservationController *)self->_observationController stopAllObservation];
  }
  observationController = self->_observationController;
  self->_observationController = 0;

  playerController = self->_playerController;
  self->_playerController = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVMediaPlaybackControls;
  [(AVMediaPlaybackControls *)&v5 dealloc];
}

- (AVMediaPlaybackControls)initWithSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVMediaPlaybackControls;
  double v6 = -[AVMediaPlaybackControls initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    -[AVMediaPlaybackControls _commonInit]((uint64_t)v7);
  }

  return v7;
}

- (uint64_t)_commonInit
{
  double v2 = objc_alloc_init(AVMediaSecondaryPlaybackControlConfiguration);
  double v3 = *(void **)(a1 + 416);
  *(void *)(a1 + 416) = v2;

  objc_super v4 = objc_alloc_init(AVMediaSecondaryPlaybackControlConfiguration);
  uint64_t v5 = *(void *)(a1 + 424);
  *(void *)(a1 + 424) = v4;

  return MEMORY[0x1F41817F8](v4, v5);
}

- (AVMediaPlaybackControls)initWithPlayer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMediaPlaybackControls;
  double v6 = -[AVMediaPlaybackControls initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    int v8 = [[AVPlayerController alloc] initWithPlayer:v5];
    playerController = v7->_playerController;
    v7->_playerController = v8;

    -[AVMediaPlaybackControls _commonInit]((uint64_t)v7);
  }

  return v7;
}

@end