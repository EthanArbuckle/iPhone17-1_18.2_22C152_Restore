@interface CKWaveformProgressView
- (BOOL)isPlayed;
- (BOOL)isPlaying;
- (CKWaveformProgressView)initWithFrame:(CGRect)a3;
- (IMManualUpdater)displayUpdater;
- (UIImage)waveform;
- (char)color;
- (double)currentTime;
- (double)duration;
- (void)prepareForDisplay;
- (void)prepareForDisplayIfNeeded;
- (void)setColor:(char)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDisplayUpdater:(id)a3;
- (void)setDuration:(double)a3;
- (void)setImage:(id)a3;
- (void)setNeedsPrepareForDisplay;
- (void)setPlayed:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setWaveform:(id)a3;
@end

@implementation CKWaveformProgressView

- (CKWaveformProgressView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKWaveformProgressView;
  v3 = -[CKBalloonImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKWaveformProgressView *)v3 setContentMode:4];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F6C368]) initWithTarget:v4 action:sel_prepareForDisplay];
    [(CKWaveformProgressView *)v4 setDisplayUpdater:v5];
  }
  return v4;
}

- (void)prepareForDisplayIfNeeded
{
  id v2 = [(CKWaveformProgressView *)self displayUpdater];
  [v2 updateIfNeeded];
}

- (void)setNeedsPrepareForDisplay
{
  id v2 = [(CKWaveformProgressView *)self displayUpdater];
  [v2 setNeedsUpdate];
}

- (void)setWaveform:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_waveform != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_waveform, a3);
    [(CKWaveformProgressView *)self setNeedsPrepareForDisplay];
    v5 = v6;
  }
}

- (void)setCurrentTime:(double)a3
{
  if (self->_currentTime != a3)
  {
    self->_currentTime = a3;
    [(CKWaveformProgressView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    [(CKWaveformProgressView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setPlayed:(BOOL)a3
{
  if (self->_played != a3)
  {
    self->_played = a3;
    [(CKWaveformProgressView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setColor:(char)a3
{
  if (self->_color != a3)
  {
    self->_color = a3;
    [(CKWaveformProgressView *)self setNeedsPrepareForDisplay];
  }
}

- (void)prepareForDisplay
{
  int v3 = [(CKWaveformProgressView *)self color];
  [(CKWaveformProgressView *)self duration];
  double v5 = v4;
  [(CKWaveformProgressView *)self currentTime];
  double v7 = v6;
  v8 = [(CKWaveformProgressView *)self waveform];
  [v8 size];
  if (v10 != 0.0)
  {
    double v11 = v9;
    if (v9 != 0.0)
    {
      double v12 = v10;
      if (v9 != *MEMORY[0x1E4F1DB30] || v10 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        if (v7 == v5 || v7 == 0.0 && ![(CKWaveformProgressView *)self isPlaying])
        {
          v14 = [(CKWaveformProgressView *)self waveform];
          if (v3 == -1 && ![(CKWaveformProgressView *)self isPlayed])
          {
            v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v11, v12);
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __43__CKWaveformProgressView_prepareForDisplay__block_invoke;
            v34[3] = &unk_1E5625B10;
            id v35 = v14;
            double v36 = v11;
            double v37 = v12;
            v14 = [v15 imageWithActions:v34];
          }
          [(CKWaveformProgressView *)self setImage:v14];
        }
        else
        {
          +[CKAudioProgressView progressForTime:v7 duration:v5];
          float v17 = v16;
          v18 = +[CKUIBehavior sharedBehaviors];
          unint64_t v19 = [v18 waveformPowerLevelWidthIncrement];

          v20 = +[CKUIBehavior sharedBehaviors];
          unint64_t v21 = [v20 waveformPowerLevelWidth];
          v22 = +[CKUIBehavior sharedBehaviors];
          unint64_t v23 = [v22 waveformGapWidth];

          if (CKMainScreenScale_once_49 != -1) {
            dispatch_once(&CKMainScreenScale_once_49, &__block_literal_global_123);
          }
          long double v24 = (1.0 - v17) * (v11 / (double)v19);
          double v25 = fmod(v24, 1.0) * (double)v21 + (double)(unint64_t)v24 * (double)v19 + (double)v23;
          double v26 = *(double *)&CKMainScreenScale_sMainScreenScale_49;
          if (*(double *)&CKMainScreenScale_sMainScreenScale_49 == 0.0) {
            double v26 = 1.0;
          }
          double v27 = floor(v25 * v26) / v26;
          v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v11, v12);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __43__CKWaveformProgressView_prepareForDisplay__block_invoke_2;
          v29[3] = &unk_1E5628450;
          double v31 = v11;
          double v32 = v12;
          double v33 = v27;
          id v30 = v8;
          v28 = [v14 imageWithActions:v29];
          [(CKWaveformProgressView *)self setImage:v28];
        }
      }
    }
  }
}

void __43__CKWaveformProgressView_prepareForDisplay__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v2 = +[CKUIBehavior sharedBehaviors];
  int v3 = [v2 theme];
  double v4 = [v3 waveformUnplayedColor];
  [v4 set];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = 0;
  uint64_t v8 = 0;

  UIRectFillUsingBlendMode(*(CGRect *)&v7, kCGBlendModeSourceIn);
}

uint64_t __43__CKWaveformProgressView_prepareForDisplay__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F428B8] blackColor];
  [v2 set];

  v8.size.height = *(CGFloat *)(a1 + 48);
  v8.size.width = *(double *)(a1 + 40) - *(double *)(a1 + 56);
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  UIRectFill(v8);
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 18, *MEMORY[0x1E4F1DAD8], v4, 1.0);
  uint64_t v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "drawAtPoint:blendMode:alpha:", 0, v3, v4, 0.33);
}

- (void)setImage:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6.receiver = self;
    v6.super_class = (Class)CKWaveformProgressView;
    [(CKBalloonImageView *)&v6 setImage:v4];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v8 = v4;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "CKWaveformProgressView: Attempting to setImage to object that is not an image - %@", buf, 0xCu);
      }
    }
    IMLogBacktrace();
  }
}

- (char)color
{
  return self->_color;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (UIImage)waveform
{
  return self->_waveform;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (IMManualUpdater)displayUpdater
{
  return self->_displayUpdater;
}

- (void)setDisplayUpdater:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUpdater, 0);

  objc_storeStrong((id *)&self->_waveform, 0);
}

@end