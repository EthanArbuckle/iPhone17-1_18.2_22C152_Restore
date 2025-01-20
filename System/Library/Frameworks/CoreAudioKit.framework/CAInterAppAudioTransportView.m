@interface CAInterAppAudioTransportView
- (BOOL)isConnected;
- (BOOL)isEnabled;
- (BOOL)isHostConnected;
- (BOOL)isPlaying;
- (BOOL)isRecording;
- (CAInterAppAudioTransportView)initWithCoder:(id)a3;
- (CAInterAppAudioTransportView)initWithFrame:(CGRect)a3;
- (UIColor)labelColor;
- (UIColor)pauseButtonColor;
- (UIColor)playButtonColor;
- (UIColor)recordButtonColor;
- (UIColor)rewindButtonColor;
- (UIFont)currentTimeLabelFont;
- (id)getPlayTimeString;
- (void)appHasGoneForeground;
- (void)appHasGoneInBackground;
- (void)audioUnitPropertyChangedListener:(void *)a3 unit:(OpaqueAudioComponentInstance *)a4 propID:(unsigned int)a5 scope:(unsigned int)a6 element:(unsigned int)a7;
- (void)dealloc;
- (void)getHostCallbackInfo;
- (void)initialize;
- (void)layoutSubviews;
- (void)pollHost;
- (void)rewindAction:(id)a3;
- (void)sendStateToRemoteHost:(unsigned int)a3;
- (void)setCurrentTimeLabelFont:(UIFont *)currentTimeLabelFont;
- (void)setEnabled:(BOOL)enabled;
- (void)setLabelColor:(UIColor *)labelColor;
- (void)setOutputAudioUnit:(AudioUnit)au;
- (void)setPauseButtonColor:(UIColor *)pauseButtonColor;
- (void)setPlayButtonColor:(UIColor *)playButtonColor;
- (void)setRecordButtonColor:(UIColor *)recordButtonColor;
- (void)setRewindButtonColor:(UIColor *)rewindButtonColor;
- (void)startPollingPlayer;
- (void)stopPollingPlayer;
- (void)togglePlayback:(id)a3;
- (void)toggleRecording:(id)a3;
- (void)updateStatefromTransportCallBack;
- (void)updateTransportControls;
@end

@implementation CAInterAppAudioTransportView

- (void)initialize
{
  -[CAInterAppAudioTransportView setBackgroundColor:](self, "setBackgroundColor:", [MEMORY[0x263F825C8] clearColor]);
  [(CAInterAppAudioTransportView *)self frame];
  float v4 = v3;
  double v5 = floorf(v4);
  v6 = [CAUITransportButton alloc];
  [(CAInterAppAudioTransportView *)self frame];
  float v8 = v7 - v5;
  self->playPauseButton = -[CAUITransportButton initWithFrame:](v6, "initWithFrame:", (float)(floorf(v8) * 0.5), 0.0, v5, v5);
  v9 = [CAUITransportButton alloc];
  [(CAUITransportButton *)self->playPauseButton frame];
  self->rewindButton = -[CAUITransportButton initWithFrame:](v9, "initWithFrame:", v10 - v5 + -35.0, 0.0, v5, v5);
  v11 = [CAUITransportButton alloc];
  [(CAUITransportButton *)self->playPauseButton frame];
  self->recordButton = -[CAUITransportButton initWithFrame:](v11, "initWithFrame:", v12 + v5 + 35.0, 0.0, v5, v5);
  [(CAUITransportButton *)self->rewindButton setDrawingStyle:1];
  [(CAUITransportButton *)self->playPauseButton setDrawingStyle:2];
  [(CAUITransportButton *)self->recordButton setDrawingStyle:4];
  -[CAUITransportButton setFillColor:](self->rewindButton, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F825C8], "colorWithWhite:alpha:", 0.063000001, 1.0), "CGColor"));
  v13 = (UIColor *)(id)[MEMORY[0x263F825C8] colorWithWhite:0.063000001 alpha:1.0];
  self->pauseButtonColor = v13;
  v14 = v13;
  self->playButtonColor = v14;
  [(CAUITransportButton *)self->playPauseButton setFillColor:[(UIColor *)v14 CGColor]];
  -[CAUITransportButton setFillColor:](self->recordButton, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F825C8], "colorWithRed:green:blue:alpha:", 0.984000027, 0.250999987, 0.172999993, 1.0), "CGColor"));
  [(CAUITransportButton *)self->rewindButton addTarget:self action:sel_rewindAction_ forControlEvents:64];
  [(CAUITransportButton *)self->playPauseButton addTarget:self action:sel_togglePlayback_ forControlEvents:64];
  [(CAUITransportButton *)self->recordButton addTarget:self action:sel_toggleRecording_ forControlEvents:64];
  [(CAInterAppAudioTransportView *)self addSubview:self->rewindButton];
  [(CAInterAppAudioTransportView *)self addSubview:self->playPauseButton];
  [(CAInterAppAudioTransportView *)self addSubview:self->recordButton];
  uint64_t v15 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  id v16 = objc_alloc(MEMORY[0x263F828E0]);
  self->currentTimeLabel = (UILabel *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  -[CAInterAppAudioTransportView setLabelColor:](self, "setLabelColor:", [MEMORY[0x263F825C8] blackColor]);
  [(UILabel *)self->currentTimeLabel setText:@"00:00:00"];
  [(UILabel *)self->currentTimeLabel setFont:[(CAInterAppAudioTransportView *)self currentTimeLabelFont]];
  [(UILabel *)self->currentTimeLabel setTextColor:[(CAInterAppAudioTransportView *)self labelColor]];
  -[UILabel setBackgroundColor:](self->currentTimeLabel, "setBackgroundColor:", [MEMORY[0x263F825C8] clearColor]);
  [(UILabel *)self->currentTimeLabel setTextAlignment:0];
  [(CAInterAppAudioTransportView *)self setCurrentTimeLabelFont:v15];
  [(CAInterAppAudioTransportView *)self addSubview:self->currentTimeLabel];
  self->_playing = 0;
  self->_recording = 0;
  self->_connected = 0;
  v17 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v17 addObserver:self selector:sel_appHasGoneInBackground name:*MEMORY[0x263F83330] object:0];
  v18 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v18 addObserver:self selector:sel_appHasGoneForeground name:*MEMORY[0x263F833B8] object:0];
  self->inForeground = objc_msgSend((id)objc_msgSend(MEMORY[0x263F82438], "sharedApplication"), "applicationState") != 2;

  [(CAInterAppAudioTransportView *)self updateTransportControls];
}

- (CAInterAppAudioTransportView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAInterAppAudioTransportView;
  double v3 = -[CAInterAppAudioTransportView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  float v4 = v3;
  if (v3) {
    [(CAInterAppAudioTransportView *)v3 initialize];
  }
  return v4;
}

- (CAInterAppAudioTransportView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAInterAppAudioTransportView;
  double v3 = [(CAInterAppAudioTransportView *)&v6 initWithCoder:a3];
  float v4 = v3;
  if (v3) {
    [(CAInterAppAudioTransportView *)v3 initialize];
  }
  return v4;
}

- (void)dealloc
{
  callBackInfo = self->callBackInfo;
  if (callBackInfo) {
    free(callBackInfo);
  }

  v4.receiver = self;
  v4.super_class = (Class)CAInterAppAudioTransportView;
  [(CAInterAppAudioTransportView *)&v4 dealloc];
}

- (BOOL)isEnabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->enabled != enabled)
  {
    BOOL v3 = enabled;
    -[CAUITransportButton setEnabled:](self->recordButton, "setEnabled:");
    [(CAUITransportButton *)self->playPauseButton setEnabled:v3];
    rewindButton = self->rewindButton;
    [(CAUITransportButton *)rewindButton setEnabled:v3];
  }
}

- (UIColor)labelColor
{
  return [(UILabel *)self->currentTimeLabel textColor];
}

- (void)setLabelColor:(UIColor *)labelColor
{
}

- (void)setCurrentTimeLabelFont:(UIFont *)currentTimeLabelFont
{
  v14[1] = *MEMORY[0x263EF8340];
  -[UILabel setFont:](self->currentTimeLabel, "setFont:");
  double v5 = [(UILabel *)self->currentTimeLabel text];
  uint64_t v13 = *MEMORY[0x263F814F0];
  v14[0] = currentTimeLabelFont;
  -[NSString sizeWithAttributes:](v5, "sizeWithAttributes:", [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1]);
  double v7 = v6;
  double v9 = v8;
  [(CAInterAppAudioTransportView *)self frame];
  double v11 = v10 - v7;
  [(CAInterAppAudioTransportView *)self frame];
  -[UILabel setFrame:](self->currentTimeLabel, "setFrame:", v11, (v12 - v9) * 0.5, v7, v9);
}

- (UIColor)rewindButtonColor
{
  v2 = (void *)MEMORY[0x263F825C8];
  BOOL v3 = [(CAUITransportButton *)self->rewindButton fillColor];

  return (UIColor *)[v2 colorWithCGColor:v3];
}

- (void)setRewindButtonColor:(UIColor *)rewindButtonColor
{
  objc_super v4 = [(UIColor *)rewindButtonColor CGColor];
  rewindButton = self->rewindButton;

  [(CAUITransportButton *)rewindButton setFillColor:v4];
}

- (UIColor)playButtonColor
{
  return self->playButtonColor;
}

- (void)setPlayButtonColor:(UIColor *)playButtonColor
{
  double v5 = playButtonColor;

  self->playButtonColor = playButtonColor;
  if ([(CAUITransportButton *)self->playPauseButton drawingStyle] == 3)
  {
    double v6 = [(UIColor *)self->playButtonColor CGColor];
    playPauseButton = self->playPauseButton;
    [(CAUITransportButton *)playPauseButton setFillColor:v6];
  }
}

- (UIColor)pauseButtonColor
{
  return self->pauseButtonColor;
}

- (void)setPauseButtonColor:(UIColor *)pauseButtonColor
{
  double v5 = pauseButtonColor;

  self->pauseButtonColor = pauseButtonColor;
  if ([(CAUITransportButton *)self->playPauseButton drawingStyle] == 2)
  {
    double v6 = [(UIColor *)self->pauseButtonColor CGColor];
    playPauseButton = self->playPauseButton;
    [(CAUITransportButton *)playPauseButton setFillColor:v6];
  }
}

- (UIColor)recordButtonColor
{
  v2 = (void *)MEMORY[0x263F825C8];
  BOOL v3 = [(CAUITransportButton *)self->recordButton fillColor];

  return (UIColor *)[v2 colorWithCGColor:v3];
}

- (void)setRecordButtonColor:(UIColor *)recordButtonColor
{
  objc_super v4 = [(UIColor *)recordButtonColor CGColor];
  recordButton = self->recordButton;

  [(CAUITransportButton *)recordButton setFillColor:v4];
}

- (void)setOutputAudioUnit:(AudioUnit)au
{
  outputUnit = self->outputUnit;
  if (outputUnit != au)
  {
    if (outputUnit)
    {
      uint64_t v6 = AudioUnitRemovePropertyListenerWithUserData(outputUnit, 0x65u, (AudioUnitPropertyListenerProc)_CAIAAAUTransportPropertyChangeDispatcher, self);
      if (v6) {
        NSLog(&cfstr_ErrorRemovingP.isa, v6);
      }
      uint64_t v7 = AudioUnitRemovePropertyListenerWithUserData(self->outputUnit, 0x7DDu, (AudioUnitPropertyListenerProc)_CAIAAAUTransportPropertyChangeDispatcher, self);
      if (v7) {
        NSLog(&cfstr_ErrorRemovingP_0.isa, v7);
      }
    }
    self->outputUnit = au;
    if (au)
    {
      uint64_t v8 = AudioUnitAddPropertyListener(au, 0x65u, (AudioUnitPropertyListenerProc)_CAIAAAUTransportPropertyChangeDispatcher, self);
      if (v8) {
        NSLog(&cfstr_ErrorAddingPro.isa, v8);
      }
      uint64_t v9 = AudioUnitAddPropertyListener(self->outputUnit, 0x7DDu, (AudioUnitPropertyListenerProc)_CAIAAAUTransportPropertyChangeDispatcher, self);
      if (v9) {
        NSLog(&cfstr_ErrorAddingPro_0.isa, v9);
      }
    }
  }
}

- (void)startPollingPlayer
{
  if ([(CAInterAppAudioTransportView *)self isHostConnected]
    && self->inForeground
    && !self->pollingPlayerTimer)
  {
    self->pollingPlayerTimer = (NSTimer *)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_pollHost selector:0 userInfo:1 repeats:0.05];
  }
}

- (void)stopPollingPlayer
{
  pollingPlayerTimer = self->pollingPlayerTimer;
  if (pollingPlayerTimer)
  {
    [(NSTimer *)pollingPlayerTimer invalidate];
    self->pollingPlayerTimer = 0;
  }
}

- (void)pollHost
{
  if ([(CAInterAppAudioTransportView *)self isHostConnected])
  {
    id v3 = [(CAInterAppAudioTransportView *)self getPlayTimeString];
    currentTimeLabel = self->currentTimeLabel;
    [(UILabel *)currentTimeLabel setText:v3];
  }
}

- (id)getPlayTimeString
{
  [(CAInterAppAudioTransportView *)self updateStatefromTransportCallBack];
  unint64_t playTime = (unint64_t)self->_playTime;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EF93E0], "sharedInstance"), "sampleRate");

  return (id)formattedTimeStringForFrameCountAndSampleRate(playTime, v4, 0);
}

- (void)appHasGoneInBackground
{
  self->inForeground = 0;
  [(CAInterAppAudioTransportView *)self stopPollingPlayer];
}

- (void)appHasGoneForeground
{
  self->inForeground = 1;
  if ([(CAInterAppAudioTransportView *)self isHostConnected]) {
    [(CAInterAppAudioTransportView *)self startPollingPlayer];
  }
  else {
    [(CAInterAppAudioTransportView *)self stopPollingPlayer];
  }
  [(CAInterAppAudioTransportView *)self updateStatefromTransportCallBack];

  [(CAInterAppAudioTransportView *)self updateTransportControls];
}

- (void)getHostCallbackInfo
{
  if ([(CAInterAppAudioTransportView *)self isConnected])
  {
    callBackInfo = self->callBackInfo;
    if (callBackInfo) {
      free(callBackInfo);
    }
    UInt32 ioDataSize = 40;
    double v4 = (HostCallbackInfo *)malloc_type_malloc(0x28uLL, 0xF66B2F95uLL);
    self->callBackInfo = v4;
    uint64_t Property = AudioUnitGetProperty(self->outputUnit, 0x1Bu, 0, 0, v4, &ioDataSize);
    if (Property)
    {
      NSLog(&cfstr_ErrorOccuredFe.isa, Property);
      free(self->callBackInfo);
      self->callBackInfo = 0;
    }
  }
}

- (void)updateStatefromTransportCallBack
{
  if ([(CAInterAppAudioTransportView *)self isHostConnected])
  {
    if (self->inForeground)
    {
      if (self->callBackInfo
        || ([(CAInterAppAudioTransportView *)self getHostCallbackInfo], self->callBackInfo))
      {
        BOOL v9 = [(CAInterAppAudioTransportView *)self isPlaying];
        BOOL v8 = [(CAInterAppAudioTransportView *)self isRecording];
        double v7 = 0.0;
        char v6 = 0;
        uint64_t v4 = 0;
        uint64_t v5 = 0;
        uint64_t v3 = ((uint64_t (*)(void *, BOOL *, BOOL *, void, double *, char *, uint64_t *, uint64_t *))self->callBackInfo->transportStateProc2)(self->callBackInfo->hostUserData, &v9, &v8, 0, &v7, &v6, &v5, &v4);
        if (v3)
        {
          NSLog(&cfstr_ErrorOccuredFe_0.isa, v3);
        }
        else
        {
          self->_playing = v9;
          self->_recording = v8;
          self->_unint64_t playTime = v7;
        }
      }
    }
  }
}

- (BOOL)isHostConnected
{
  outputUnit = self->outputUnit;
  if (outputUnit)
  {
    UInt32 ioDataSize = 4;
    int outData = 0;
    if (!AudioUnitGetProperty(outputUnit, 0x65u, 0, 0, &outData, &ioDataSize))
    {
      BOOL v4 = outData == 0;
      if (((v4 ^ [(CAInterAppAudioTransportView *)self isConnected]) & 1) == 0)
      {
        self->_connected = outData != 0;
        if ([(CAInterAppAudioTransportView *)self isConnected]) {
          [(CAInterAppAudioTransportView *)self getHostCallbackInfo];
        }
      }
    }
  }
  return [(CAInterAppAudioTransportView *)self isConnected];
}

- (void)rewindAction:(id)a3
{
  [(CAInterAppAudioTransportView *)self sendStateToRemoteHost:3];
  [(CAInterAppAudioTransportView *)self updateStatefromTransportCallBack];

  [(CAInterAppAudioTransportView *)self updateTransportControls];
}

- (void)togglePlayback:(id)a3
{
  int v4 = [(CAUITransportButton *)self->playPauseButton drawingStyle];
  uint64_t v5 = &OBJC_IVAR___CAInterAppAudioTransportView_pauseButtonColor;
  if (v4 == 3) {
    uint64_t v5 = &OBJC_IVAR___CAInterAppAudioTransportView_playButtonColor;
  }
  -[CAUITransportButton setFillColor:](self->playPauseButton, "setFillColor:", [*(id *)((char *)&self->super.super.super.isa + *v5) CGColor]);
  [(CAInterAppAudioTransportView *)self sendStateToRemoteHost:1];

  [(CAInterAppAudioTransportView *)self startPollingPlayer];
}

- (void)toggleRecording:(id)a3
{
}

- (void)sendStateToRemoteHost:(unsigned int)a3
{
  outputUnit = self->outputUnit;
  if (outputUnit)
  {
    uint64_t v4 = *(void *)&a3;
    unsigned int inData = a3;
    uint64_t v5 = AudioUnitSetProperty(outputUnit, 0x7DCu, 0, 0, &inData, 4u);
    if (v5) {
      NSLog(&cfstr_ErrorUpdatingR.isa, v4, v5);
    }
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)CAInterAppAudioTransportView;
  [(CAInterAppAudioTransportView *)&v10 layoutSubviews];
  [(CAInterAppAudioTransportView *)self frame];
  float v4 = v3;
  double v5 = floorf(v4);
  [(CAInterAppAudioTransportView *)self frame];
  float v7 = v6 - v5;
  -[CAUITransportButton setFrame:](self->playPauseButton, "setFrame:", (float)(floorf(v7) * 0.5), 0.0, v5, v5);
  [(CAUITransportButton *)self->playPauseButton frame];
  -[CAUITransportButton setFrame:](self->rewindButton, "setFrame:", v8 - v5 + -35.0, 0.0, v5, v5);
  [(CAUITransportButton *)self->playPauseButton frame];
  -[CAUITransportButton setFrame:](self->recordButton, "setFrame:", v9 + v5 + 35.0, 0.0, v5, v5);
}

- (void)updateTransportControls
{
  if ([(CAInterAppAudioTransportView *)self isRecording]) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  [(CAUITransportButton *)self->recordButton setDrawingStyle:v3];
  uint64_t v4 = 2;
  if (![(CAInterAppAudioTransportView *)self isPlaying])
  {
    if ([(CAInterAppAudioTransportView *)self isRecording]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 3;
    }
  }
  [(CAUITransportButton *)self->playPauseButton setDrawingStyle:v4];
  [(CAUITransportButton *)self->recordButton setEnabled:[(CAInterAppAudioTransportView *)self canRecord]];
  [(CAUITransportButton *)self->recordButton setUserInteractionEnabled:[(CAUITransportButton *)self->recordButton isEnabled]];
  if ([(CAUITransportButton *)self->recordButton isEnabled]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.25;
  }
  [(CAUITransportButton *)self->recordButton setAlpha:v5];
  [(CAUITransportButton *)self->playPauseButton setEnabled:[(CAInterAppAudioTransportView *)self canPlay]];
  [(CAUITransportButton *)self->playPauseButton setUserInteractionEnabled:[(CAUITransportButton *)self->playPauseButton isEnabled]];
  if ([(CAUITransportButton *)self->playPauseButton isEnabled]) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.25;
  }
  [(CAUITransportButton *)self->playPauseButton setAlpha:v6];
  [(CAUITransportButton *)self->rewindButton setEnabled:[(CAInterAppAudioTransportView *)self canRewind]];
  [(CAUITransportButton *)self->rewindButton setUserInteractionEnabled:[(CAUITransportButton *)self->rewindButton isEnabled]];
  if ([(CAUITransportButton *)self->rewindButton isEnabled]) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.25;
  }
  [(CAUITransportButton *)self->rewindButton setAlpha:v7];
  [(UILabel *)self->currentTimeLabel setEnabled:[(CAInterAppAudioTransportView *)self canPlay]];
  BOOL v8 = [(UILabel *)self->currentTimeLabel isEnabled];
  double v9 = 0.5;
  if (v8) {
    double v9 = 1.0;
  }
  [(UILabel *)self->currentTimeLabel setAlpha:v9];

  [(CAInterAppAudioTransportView *)self setNeedsDisplay];
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (UIFont)currentTimeLabelFont
{
  return self->_currentTimeLabelFont;
}

- (void)audioUnitPropertyChangedListener:(void *)a3 unit:(OpaqueAudioComponentInstance *)a4 propID:(unsigned int)a5 scope:(unsigned int)a6 element:(unsigned int)a7
{
  if (a5 == 2013)
  {
    [(CAInterAppAudioTransportView *)self updateStatefromTransportCallBack];
    [(CAInterAppAudioTransportView *)self performSelectorOnMainThread:sel_updateTransportControls withObject:0 waitUntilDone:0];
  }
  else if (a5 == 101)
  {
    [(CAInterAppAudioTransportView *)self isHostConnected];
  }
}

@end