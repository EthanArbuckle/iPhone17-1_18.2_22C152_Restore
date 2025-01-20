@interface SoundDetectionHistoryCell
- (SoundDetectionHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)avAudioSessionForPlayback;
- (void)_playButtonTapped:(id)a3;
- (void)_setPlayButtonState:(BOOL)a3;
- (void)_setupAudioPlayer:(id)a3;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)avAudioSessionForPlayback;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation SoundDetectionHistoryCell

- (SoundDetectionHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SoundDetectionHistoryCell;
  v9 = [(SoundDetectionHistoryCell *)&v16 initWithStyle:3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = +[UIImage systemImageNamed:@"play.fill"];
    v11 = +[UIButton systemButtonWithImage:v10 target:v9 action:"_playButtonTapped:"];
    v12 = [(SoundDetectionHistoryCell *)v9 contentView];
    [v12 addSubview:v11];

    [(SoundDetectionHistoryCell *)v9 setAccessoryView:v11];
    playButton = v9->_playButton;
    v9->_playButton = v11;
    v14 = v11;

    objc_storeStrong((id *)&v9->_specifier, a5);
  }

  return v9;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SoundDetectionHistoryCell;
  [(SoundDetectionHistoryCell *)&v12 refreshCellContentsWithSpecifier:v4];
  [(SoundDetectionHistoryCell *)self setUserInteractionEnabled:1];
  v5 = [v4 propertyForKey:PSTitleKey];
  v6 = [v4 propertyForKey:PSValueKey];
  if (!v5)
  {
    v5 = [v4 name];
  }
  v7 = [(SoundDetectionHistoryCell *)self titleLabel];
  [v7 setText:v5];

  if (v6)
  {
    id v8 = [(SoundDetectionHistoryCell *)self valueLabel];
    [v8 setText:v6];

    v9 = [(SoundDetectionHistoryCell *)self valueLabel];
    [v9 setHidden:0];
  }
  v10 = [v4 propertyForKey:@"audioFilePath"];
  if (v10)
  {
    objc_storeStrong((id *)&self->_audioFilePath, v10);
    [(SoundDetectionHistoryCell *)self _setupAudioPlayer:v10];
  }
  specifier = self->_specifier;
  self->_specifier = (PSSpecifier *)v4;

  [(SoundDetectionHistoryCell *)self setNeedsUpdateConstraints];
  [(SoundDetectionHistoryCell *)self setNeedsDisplay];
}

- (void)_playButtonTapped:(id)a3
{
  id v4 = a3;
  avAudioPlayer = self->_avAudioPlayer;
  if (avAudioPlayer)
  {
    unsigned int v6 = [(AVAudioPlayer *)avAudioPlayer isPlaying];
    v7 = self->_avAudioPlayer;
    if (v6)
    {
      [(AVAudioPlayer *)v7 stop];
      id v8 = self;
      uint64_t v9 = 0;
    }
    else
    {
      [(AVAudioPlayer *)v7 prepareToPlay];
      [(AVAudioPlayer *)self->_avAudioPlayer play];
      id v8 = self;
      uint64_t v9 = 1;
    }
    [(SoundDetectionHistoryCell *)v8 _setPlayButtonState:v9];
  }
  else
  {
    v10 = AXLogUltron();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SoundDetectionHistoryCell _playButtonTapped:](v10);
    }
  }
}

- (void)_setPlayButtonState:(BOOL)a3
{
  playButton = self->_playButton;
  if (a3) {
    CFStringRef v4 = @"stop.fill";
  }
  else {
    CFStringRef v4 = @"play.fill";
  }
  id v5 = +[UIImage systemImageNamed:v4];
  [(UIButton *)playButton setImage:v5 forState:0];
}

- (void)_setupAudioPlayer:(id)a3
{
  CFStringRef v4 = +[NSURL fileURLWithPath:a3];
  id v12 = 0;
  id v5 = (AVAudioPlayer *)[objc_alloc((Class)AVAudioPlayer) initWithContentsOfURL:v4 error:&v12];
  id v6 = v12;
  avAudioPlayer = self->_avAudioPlayer;
  self->_avAudioPlayer = v5;

  id v8 = self->_avAudioPlayer;
  uint64_t v9 = [(SoundDetectionHistoryCell *)self avAudioSessionForPlayback];
  [(AVAudioPlayer *)v8 setAudioSession:v9];

  [(AVAudioPlayer *)self->_avAudioPlayer setDelegate:self];
  LODWORD(v10) = 1.0;
  [(AVAudioPlayer *)self->_avAudioPlayer setVolume:v10];
  [(AVAudioPlayer *)self->_avAudioPlayer setNumberOfLoops:0];
  if (v6)
  {
    v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SoundDetectionHistoryCell _setupAudioPlayer:]((uint64_t)v6, v11);
    }
  }
}

- (id)avAudioSessionForPlayback
{
  avAudioSession = self->_avAudioSession;
  if (!avAudioSession)
  {
    CFStringRef v4 = +[AVAudioSession auxiliarySession];
    id v5 = self->_avAudioSession;
    self->_avAudioSession = v4;

    id v6 = self->_avAudioSession;
    id v10 = 0;
    [(AVAudioSession *)v6 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeDefault options:1 error:&v10];
    id v7 = v10;
    if (v7)
    {
      id v8 = AXLogUltron();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(SoundDetectionHistoryCell *)(uint64_t)v7 avAudioSessionForPlayback];
      }
    }
    avAudioSession = self->_avAudioSession;
  }

  return avAudioSession;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avAudioSession, 0);
  objc_storeStrong((id *)&self->_avAudioPlayer, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_audioFilePath, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

- (void)_playButtonTapped:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Ultron History - No Audio File Path Found!", v1, 2u);
}

- (void)_setupAudioPlayer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Ultron History - Error setting up audio session. Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)avAudioSessionForPlayback
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Ultron History - Failed to set up aux session for playback: %@", (uint8_t *)&v2, 0xCu);
}

@end