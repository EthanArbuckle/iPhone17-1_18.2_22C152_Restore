@interface CKAudioBalloonView
- (BOOL)isAudioMessage;
- (BOOL)isControlHidden;
- (BOOL)isPlayed;
- (BOOL)isPlaying;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAudioBalloonView)initWithFrame:(CGRect)a3;
- (CKAudioProgressView)progressView;
- (CKWaveformProgressView)waveformProgressView;
- (UIEdgeInsets)alignmentRectInsets;
- (UILabel)timeLabel;
- (double)duration;
- (double)time;
- (id)nonVibrantSubViews;
- (int64_t)waveformContentMode;
- (void)addOverlaySubview:(id)a3;
- (void)configureForComposition:(id)a3;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setControlHidden:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setPlayed:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setProgressView:(id)a3;
- (void)setTime:(double)a3;
- (void)setTimeLabel:(id)a3;
- (void)setWaveform:(id)a3;
- (void)setWaveformContentMode:(int64_t)a3;
- (void)setWaveformProgressView:(id)a3;
- (void)updateProgress;
- (void)updateTimeString;
- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3;
- (void)waveformProgressViewPanning:(id)a3;
@end

@implementation CKAudioBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKAudioBalloonView;
  id v8 = a3;
  [(CKBalloonView *)&v18 configureForMediaObject:v8 previewWidth:v5 orientation:a4];
  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 theme];
  v11 = v10;
  if (v5 == 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  v13 = [v10 waveformColorForColorType:v12];

  v14 = [v8 waveformForOrientation:v5];
  v15 = [v14 _flatImageWithColor:v13];
  [(CKAudioBalloonView *)self setWaveform:v15];

  [v8 duration];
  double v17 = v16;

  [(CKAudioBalloonView *)self setDuration:v17];
  [(CKAudioBalloonView *)self setPlayed:1];
}

- (void)configureForComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKAudioBalloonView;
  id v4 = a3;
  [(CKColoredBalloonView *)&v8 configureForComposition:v4];
  uint64_t v5 = objc_msgSend(v4, "mediaObjects", v8.receiver, v8.super_class);

  v6 = [v5 lastObject];
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 previewMaxWidth];
  -[CKAudioBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);

  [(CKAudioBalloonView *)self setPlayed:0];
}

- (BOOL)isAudioMessage
{
  return 1;
}

- (CKAudioBalloonView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CKAudioBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(CKAudioBalloonView *)v3 setTimeLabel:v9];
    [(CKAudioBalloonView *)v3 addSubview:v9];
    v10 = -[CKAudioProgressView initWithFrame:]([CKAudioProgressView alloc], "initWithFrame:", v5, v6, v7, v8);
    [(CKAudioProgressView *)v10 setColor:[(CKBalloonView *)v3 color]];
    [(CKAudioProgressView *)v10 sizeToFit];
    [(CKAudioBalloonView *)v3 setProgressView:v10];
    [(CKAudioBalloonView *)v3 addSubview:v10];
    v11 = -[CKWaveformProgressView initWithFrame:]([CKWaveformProgressView alloc], "initWithFrame:", v5, v6, v7, v8);
    [(CKWaveformProgressView *)v11 setColor:[(CKBalloonView *)v3 color]];
    [(CKAudioBalloonView *)v3 addSubview:v11];
    [(CKAudioBalloonView *)v3 setWaveformProgressView:v11];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v3 action:sel_waveformProgressViewPanning_];
    [(CKWaveformProgressView *)v11 addGestureRecognizer:v12];
  }
  return v3;
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)CKAudioBalloonView;
  [(CKColoredBalloonView *)&v40 layoutSubviews];
  [(CKAudioBalloonView *)self bounds];
  double v37 = v4;
  double v38 = v3;
  -[CKAudioBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v6 = v5;
  double v39 = v7;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = +[CKUIBehavior sharedBehaviors];
  v13 = [(CKAudioBalloonView *)self progressView];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  [v12 audioBalloonProgressInset];
  double v19 = v6 + v18;
  if (CKMainScreenScale_once_53 != -1) {
    dispatch_once(&CKMainScreenScale_once_53, &__block_literal_global_136);
  }
  double v20 = *(double *)&CKMainScreenScale_sMainScreenScale_53;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_53 == 0.0) {
    double v20 = 1.0;
  }
  CGFloat v21 = 1.0 / v20 * (v39 * v20 + floor((v11 * v20 - v17 * v20) * 0.5));
  objc_msgSend(v13, "setFrame:", v19, v21, v15, v17);
  v22 = [(CKAudioBalloonView *)self timeLabel];
  objc_msgSend(v22, "sizeThatFits:", v9, v11);
  CGFloat rect = v15;
  double v24 = v23;

  v41.origin.x = v6;
  v41.origin.y = v39;
  v41.size.width = v9;
  v41.size.height = v11;
  double MaxX = CGRectGetMaxX(v41);
  [v12 audioBalloonTimeInset];
  double v27 = MaxX - (v24 + v26);
  v28 = [(CKAudioBalloonView *)self timeLabel];
  objc_msgSend(v28, "setFrame:", v27, v39, v24, v11);

  v29 = [(CKAudioBalloonView *)self waveformProgressView];
  [v29 frame];
  objc_msgSend(v29, "sizeThatFits:", v38, v37);
  double v31 = v30;
  v42.origin.x = v19;
  v42.origin.y = v21;
  v42.size.width = rect;
  v42.size.height = v17;
  double v32 = CGRectGetMaxX(v42);
  v33 = +[CKUIBehavior sharedBehaviors];
  [v33 audioBalloonWaveformTimeSpace];
  double v35 = v34;

  if (CKMainScreenScale_once_53 != -1) {
    dispatch_once(&CKMainScreenScale_once_53, &__block_literal_global_136);
  }
  [v29 setFrame:*(void *)&rect];
  [v29 setClipsToBounds:v27 - v35 - (v32 + 6.0) != v31];
}

- (void)addOverlaySubview:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAudioBalloonView *)self timeLabel];
  [(CKAudioBalloonView *)self insertSubview:v4 belowSubview:v5];
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3 = [(CKBalloonImageView *)self image];
  if (!v3)
  {
    id v4 = [(CKColoredBalloonView *)self mask];
    double v3 = [v4 image];

    if (!v3)
    {
      double v14 = *MEMORY[0x1E4F437F8];
      double v11 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
      double v7 = *(double *)(MEMORY[0x1E4F437F8] + 24);
      goto LABEL_9;
    }
  }
  id v5 = +[CKUIBehavior sharedBehaviors];
  [v5 balloonMaskTailSizeForTailShape:1];
  double v7 = v6;
  uint64_t v8 = [v3 imageOrientation];
  double v9 = 0.0;
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v10 = v8;
  if (v8 != 4)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"CKGeometry.h", 429, @"CKEdgeInsetsWithImageOrientation %ld hasn't been implemented", v10);

LABEL_7:
    double v11 = 0.0;
    goto LABEL_8;
  }
  double v11 = v7;
  double v7 = 0.0;
LABEL_8:

  double v14 = 0.0;
LABEL_9:
  double v15 = v11;
  double v16 = v9;
  double v17 = v7;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = +[CKUIBehavior sharedBehaviors];
  -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", width, height);
  double v10 = v9;
  double v12 = v11;
  v13 = [(CKAudioBalloonView *)self progressView];
  objc_msgSend(v13, "sizeThatFits:", v10, v12);
  double v15 = v14;

  double v16 = [(CKAudioBalloonView *)self waveformProgressView];
  objc_msgSend(v16, "sizeThatFits:", v10, v12);
  double v18 = v17;
  double v20 = v19;

  CGFloat v21 = [(CKAudioBalloonView *)self timeLabel];
  objc_msgSend(v21, "sizeThatFits:", v10, v12);
  double v23 = v22;
  double v25 = v24;

  [v8 audioBalloonProgressInset];
  double v27 = v18 + v15 + v26 + 6.0;
  [v8 audioBalloonWaveformTimeSpace];
  double v29 = v23 + v28 + v27;
  [v8 audioBalloonTimeInset];
  double v31 = 0.0;
  -[UIView __ck_frameSizeForAlignmentRectSize:](self, "__ck_frameSizeForAlignmentRectSize:", v30 + v29, 0.0);
  double v33 = v32;
  double v34 = v32 - width;
  if (v34 > 0.0)
  {
    double v35 = fmod(v34, 1.0);
    unint64_t v36 = [v8 waveformPowerLevelWidthIncrement];
    double v31 = v34 + (double)v36 - (v35 + (double)((unint64_t)v34 % v36));
  }
  if ([v8 isAccessibilityPreferredContentSizeCategory])
  {
    double v37 = fmax(v25, v20 + 25.0);
  }
  else
  {
    [(CKColoredBalloonView *)self balloonDescriptor];
    [v8 balloonMaskSizeWithBalloonDescriptor:&v48];
    double v37 = v38;
  }
  [v8 audioBalloonAlignmentInsets];
  if (a4)
  {
    a4->top = v39;
    a4->left = v40;
    a4->bottom = v41;
    a4->right = v42;
  }
  double v43 = v33 - v31 + v40 + v42;
  double v44 = v37 + v39 + v41;
  if ([(CKBalloonView *)self hasSuggestedActionsMenu])
  {
    [(CKBalloonView *)self suggestedActionsMenuAdditionalHeight];
    double v43 = v43 + 0.0;
    double v44 = v44 + v45;
  }

  double v46 = v43;
  double v47 = v44;
  result.double height = v47;
  result.double width = v46;
  return result;
}

- (void)prepareForDisplay
{
  v12.receiver = self;
  v12.super_class = (Class)CKAudioBalloonView;
  [(CKColoredBalloonView *)&v12 prepareForDisplay];
  uint64_t v3 = [(CKBalloonView *)self color];
  id v4 = [(CKAudioBalloonView *)self timeLabel];
  id v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [v5 theme];
  double v7 = [v6 balloonTextColorForColorType:v3];
  [v4 setTextColor:v7];

  uint64_t v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = [v8 audioBalloonTimeFont];
  [v4 setFont:v9];

  double v10 = [(CKAudioBalloonView *)self progressView];
  objc_msgSend(v10, "setColor:", -[CKBalloonView color](self, "color"));

  double v11 = [(CKAudioBalloonView *)self waveformProgressView];
  objc_msgSend(v11, "setColor:", -[CKBalloonView color](self, "color"));

  [(CKAudioBalloonView *)self updateTimeString];
  [(CKAudioBalloonView *)self updateProgress];
}

- (void)prepareForReuse
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CKAudioBalloonView;
  [(CKColoredBalloonView *)&v12 prepareForReuse];
  [(CKAudioBalloonView *)self setControlHidden:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [(CKAudioBalloonView *)self nonVibrantSubViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setUserInteractionEnabled:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
  {
    self->_time = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    uint64_t v5 = [(CKAudioBalloonView *)self waveformProgressView];
    [v5 setDuration:a3];

    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setWaveform:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAudioBalloonView *)self waveformProgressView];
  [v5 setWaveform:v4];
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    BOOL v3 = a3;
    self->_playing = a3;
    id v5 = [(CKAudioBalloonView *)self waveformProgressView];
    [v5 setPlaying:v3];

    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setPlayed:(BOOL)a3
{
  if (self->_played != a3)
  {
    BOOL v3 = a3;
    self->_played = a3;
    id v5 = [(CKAudioBalloonView *)self waveformProgressView];
    [v5 setPlayed:v3];

    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setControlHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKAudioBalloonView *)self progressView];
  [v4 setHidden:v3];
}

- (BOOL)isControlHidden
{
  v2 = [(CKAudioBalloonView *)self progressView];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setWaveformContentMode:(int64_t)a3
{
  id v4 = [(CKAudioBalloonView *)self waveformProgressView];
  [v4 setContentMode:a3];
}

- (int64_t)waveformContentMode
{
  v2 = [(CKAudioBalloonView *)self waveformProgressView];
  int64_t v3 = [v2 contentMode];

  return v3;
}

- (void)updateTimeString
{
  [(CKAudioBalloonView *)self time];
  double v4 = v3;
  if (v3 == 0.0 && ![(CKAudioBalloonView *)self isPlaying])
  {
    [(CKAudioBalloonView *)self duration];
    double v4 = v5;
  }
  uint64_t v6 = [(CKAudioBalloonView *)self timeLabel];
  uint64_t v7 = CKLocalizedStringForDuration(v4);
  [v6 setText:v7];

  [(CKAudioBalloonView *)self setNeedsLayout];
}

- (void)updateProgress
{
  id v9 = [(CKAudioBalloonView *)self progressView];
  [(CKAudioBalloonView *)self time];
  double v4 = v3;
  [(CKAudioBalloonView *)self duration];
  +[CKAudioProgressView progressForTime:v4 duration:v5];
  objc_msgSend(v9, "setProgress:");
  BOOL v6 = [(CKAudioBalloonView *)self isPlaying];
  if ([(CKAudioBalloonView *)self isPlayed]) {
    BOOL v7 = [(CKBalloonView *)self orientation] == 0;
  }
  else {
    BOOL v7 = 0;
  }
  [v9 setPlayed:v7];
  [v9 setPlaying:v6];
  [v9 prepareForDisplayIfNeeded];
  long long v8 = [(CKAudioBalloonView *)self waveformProgressView];
  [v8 setCurrentTime:v4];
  [v8 prepareForDisplayIfNeeded];
}

- (id)nonVibrantSubViews
{
  v8[3] = *MEMORY[0x1E4F143B8];
  double v3 = [(CKAudioBalloonView *)self timeLabel];
  double v4 = [(CKAudioBalloonView *)self progressView];
  v8[1] = v4;
  double v5 = [(CKAudioBalloonView *)self waveformProgressView];
  v8[2] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setUserInteractionEnabled:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)waveformProgressViewPanning:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 view];
  [v4 locationInView:v5];
  double v7 = v6;

  [(CKWaveformProgressView *)self->_waveformProgressView frame];
  double v9 = v7 / v8;

  double duration = self->_duration;
  double v11 = v9 * duration;
  if (v11 <= duration)
  {
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
  }
  else
  {
    double v11 = duration + -0.01;
  }
  self->_time = v11;
  objc_super v12 = [(CKBalloonView *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [(CKBalloonView *)self delegate];
    [v14 audioBalloonScrubberDidChangeValue:v11];
  }
}

- (double)time
{
  return self->_time;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (CKAudioProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (CKWaveformProgressView)waveformProgressView
{
  return self->_waveformProgressView;
}

- (void)setWaveformProgressView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformProgressView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_timeLabel, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAudioBalloonView;
  [(CKColoredBalloonView *)&v9 configureForMessagePart:v4];
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  [v5 previewMaxWidth];
  double v7 = v6;

  double v8 = [v4 mediaObject];
  -[CKAudioBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v8, [v4 balloonOrientation], v7);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[CKAudioBalloonView setPlayed:](self, "setPlayed:", [v4 isPlayed]);
  }
}

@end