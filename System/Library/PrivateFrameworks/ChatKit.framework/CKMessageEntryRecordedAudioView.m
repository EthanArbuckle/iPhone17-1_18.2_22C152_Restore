@interface CKMessageEntryRecordedAudioView
- (BOOL)cachedWaveFormImageIsValid;
- (BOOL)isPlaying;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAudioController)audioController;
- (CKAudioMediaObject)audioMediaObject;
- (CKMessageEntryRecordedAudioView)initWithFrame:(CGRect)a3;
- (CKMessageEntryRecordedAudioViewDelegate)delegate;
- (NSString)timeFormat;
- (UIButton)playPauseDeleteButton;
- (UIImage)waveformImage;
- (UIImageView)balloonImageView;
- (UIImageView)waveformImageView;
- (UILabel)timeLabel;
- (UIVisualEffectView)blurView;
- (double)time;
- (void)audioController:(id)a3 mediaObjectDidFinishPlaying:(id)a4;
- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6;
- (void)audioControllerDidPause:(id)a3;
- (void)audioControllerDidStop:(id)a3;
- (void)dealloc;
- (void)handlePlayPauseDelete:(id)a3;
- (void)layoutSubviews;
- (void)pause;
- (void)play;
- (void)setAudioController:(id)a3;
- (void)setAudioMediaObject:(id)a3;
- (void)setBalloonImageView:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setCachedWaveFormImageIsValid:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPlayPauseDeleteButton:(id)a3;
- (void)setTime:(double)a3;
- (void)setTimeFormat:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)setWaveformImage:(id)a3;
- (void)setWaveformImageView:(id)a3;
- (void)stop;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePlayPauseDeleteButton;
- (void)updateProgress;
- (void)updateTimeString;
@end

@implementation CKMessageEntryRecordedAudioView

- (CKMessageEntryRecordedAudioView)initWithFrame:(CGRect)a3
{
  v42.receiver = self;
  v42.super_class = (Class)CKMessageEntryRecordedAudioView;
  v3 = -[CKMessageEntryRecordedAudioView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 entryFieldShouldUseBackdropView];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F43028]);
      v7 = [MEMORY[0x1E4F427D8] effectWithStyle:1];
      v8 = (void *)[v6 initWithEffect:v7];

      v9 = [v8 contentView];
      v10 = [v9 layer];
      v11 = +[CKUIBehavior sharedBehaviors];
      v12 = [v11 theme];
      id v13 = [v12 entryFieldAudioRecordingBalloonColor];
      objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

      v14 = [v8 contentView];
      v15 = [v14 layer];
      [v15 setCompositingFilter:*MEMORY[0x1E4F3A298]];

      v16 = [v8 layer];
      [v16 setMasksToBounds:1];

      [(CKMessageEntryRecordedAudioView *)v3 setBlurView:v8];
      [(CKMessageEntryRecordedAudioView *)v3 addSubview:v8];
      [(CKMessageEntryRecordedAudioView *)v3 setBlurView:0];
      [v8 removeFromSuperview];
    }
    else
    {
      LODWORD(v35) = 0x1000000;
      long long v37 = CKColorZero;
      *((void *)&v35 + 1) = -1;
      char v36 = -2;
      long long v38 = *(_OWORD *)&qword_18F81CEF8;
      uint64_t v39 = 1;
      uint64_t v40 = 0;
      int v41 = 0;
      v8 = CKResizableBalloonMask(&v35);
      id v17 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v18 = [v8 imageWithRenderingMode:2];
      v19 = (void *)[v17 initWithImage:v18];

      v20 = +[CKUIBehavior sharedBehaviors];
      v21 = [v20 theme];
      v22 = [v21 entryFieldAudioRecordingBalloonColor];
      [v19 setTintColor:v22];

      [(CKMessageEntryRecordedAudioView *)v3 setBalloonImageView:v19];
      [(CKMessageEntryRecordedAudioView *)v3 addSubview:v19];
    }
    [(CKMessageEntryRecordedAudioView *)v3 updatePlayPauseDeleteButton];
    id v23 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v24 = *MEMORY[0x1E4F1DB28];
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v28 = objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], v25, v26, v27);
    [v28 setContentMode:8];
    [v28 setClipsToBounds:1];
    [(CKMessageEntryRecordedAudioView *)v3 addSubview:v28];
    [(CKMessageEntryRecordedAudioView *)v3 setWaveformImageView:v28];
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v24, v25, v26, v27);
    v30 = +[CKUIBehavior sharedBehaviors];
    v31 = [v30 audioBalloonTimeFont];
    [v29 setFont:v31];

    v32 = [MEMORY[0x1E4F428B8] whiteColor];
    [v29 setTextColor:v32];

    v33 = CKLocalizedStringForDuration(0.0);
    [v29 setText:v33];

    [(CKMessageEntryRecordedAudioView *)v3 setTimeLabel:v29];
    [(CKMessageEntryRecordedAudioView *)v3 addSubview:v29];
    [(CKMessageEntryRecordedAudioView *)v3 setTimeLabel:0];
    [v29 removeFromSuperview];
  }
  return v3;
}

- (void)updatePlayPauseDeleteButton
{
  if (!self->_playPauseDeleteButton)
  {
    v3 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    playPauseDeleteButton = self->_playPauseDeleteButton;
    self->_playPauseDeleteButton = v3;

    int v5 = self->_playPauseDeleteButton;
    id v6 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIButton *)v5 setTintColor:v6];

    v7 = self->_playPauseDeleteButton;
    v8 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UIButton *)v7 setTintColor:v8];

    [(UIButton *)self->_playPauseDeleteButton setOpaque:0];
    [(UIButton *)self->_playPauseDeleteButton addTarget:self action:sel_handlePlayPauseDelete_ forEvents:64];
    [(CKMessageEntryRecordedAudioView *)self addSubview:self->_playPauseDeleteButton];
  }
  if (CKIsRunningInMacCatalyst())
  {
    if ([(CKMessageEntryRecordedAudioView *)self isPlaying]) {
      v9 = @"AudioPause";
    }
    else {
      v9 = @"AudioPlay";
    }
    v10 = [MEMORY[0x1E4F42A80] ckImageNamed:v9];
    id v16 = [v10 imageWithRenderingMode:2];

    BOOL v11 = [(CKMessageEntryRecordedAudioView *)self isPlaying];
    v12 = @"pauseAudioRecordingButton";
    if (v11) {
      v12 = @"playAudioRecordingButton";
    }
    id v13 = v12;
  }
  else
  {
    v14 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43870] scale:1];
    v15 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"xmark"];
    id v16 = [v15 imageWithSymbolConfiguration:v14];

    id v13 = @"deleteAudioRecordingButton";
  }
  [(UIButton *)self->_playPauseDeleteButton setImage:v16 forState:0];
  [(UIButton *)self->_playPauseDeleteButton accessibilitySetIdentification:v13];
  [(CKMessageEntryRecordedAudioView *)self setNeedsLayout];
}

- (void)handlePlayPauseDelete:(id)a3
{
  if (CKIsRunningInMacCatalyst())
  {
    BOOL v4 = [(CKMessageEntryRecordedAudioView *)self isPlaying];
    int v5 = [(CKMessageEntryRecordedAudioView *)self delegate];
    id v6 = v5;
    if (v4) {
      [v5 messageEntryRecordedAudioViewPressedPause:self];
    }
    else {
      [v5 messageEntryRecordedAudioViewPressedPlay:self];
    }
  }
  else
  {
    id v6 = [(CKMessageEntryRecordedAudioView *)self delegate];
    [v6 messageEntryRecordedAudioViewPressedDelete:self];
  }
}

- (void)dealloc
{
  [(CKAudioController *)self->_audioController setDelegate:0];
  [(CKAudioController *)self->_audioController stop];
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryRecordedAudioView;
  [(CKMessageEntryRecordedAudioView *)&v3 dealloc];
}

- (void)setAudioMediaObject:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = (CKAudioMediaObject *)a3;
  if (self->_audioMediaObject != v5)
  {
    objc_storeStrong((id *)&self->_audioMediaObject, a3);
    id v6 = [(CKMessageEntryRecordedAudioView *)self audioController];
    [v6 stop];

    if (v5)
    {
      v7 = [CKAudioController alloc];
      v8 = [(CKMessageEntryRecordedAudioView *)self audioMediaObject];
      v11[0] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      v10 = [(CKAudioController *)v7 initWithMediaObjects:v9 conversation:0];

      [(CKAudioController *)v10 setDelegate:self];
      [(CKMessageEntryRecordedAudioView *)self setAudioController:v10];
    }
    else
    {
      [(CKMessageEntryRecordedAudioView *)self setAudioController:0];
    }
    [(CKMessageEntryRecordedAudioView *)self setWaveformImage:0];
    self->_cachedWaveFormImageIsValid = 0;
    [(CKMessageEntryRecordedAudioView *)self updateTimeString];
    [(CKMessageEntryRecordedAudioView *)self updateProgress];
    [(CKMessageEntryRecordedAudioView *)self setNeedsLayout];
  }
}

- (void)updateTimeString
{
  [(CKMessageEntryRecordedAudioView *)self time];
  double v4 = v3;
  int v5 = [(CKMessageEntryRecordedAudioView *)self audioController];
  char v6 = [v5 isPlaying];

  if ((v6 & 1) == 0)
  {
    v7 = [(CKMessageEntryRecordedAudioView *)self audioMediaObject];
    [v7 duration];
    double v4 = v8;
  }
  id v10 = [(CKMessageEntryRecordedAudioView *)self timeLabel];
  v9 = CKLocalizedStringForDuration(v4);
  [v10 setText:v9];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKMessageEntryRecordedAudioView *)self frame];
  if (v9 != width || v8 != height) {
    [(CKMessageEntryRecordedAudioView *)self setWaveformImage:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryRecordedAudioView;
  -[CKMessageEntryRecordedAudioView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v10) = 0x1000000;
  long long v12 = CKColorZero;
  *((void *)&v10 + 1) = -1;
  char v11 = -2;
  long long v13 = *(_OWORD *)&qword_18F81CEF8;
  uint64_t v14 = 1;
  uint64_t v15 = 0;
  int v16 = 0;
  double v3 = CKResizableBalloonMask(&v10);
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(CKMessageEntryRecordedAudioView *)self waveformImage];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(CKMessageEntryRecordedAudioView *)self waveformImage];
    double v7 = [v6 traitCollection];
    int v8 = [v7 hasDifferentColorAppearanceComparedToTraitCollection:v9];

    if (v8)
    {
      self->_cachedWaveFormImageIsValid = 0;
      [(CKMessageEntryRecordedAudioView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)CKMessageEntryRecordedAudioView;
  [(CKMessageEntryRecordedAudioView *)&v63 layoutSubviews];
  [(CKMessageEntryRecordedAudioView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  char v11 = [(CKMessageEntryRecordedAudioView *)self blurView];
  long long v12 = [v11 layer];
  [v12 setCornerRadius:v10 * 0.5];

  double v13 = v8;
  if (!CKIsRunningInMacCatalyst())
  {
    uint64_t v14 = +[CKUIBehavior sharedBehaviors];
    [v14 balloonMaskTailSizeForTailShape:1];
    double v13 = v8 - v15;
  }
  int v16 = [(CKMessageEntryRecordedAudioView *)self blurView];
  objc_msgSend(v16, "setFrame:", v4, v6, v13, v10);

  id v17 = [(CKMessageEntryRecordedAudioView *)self balloonImageView];
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  v18 = +[CKUIBehavior sharedBehaviors];
  [v18 entryViewLeftInsetForRecordedAudioCancelButton];
  double v20 = v19;

  v21 = +[CKUIBehavior sharedBehaviors];
  [v21 sendButtonSize];
  double v23 = v22;
  double v24 = +[CKUIBehavior sharedBehaviors];
  [v24 entryViewSendButtonCoverSpace];
  double v26 = v23 + v25;

  double v27 = v4 + v20;
  double v28 = v6 + 0.0;
  double v29 = v8 - (v20 + v26);
  v30 = [(CKMessageEntryRecordedAudioView *)self playPauseDeleteButton];
  [v30 sizeToFit];
  [v30 frame];
  double v32 = v31;
  double v34 = v33;
  double v35 = v4 + v20 + 3.0;
  if (CKIsRunningInMacCatalyst())
  {
    double v32 = v10 + -6.0;
    double v34 = v10 + -6.0;
  }
  if (CKMainScreenScale_once_41 != -1) {
    dispatch_once(&CKMainScreenScale_once_41, &__block_literal_global_104);
  }
  double v36 = *(double *)&CKMainScreenScale_sMainScreenScale_41;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_41 == 0.0) {
    double v36 = 1.0;
  }
  CGFloat v37 = 1.0 / v36 * (v28 * v36 + floor((v10 * v36 - v34 * v36) * 0.5));
  objc_msgSend(v30, "setFrame:", v27 + 3.0, v37, v32, v34);
  long long v38 = [(CKMessageEntryRecordedAudioView *)self timeLabel];
  objc_msgSend(v38, "sizeThatFits:", v29, v10);
  CGFloat rect = v32;
  double v40 = v39;

  v64.origin.double x = v27;
  v64.origin.double y = v28;
  v64.size.double width = v29;
  v64.size.double height = v10;
  CGFloat v41 = CGRectGetMaxX(v64) - v40;
  objc_super v42 = +[CKUIBehavior sharedBehaviors];
  [v42 audioBalloonTimeInset];
  CGFloat v44 = v41 - v43;

  v45 = [(CKMessageEntryRecordedAudioView *)self timeLabel];
  objc_msgSend(v45, "setFrame:", v44, v28, v40, v10);

  v46 = [(CKMessageEntryRecordedAudioView *)self waveformImageView];
  v65.origin.double x = v35;
  v65.origin.double y = v37;
  v65.size.double width = rect;
  v65.size.double height = v34;
  double v47 = CGRectGetMaxX(v65) + 6.0;
  v66.origin.double x = v44;
  v66.origin.double y = v28;
  v66.size.double width = v40;
  v66.size.double height = v10;
  double MinX = CGRectGetMinX(v66);
  v49 = +[CKUIBehavior sharedBehaviors];
  [v49 audioBalloonWaveformTimeSpace];
  double v51 = MinX - v50;

  double v52 = v51 - v47;
  if (!self->_cachedWaveFormImageIsValid)
  {
    v53 = +[CKUIBehavior sharedBehaviors];
    v54 = [v53 theme];
    v55 = [v54 entryFieldBorderColor];

    v56 = [(CKMessageEntryRecordedAudioView *)self audioMediaObject];
    v57 = [v56 composeWaveformForWidth:1 orientation:v55 withColor:v51 - v47];

    [(CKMessageEntryRecordedAudioView *)self setWaveformImage:v57];
    v58 = [(CKMessageEntryRecordedAudioView *)self waveformImageView];
    [v58 setImage:v57];

    self->_cachedWaveFormImageIsValid = 1;
  }
  objc_msgSend(v46, "frame", *(void *)&rect);
  objc_msgSend(v46, "sizeThatFits:", v29, v10);
  double v60 = v59;
  if (CKMainScreenScale_once_41 != -1) {
    dispatch_once(&CKMainScreenScale_once_41, &__block_literal_global_104);
  }
  double v61 = *(double *)&CKMainScreenScale_sMainScreenScale_41;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_41 == 0.0) {
    double v61 = 1.0;
  }
  objc_msgSend(v46, "setFrame:", v47, 1.0 / v61 * (v28 * v61 + floor((v10 * v61 - v60 * v61) * 0.5)), v52, v60);
}

- (void)updateProgress
{
  double v3 = [(CKMessageEntryRecordedAudioView *)self audioMediaObject];
  double v4 = [(CKMessageEntryRecordedAudioView *)self audioController];
  [(CKMessageEntryRecordedAudioView *)self time];
  double v6 = v5;
  [v3 duration];
  double v8 = v7;
  +[CKAudioProgressView progressForTime:v6 duration:v7];
  float v10 = v9;
  char v11 = [v4 isPlaying];
  long long v12 = [(CKMessageEntryRecordedAudioView *)self delegate];
  [v12 messageEntryRecordedAudioViewPlaybackProgressDidChange:v6];

  if (v6 == 0.0) {
    char v13 = v11;
  }
  else {
    char v13 = 1;
  }
  if (v6 == v8 || (v13 & 1) == 0)
  {
    self->_cachedWaveFormImageIsValid = 0;
    [(CKMessageEntryRecordedAudioView *)self setNeedsLayout];
  }
  else
  {
    uint64_t v14 = [(CKMessageEntryRecordedAudioView *)self waveformImage];
    [v14 size];
    if (v16 != 0.0)
    {
      double v17 = v15;
      if (v15 != 0.0)
      {
        double v18 = v16;
        double v19 = +[CKUIBehavior sharedBehaviors];
        unint64_t v20 = [v19 waveformPowerLevelWidthIncrement];

        v21 = +[CKUIBehavior sharedBehaviors];
        unint64_t v22 = [v21 waveformPowerLevelWidth];
        double v23 = +[CKUIBehavior sharedBehaviors];
        unint64_t v24 = [v23 waveformGapWidth];

        if (CKMainScreenScale_once_41 != -1) {
          dispatch_once(&CKMainScreenScale_once_41, &__block_literal_global_104);
        }
        long double v25 = (1.0 - v10) * (v17 / (double)v20);
        double v26 = fmod(v25, 1.0) * (double)v22 + (double)(unint64_t)v25 * (double)v20 + (double)v24;
        double v27 = *(double *)&CKMainScreenScale_sMainScreenScale_41;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_41 == 0.0) {
          double v27 = 1.0;
        }
        double v28 = floor(v26 * v27) / v27;
        double v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v17, v18);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __49__CKMessageEntryRecordedAudioView_updateProgress__block_invoke;
        v32[3] = &unk_1E5627C00;
        char v37 = 1;
        id v33 = v14;
        double v34 = v17;
        double v35 = v18;
        double v36 = v28;
        v30 = [v29 imageWithActions:v32];
        double v31 = [(CKMessageEntryRecordedAudioView *)self waveformImageView];
        [v31 setImage:v30];
      }
    }
  }
}

void __49__CKMessageEntryRecordedAudioView_updateProgress__block_invoke(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 64) == 255)
  {
    objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    float v9 = +[CKUIBehavior sharedBehaviors];
    float v10 = [v9 theme];
    char v11 = [v10 waveformUnplayedColor];
    [v11 set];

    long long v12 = +[CKUIBehavior sharedBehaviors];
    char v13 = [v12 theme];
    uint64_t v14 = [v13 waveformUnplayedColorNewAudioMessagesFlow];
    [v14 set];

    uint64_t v16 = *(void *)(a1 + 48);
    double v15 = *(double *)(a1 + 56);
    double v17 = *(double *)(a1 + 40) - v15;
    uint64_t v18 = 0;
    UIRectFillUsingBlendMode(*(CGRect *)&v17, kCGBlendModeSourceIn);
  }
  else
  {
    v2 = [MEMORY[0x1E4F428B8] blackColor];
    [v2 set];

    double v3 = +[CKUIBehavior sharedBehaviors];
    double v4 = [v3 theme];
    double v5 = [v4 entryFieldBorderColor];
    [v5 set];

    v20.size.double height = *(CGFloat *)(a1 + 48);
    v20.size.double width = *(double *)(a1 + 40) - *(double *)(a1 + 56);
    v20.origin.double x = 0.0;
    v20.origin.double y = 0.0;
    UIRectFill(v20);
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 18, *MEMORY[0x1E4F1DAD8], v7, 1.0);
    double v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "drawAtPoint:blendMode:alpha:", 0, v6, v7, 0.33);
  }
}

- (void)play
{
  id v2 = [(CKMessageEntryRecordedAudioView *)self audioController];
  [v2 play];
}

- (void)pause
{
  id v2 = [(CKMessageEntryRecordedAudioView *)self audioController];
  [v2 pause];
}

- (void)stop
{
  id v2 = [(CKMessageEntryRecordedAudioView *)self audioController];
  [v2 stop];
}

- (BOOL)isPlaying
{
  id v2 = [(CKMessageEntryRecordedAudioView *)self audioController];
  char v3 = [v2 isPlaying];

  return v3;
}

- (void)audioController:(id)a3 mediaObjectDidFinishPlaying:(id)a4
{
  id v5 = a4;
  [(CKMessageEntryRecordedAudioView *)self setTime:0.0];
  [(CKMessageEntryRecordedAudioView *)self updateTimeString];
  [(CKMessageEntryRecordedAudioView *)self updateProgress];
  id v6 = [(CKMessageEntryRecordedAudioView *)self delegate];
  [v6 messageEntryRecordedAudioView:self mediaObjectDidFinishPlaying:v5];
}

- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6
{
  -[CKMessageEntryRecordedAudioView setTime:](self, "setTime:", a3, a4, a5, a6);
  [(CKMessageEntryRecordedAudioView *)self updateTimeString];

  [(CKMessageEntryRecordedAudioView *)self updateProgress];
}

- (void)audioControllerDidPause:(id)a3
{
  [(CKMessageEntryRecordedAudioView *)self updateTimeString];

  [(CKMessageEntryRecordedAudioView *)self updateProgress];
}

- (void)audioControllerDidStop:(id)a3
{
  -[CKMessageEntryRecordedAudioView setTime:](self, "setTime:", a3, 0.0);
  [(CKMessageEntryRecordedAudioView *)self updateTimeString];
  [(CKMessageEntryRecordedAudioView *)self updateProgress];
  id v4 = [(CKMessageEntryRecordedAudioView *)self delegate];
  [v4 messageEntryRecordedAudioViewPlaybackDidStop];
}

- (CKAudioMediaObject)audioMediaObject
{
  return self->_audioMediaObject;
}

- (UIButton)playPauseDeleteButton
{
  return self->_playPauseDeleteButton;
}

- (void)setPlayPauseDeleteButton:(id)a3
{
}

- (CKMessageEntryRecordedAudioViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMessageEntryRecordedAudioViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (UIImageView)balloonImageView
{
  return self->_balloonImageView;
}

- (void)setBalloonImageView:(id)a3
{
}

- (CKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (UIImage)waveformImage
{
  return self->_waveformImage;
}

- (void)setWaveformImage:(id)a3
{
}

- (UIImageView)waveformImageView
{
  return self->_waveformImageView;
}

- (void)setWaveformImageView:(id)a3
{
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (NSString)timeFormat
{
  return self->_timeFormat;
}

- (void)setTimeFormat:(id)a3
{
}

- (BOOL)cachedWaveFormImageIsValid
{
  return self->_cachedWaveFormImageIsValid;
}

- (void)setCachedWaveFormImageIsValid:(BOOL)a3
{
  self->_cachedWaveFormImageIsValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFormat, 0);
  objc_storeStrong((id *)&self->_waveformImageView, 0);
  objc_storeStrong((id *)&self->_waveformImage, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_balloonImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playPauseDeleteButton, 0);

  objc_storeStrong((id *)&self->_audioMediaObject, 0);
}

@end