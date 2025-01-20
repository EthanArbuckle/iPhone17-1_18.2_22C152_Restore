@interface HURecordedWaveformView
- (HFAudioPlayer)audioPlayer;
- (HURecordedWaveformView)initWithFrame:(CGRect)a3 waveformColor:(id)a4 backgroundColor:(id)a5 tintColor:(id)a6;
- (NSArray)audioPowerLevels;
- (NSURL)audioFileURL;
- (UIButton)playRecordingButton;
- (UIColor)backgroundColor;
- (UIColor)waveformColor;
- (UIImage)waveformImage;
- (UIImageView)waveformImageView;
- (UILabel)timeLabel;
- (UIVisualEffectView)blurView;
- (double)duration;
- (double)minTimeLabelWidth;
- (id)_waveFormImageForWidth:(double)a3 havingColor:(id)a4;
- (void)_playRecording:(id)a3;
- (void)_updateProgressForPlaybackTime:(double)a3;
- (void)audioPlayer:(id)a3 didPausePlaybackWithReason:(id)a4;
- (void)audioPlayerDidFinishPlayback:(id)a3 withError:(id)a4;
- (void)audioPlayerDidResumePlayback:(id)a3;
- (void)audioPlayerDidStopPlayback:(id)a3;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setAudioPowerLevels:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMinTimeLabelWidth:(double)a3;
- (void)setPlayRecordingButton:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)setWaveformColor:(id)a3;
- (void)setWaveformImage:(id)a3;
- (void)setWaveformImageView:(id)a3;
@end

@implementation HURecordedWaveformView

- (HURecordedWaveformView)initWithFrame:(CGRect)a3 waveformColor:(id)a4 backgroundColor:(id)a5 tintColor:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v36.receiver = self;
  v36.super_class = (Class)HURecordedWaveformView;
  v17 = -[HURecordedWaveformView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_waveformColor, a4);
    objc_storeStrong((id *)&v18->_backgroundColor, a5);
    id v19 = objc_alloc(MEMORY[0x1E4F43028]);
    v20 = [MEMORY[0x1E4F427D8] effectWithStyle:1];
    uint64_t v21 = [v19 initWithEffect:v20];
    blurView = v18->_blurView;
    v18->_blurView = (UIVisualEffectView *)v21;

    v23 = [(UIVisualEffectView *)v18->_blurView contentView];
    v24 = [v23 layer];
    objc_msgSend(v24, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

    v25 = [(UIVisualEffectView *)v18->_blurView contentView];
    v26 = [v25 layer];
    [v26 setCompositingFilter:*MEMORY[0x1E4F3A298]];

    v27 = [(UIVisualEffectView *)v18->_blurView layer];
    [v27 setMasksToBounds:1];

    [(HURecordedWaveformView *)v18 addSubview:v18->_blurView];
    uint64_t v28 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    playRecordingButton = v18->_playRecordingButton;
    v18->_playRecordingButton = (UIButton *)v28;

    v30 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_playButton");
    [(UIButton *)v18->_playRecordingButton setImage:v30 forState:0];
    [(UIButton *)v18->_playRecordingButton setOpaque:0];
    [(UIButton *)v18->_playRecordingButton setTintColor:v16];
    [(UIButton *)v18->_playRecordingButton accessibilitySetIdentification:@"playAnnounceRecordingButton"];
    -[UIButton _setTouchInsets:](v18->_playRecordingButton, "_setTouchInsets:", -0.15, -0.15, -0.15, -0.15);
    [(UIButton *)v18->_playRecordingButton addTarget:v18 action:sel__playRecording_ forControlEvents:64];
    [(HURecordedWaveformView *)v18 addSubview:v18->_playRecordingButton];
    id v31 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v32 = objc_msgSend(v31, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HURecordedWaveformView *)v18 setWaveformImageView:v32];

    v33 = [(HURecordedWaveformView *)v18 waveformImageView];
    [v33 setContentMode:8];

    v34 = [(HURecordedWaveformView *)v18 waveformImageView];
    [(HURecordedWaveformView *)v18 addSubview:v34];
  }
  return v18;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)HURecordedWaveformView;
  [(HURecordedWaveformView *)&v29 layoutSubviews];
  v3 = [(HURecordedWaveformView *)self blurView];
  v4 = [v3 layer];
  [(HURecordedWaveformView *)self bounds];
  [v4 setCornerRadius:v5 * 0.5];

  v6 = [(HURecordedWaveformView *)self blurView];
  [(HURecordedWaveformView *)self bounds];
  objc_msgSend(v6, "setFrame:");

  v7 = [(HURecordedWaveformView *)self playRecordingButton];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  v12 = [(HURecordedWaveformView *)self blurView];
  [v12 center];
  double v14 = v13 - v11 * 0.5;

  id v15 = [(HURecordedWaveformView *)self playRecordingButton];
  objc_msgSend(v15, "setFrame:", v9, v14, 44.0, 44.0);

  [(HURecordedWaveformView *)self bounds];
  [(HURecordedWaveformView *)self bounds];
  double v17 = v16;
  double v18 = v9 + 44.0;
  id v19 = [(HURecordedWaveformView *)self blurView];
  [v19 center];
  double v21 = v20 - v17 * 0.5;

  [(HURecordedWaveformView *)self bounds];
  double v23 = v22 + -244.0 + 200.0;
  v24 = [(HURecordedWaveformView *)self waveformImageView];
  objc_msgSend(v24, "setFrame:", v18, v21, v23, v17);

  v25 = [(HURecordedWaveformView *)self waveformImage];

  if (!v25)
  {
    v26 = [(HURecordedWaveformView *)self waveformColor];
    v27 = [(HURecordedWaveformView *)self _waveFormImageForWidth:v26 havingColor:v23];

    [(HURecordedWaveformView *)self setWaveformImage:v27];
    uint64_t v28 = [(HURecordedWaveformView *)self waveformImageView];
    [v28 setImage:v27];
  }
}

- (void)setAudioPowerLevels:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_audioPowerLevels != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_audioPowerLevels, a3);
    [(HURecordedWaveformView *)self setWaveformImage:0];
    [(HURecordedWaveformView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setAudioFileURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_audioFileURL, a3);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F68F20]) initWithAudioFileURL:v5 audioSessionOptions:4 delegate:self];
  [(HURecordedWaveformView *)self setAudioPlayer:v6];

  v7 = [(HURecordedWaveformView *)self audioPlayer];
  id v10 = 0;
  [v7 prepareToPlay:&v10];
  id v8 = v10;

  if (v8)
  {
    double v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Failed prepare to play audioFile [%@] - [%@]", buf, 0x16u);
    }
  }
}

- (void)setAlpha:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HURecordedWaveformView;
  [(HURecordedWaveformView *)&v7 setAlpha:a3];
  v4 = [(HURecordedWaveformView *)self audioPlayer];
  [v4 stop];

  id v5 = [(HURecordedWaveformView *)self playRecordingButton];
  v6 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_playButton");
  [v5 setImage:v6 forState:0];
}

- (void)_playRecording:(id)a3
{
  v4 = [(HURecordedWaveformView *)self audioPlayer];
  int v5 = [v4 isPlaying];

  v6 = [(HURecordedWaveformView *)self audioPlayer];
  id v8 = v6;
  if (v5)
  {
    [v6 pause];
  }
  else
  {
    [v6 play];

    objc_msgSend(MEMORY[0x1E4F42A80], "hu_pauseButton");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v7 = [(HURecordedWaveformView *)self playRecordingButton];
    [v7 setImage:v8 forState:0];
  }
}

- (id)_waveFormImageForWidth:(double)a3 havingColor:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HURecordedWaveformView *)self audioPowerLevels];
  id v8 = (void *)v7;
  unint64_t v9 = (unint64_t)(a3 * 0.25);
  if (v9)
  {
    unint64_t v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    double v11 = (char *)&v46 - v10;
    id v12 = [(HURecordedWaveformView *)self audioPowerLevels];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      uint64_t v46 = (uint64_t)&v46;
      id v48 = v6;
      MEMORY[0x1F4188790](v14);
      uint64_t v15 = (char *)&v46 - v10;
      bzero((char *)&v46 - v10, 8 * v9);
      bzero((char *)&v46 - v10, 8 * v9);
      long long v55 = 0u;
      long long v54 = 0u;
      long long v53 = 0u;
      long long v52 = 0u;
      v47 = v8;
      id v16 = v8;
      uint64_t v51 = [v16 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v51)
      {
        unint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v50 = *(void *)v53;
        unint64_t v19 = v9 - 1;
        v49 = v11 + 8;
        do
        {
          uint64_t v20 = 0;
          unint64_t v21 = v18 * v9;
          unint64_t v22 = v17;
          do
          {
            if (*(void *)v53 != v50) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v52 + 1) + 8 * v20) floatValue];
            float v24 = __exp10(v23 * 0.05) * 32767.0;
            unint64_t v25 = [v16 count];
            if (v18 * v9 / v25 >= v19) {
              unint64_t v17 = v9 - 1;
            }
            else {
              unint64_t v17 = v18 * v9 / v25;
            }
            unint64_t v26 = *(void *)&v15[8 * v17];
            double v27 = v24 * v24 + *(double *)&v11[8 * v17] * *(double *)&v11[8 * v17] * (double)v26;
            unint64_t v28 = v26 + 1;
            double v29 = sqrt(v27 / (double)v28);
            *(double *)&v11[8 * v17] = v29;
            if (v17 != v22 && v22 + 1 < v17)
            {
              float v31 = *(double *)&v11[8 * v22];
              float v32 = v29 - v31;
              double v33 = (float)((float)(v32 / (float)(v17 - v22)) + v31);
              unint64_t v34 = v21 / v25;
              if (v21 / v25 >= v19) {
                unint64_t v34 = v9 - 1;
              }
              unint64_t v35 = ~v22 + v34;
              objc_super v36 = (double *)&v49[8 * v22];
              do
              {
                *v36++ = v33;
                --v35;
              }
              while (v35);
            }
            *(void *)&v15[8 * v17] = v28;
            ++v18;
            ++v20;
            v21 += v9;
            unint64_t v22 = v17;
          }
          while (v20 != v51);
          uint64_t v51 = [v16 countByEnumeratingWithState:&v52 objects:v56 count:16];
        }
        while (v51);
      }

      uint64_t v37 = 0;
      if (v9 <= 1) {
        unint64_t v38 = 1;
      }
      else {
        unint64_t v38 = (unint64_t)(a3 * 0.25);
      }
      double v39 = 1.0;
      do
      {
        double v40 = fmax(*(double *)&v11[8 * v37] + -30.0, 0.0);
        *(double *)&v11[8 * v37] = v40;
        if (v39 < v40) {
          double v39 = v40;
        }
        ++v37;
      }
      while (v38 != v37);
      uint64_t v41 = 0;
      id v6 = v48;
      do
      {
        *(double *)&v11[8 * v41] = *(double *)&v11[8 * v41] / v39;
        ++v41;
      }
      while (v38 != v41);
      v42 = +[HUAudioWaveformUtilities waveformImageforPowerLevels:v11 powerLevelsCount:v9 color:v6];
      v43 = [MEMORY[0x1E4F428B8] systemGrayColor];
      v44 = [v42 _flatImageWithColor:v43];

      unint64_t v9 = objc_msgSend(v44, "imageWithAlignmentRectInsets:", 0.0, 0.0, 0.0, 1.0);

      id v8 = v47;
    }
    else
    {
      unint64_t v9 = 0;
    }
  }

  return (id)v9;
}

- (void)_updateProgressForPlaybackTime:(double)a3
{
  int v5 = [(HURecordedWaveformView *)self audioPlayer];
  [v5 duration];
  double v7 = v6;

  +[HUAudioWaveformUtilities progressForTime:a3 duration:v7];
  id v8 = [(HURecordedWaveformView *)self audioPlayer];
  int v9 = [v8 isPlaying];

  if (v9)
  {
    id v19 = [(HURecordedWaveformView *)self waveformImage];
    [v19 size];
    double v11 = v10;
    CGFloat v13 = v12;
    +[HUAudioWaveformUtilities disabledWaveformWidth:forProgress:](HUAudioWaveformUtilities, "disabledWaveformWidth:forProgress:");
    double v15 = v14;
    v21.double width = v11;
    v21.double height = v13;
    UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
    objc_msgSend(v19, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    id v16 = [MEMORY[0x1E4F428B8] whiteColor];
    [v16 set];

    v22.origin.double x = v11 - v15;
    v22.origin.double y = 0.0;
    v22.size.double width = v15;
    v22.size.double height = v13;
    UIRectFillUsingBlendMode(v22, kCGBlendModeSourceIn);
    unint64_t v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    uint64_t v18 = [(HURecordedWaveformView *)self waveformImageView];
    [v18 setImage:v17];
  }
}

- (void)audioPlayer:(id)a3 didPausePlaybackWithReason:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F42A80], "hu_playButton", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = [(HURecordedWaveformView *)self playRecordingButton];
  [v5 setImage:v6 forState:0];
}

- (void)audioPlayerDidStopPlayback:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F42A80], "hu_playButton", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(HURecordedWaveformView *)self playRecordingButton];
  [v4 setImage:v5 forState:0];
}

- (void)audioPlayerDidResumePlayback:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F42A80], "hu_pauseButton", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(HURecordedWaveformView *)self playRecordingButton];
  [v4 setImage:v5 forState:0];
}

- (void)audioPlayerDidFinishPlayback:(id)a3 withError:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F42A80], "hu_playButton", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(HURecordedWaveformView *)self playRecordingButton];
  [v5 setImage:v6 forState:0];
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSArray)audioPowerLevels
{
  return self->_audioPowerLevels;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (UIImageView)waveformImageView
{
  return self->_waveformImageView;
}

- (void)setWaveformImageView:(id)a3
{
}

- (UIButton)playRecordingButton
{
  return self->_playRecordingButton;
}

- (void)setPlayRecordingButton:(id)a3
{
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
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

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (void)setMinTimeLabelWidth:(double)a3
{
  self->_minTimeLabelWidth = a3;
}

- (UIColor)waveformColor
{
  return self->_waveformColor;
}

- (void)setWaveformColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (HFAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_waveformColor, 0);
  objc_storeStrong((id *)&self->_waveformImage, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_playRecordingButton, 0);
  objc_storeStrong((id *)&self->_waveformImageView, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);

  objc_storeStrong((id *)&self->_audioPowerLevels, 0);
}

@end