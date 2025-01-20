@interface CKMessageEntryWaveformView
+ (id)waveformCurveTransform;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKMessageEntryWaveformView)initWithFrame:(CGRect)a3;
- (NSMutableArray)powerLevels;
- (UIImageView)balloonImageView;
- (UIImageView)waveformImageView;
- (UILabel)timeLabel;
- (UIVisualEffectView)blurView;
- (double)duration;
- (double)minTimeLabelWidth;
- (unint64_t)maxPowerLevelsCount;
- (void)appendPowerLevel:(double)a3;
- (void)clearPowerLevels;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBalloonImageView:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMaxPowerLevelsCount:(unint64_t)a3;
- (void)setMinTimeLabelWidth:(double)a3;
- (void)setPowerLevels:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)setWaveformImageView:(id)a3;
- (void)updateWaveform;
@end

@implementation CKMessageEntryWaveformView

+ (id)waveformCurveTransform
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)waveformCurveTransform_sTransform;
  if (!waveformCurveTransform_sTransform)
  {
    memcpy(__dst, &unk_18F81B0A8, sizeof(__dst));
    memcpy(v6, &unk_18F81BDF0, sizeof(v6));
    uint64_t v3 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:85 vertices:__dst faceCount:64 faces:v6 depthNormalization:*MEMORY[0x1E4F39ED8]];
    v4 = (void *)waveformCurveTransform_sTransform;
    waveformCurveTransform_sTransform = v3;

    v2 = (void *)waveformCurveTransform_sTransform;
  }

  return v2;
}

- (CKMessageEntryWaveformView)initWithFrame:(CGRect)a3
{
  v47.receiver = self;
  v47.super_class = (Class)CKMessageEntryWaveformView;
  uint64_t v3 = -[CKMessageEntryWaveformView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 entryFieldShouldUseBackdropView];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F43028]);
      v7 = [MEMORY[0x1E4F427D8] effectWithStyle:1];
      uint64_t v8 = (void *)[v6 initWithEffect:v7];

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

      [(CKMessageEntryWaveformView *)v3 setBlurView:v8];
      [(CKMessageEntryWaveformView *)v3 addSubview:v8];
      [(CKMessageEntryWaveformView *)v3 setBlurView:0];
      [v8 removeFromSuperview];
    }
    else
    {
      LODWORD(v40) = 0x1000000;
      long long v42 = CKColorZero;
      *((void *)&v40 + 1) = -1;
      char v41 = -2;
      long long v43 = *(_OWORD *)&qword_18F81CEF8;
      uint64_t v44 = 1;
      uint64_t v45 = 0;
      int v46 = 0;
      uint64_t v8 = CKResizableBalloonMask(&v40);
      id v17 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v18 = [v8 imageWithRenderingMode:2];
      v19 = (void *)[v17 initWithImage:v18];

      v20 = +[CKUIBehavior sharedBehaviors];
      v21 = [v20 theme];
      v22 = [v21 entryFieldAudioRecordingBalloonColor];
      [v19 setTintColor:v22];

      [(CKMessageEntryWaveformView *)v3 setBalloonImageView:v19];
      [(CKMessageEntryWaveformView *)v3 addSubview:v19];
    }
    id v23 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v24 = *MEMORY[0x1E4F1DB28];
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v28 = objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], v25, v26, v27);
    [v28 setContentMode:8];
    v29 = [v28 layer];
    v30 = +[CKMessageEntryWaveformView waveformCurveTransform];
    [v29 setMeshTransform:v30];

    [(CKMessageEntryWaveformView *)v3 addSubview:v28];
    [(CKMessageEntryWaveformView *)v3 setWaveformImageView:v28];
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v24, v25, v26, v27);
    v32 = +[CKUIBehavior sharedBehaviors];
    v33 = [v32 audioBalloonTimeFont];
    [v31 setFont:v33];

    v34 = [MEMORY[0x1E4F428B8] whiteColor];
    [v31 setTextColor:v34];

    v35 = CKLocalizedStringForDuration(0.0);
    [v31 setText:v35];

    objc_msgSend(v31, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    -[CKMessageEntryWaveformView setMinTimeLabelWidth:](v3, "setMinTimeLabelWidth:");
    [(CKMessageEntryWaveformView *)v3 setTimeLabel:v31];
    [(CKMessageEntryWaveformView *)v3 addSubview:v31];
    v36 = +[CKUIBehavior sharedBehaviors];
    v37 = [v36 theme];
    v38 = [v37 entryFieldBorderColor];
    [v31 setTextColor:v38];
  }
  return v3;
}

- (void)didMoveToWindow
{
  uint64_t v3 = [(CKMessageEntryWaveformView *)self window];
  if (v3)
  {
    id v8 = v3;
    [v3 bounds];
    if (v4 >= v5) {
      double v6 = v4;
    }
    else {
      double v6 = v5;
    }
    v7 = +[CKUIBehavior sharedBehaviors];
    -[CKMessageEntryWaveformView setMaxPowerLevelsCount:](self, "setMaxPowerLevelsCount:", vcvtpd_u64_f64(v6 / (double)(unint64_t)[v7 waveformPowerLevelWidthIncrement]));

    uint64_t v3 = v8;
  }
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)CKMessageEntryWaveformView;
  [(CKMessageEntryWaveformView *)&v43 layoutSubviews];
  [(CKMessageEntryWaveformView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKMessageEntryWaveformView *)self blurView];
  v12 = [v11 layer];
  [v12 setCornerRadius:v10 * 0.5];

  double v13 = v8;
  if (!CKIsRunningInMacCatalyst())
  {
    v14 = +[CKUIBehavior sharedBehaviors];
    [v14 balloonMaskTailSizeForTailShape:1];
    double v13 = v8 - v15;
  }
  v16 = [(CKMessageEntryWaveformView *)self blurView];
  objc_msgSend(v16, "setFrame:", v4, v6, v13, v10);

  id v17 = [(CKMessageEntryWaveformView *)self balloonImageView];
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  int v18 = CKIsRunningInMacCatalyst();
  double v19 = 0.0;
  if (!v18)
  {
    v20 = +[CKUIBehavior sharedBehaviors];
    [v20 balloonMaskTailSizeForTailShape:1];
    double v22 = v21;

    double v19 = v22 + 0.0;
  }
  double v23 = v4 + 0.0;
  double v24 = v6 + 0.0;
  double v25 = v8 - v19;
  double v26 = [(CKMessageEntryWaveformView *)self timeLabel];
  objc_msgSend(v26, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v28 = v27;

  [(CKMessageEntryWaveformView *)self minTimeLabelWidth];
  if (v28 >= v29) {
    double v30 = v28;
  }
  else {
    double v30 = v29;
  }
  v44.origin.x = v23;
  v44.origin.y = v24;
  v44.size.width = v25;
  v44.size.height = v10;
  double MaxX = CGRectGetMaxX(v44);
  v32 = +[CKUIBehavior sharedBehaviors];
  [v32 audioBalloonTimeInset];
  double v34 = MaxX - (v30 + v33);

  v35 = [(CKMessageEntryWaveformView *)self timeLabel];
  objc_msgSend(v35, "setFrame:", v34, v24, v30, v10);

  v36 = [(CKMessageEntryWaveformView *)self waveformImageView];
  [v36 frame];
  objc_msgSend(v36, "sizeThatFits:", v25, v10);
  double v38 = v37;
  v39 = +[CKUIBehavior sharedBehaviors];
  [v39 audioBalloonWaveformTimeSpace];
  double v41 = v40;

  if (CKMainScreenScale_once_19 != -1) {
    dispatch_once(&CKMainScreenScale_once_19, &__block_literal_global_47);
  }
  double v42 = *(double *)&CKMainScreenScale_sMainScreenScale_19;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_19 == 0.0) {
    double v42 = 1.0;
  }
  objc_msgSend(v36, "setFrame:", 0.0, 1.0 / v42 * (v24 * v42 + floor((v10 * v42 - v38 * v42) * 0.5)), v34 - v41, v38);
  [(CKMessageEntryWaveformView *)self updateWaveform];
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
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setDuration:(double)a3
{
  double duration = self->_duration;
  if (duration != a3)
  {
    long long v9 = 0uLL;
    long long v8 = 0uLL;
    CKTimeIntervalComponents((unint64_t *)&v9 + 1, (unint64_t *)&v9, 0, duration);
    CKTimeIntervalComponents((unint64_t *)&v8 + 1, (unint64_t *)&v8, 0, a3);
    self->_double duration = a3;
    if (v9 != v8)
    {
      double v6 = CKLocalizedStringForDuration(a3);
      double v7 = [(CKMessageEntryWaveformView *)self timeLabel];
      [v7 setText:v6];
    }
  }
}

- (void)appendPowerLevel:(double)a3
{
  id v6 = [(CKMessageEntryWaveformView *)self powerLevels];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    -[CKMessageEntryWaveformView setPowerLevels:](self, "setPowerLevels:");
  }
  double v5 = [NSNumber numberWithDouble:a3];
  [v6 addObject:v5];

  [(CKMessageEntryWaveformView *)self setNeedsLayout];
}

- (void)clearPowerLevels
{
  [(CKMessageEntryWaveformView *)self setPowerLevels:0];

  [(CKMessageEntryWaveformView *)self setNeedsLayout];
}

- (void)updateWaveform
{
  v32[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(CKMessageEntryWaveformView *)self powerLevels];
  double v4 = [(CKMessageEntryWaveformView *)self waveformImageView];
  if ([v3 count])
  {
    unint64_t v5 = [v3 count];
    [v4 bounds];
    double v7 = v6;
    long long v8 = +[CKUIBehavior sharedBehaviors];
    double v9 = ceil(v7 / (double)(unint64_t)[v8 waveformPowerLevelWidthIncrement]);

    double v11 = (double)v5;
    if (v9 <= (double)v5) {
      double v11 = v9;
    }
    unint64_t v12 = (unint64_t)v11;
    MEMORY[0x1F4188790](v10);
    uint64_t v14 = (double *)((char *)v32 - v13);
    bzero((char *)v32 - v13, v15);
    uint64_t v16 = [v3 count];
    id v17 = +[CKUIBehavior sharedBehaviors];
    [v17 waveformMinDbPowerLevel];
    double v19 = CKLinearForDbPowerLevel(v18) * 32767.0;

    double v20 = log(32767.0 - v19);
    if (v12)
    {
      double v21 = v20;
      uint64_t v22 = -(uint64_t)v12;
      double v23 = v14;
      do
      {
        double v24 = [v3 objectAtIndex:v16 + v22];
        [v24 floatValue];
        double v26 = v25;

        double v20 = fmax(log(v26 - v19), 0.0) / v21;
        *v23++ = v20;
      }
      while (!__CFADD__(v22++, 1));
    }
    double v28 = +[CKUIBehavior sharedBehaviors];
    double v29 = [v28 theme];
    double v30 = [v29 entryFieldBorderColor];
    v31 = CKWaveformWithPowerLevels((uint64_t)v14, v12, v30);
  }
  else
  {
    v31 = 0;
  }
  [v4 setImage:v31];
}

- (double)duration
{
  return self->_duration;
}

- (NSMutableArray)powerLevels
{
  return self->_powerLevels;
}

- (void)setPowerLevels:(id)a3
{
}

- (UIImageView)waveformImageView
{
  return self->_waveformImageView;
}

- (void)setWaveformImageView:(id)a3
{
}

- (unint64_t)maxPowerLevelsCount
{
  return self->_maxPowerLevelsCount;
}

- (void)setMaxPowerLevelsCount:(unint64_t)a3
{
  self->_maxPowerLevelsCount = a3;
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

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_balloonImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_waveformImageView, 0);

  objc_storeStrong((id *)&self->_powerLevels, 0);
}

@end