@interface NTKTimerRichComplicationBaseCircularView
- (BOOL)templateWantsPlatter;
- (NTKTimerRichComplicationBaseCircularView)initWithFamily:(int64_t)a3;
- (int64_t)_backgroundFilterStyle;
- (int64_t)_foregroundFilterStyle;
- (void)_applyPausedUpdate;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_pause;
- (void)_resume;
- (void)_updateDialProgress;
- (void)_updatePausedDialProgress;
- (void)dealloc;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKTimerRichComplicationBaseCircularView

- (NTKTimerRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  v55.receiver = self;
  v55.super_class = (Class)NTKTimerRichComplicationBaseCircularView;
  v4 = -[NTKTimerRichComplicationBaseCircularView initWithFamily:](&v55, "initWithFamily:");
  v5 = v4;
  if (!v4) {
    return v5;
  }
  p_layoutConstants = &v4->_layoutConstants;
  id v7 = [(NTKTimerRichComplicationBaseCircularView *)v4 device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_112F0);
  id WeakRetained = objc_loadWeakRetained(&qword_112F8);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v9 = WeakRetained;
  id v10 = objc_loadWeakRetained(&qword_112F8);
  if (v10 != v7)
  {

LABEL_6:
    id v13 = objc_storeWeak(&qword_112F8, v7);
    qword_11300 = (uint64_t)[v7 version];

    sub_2ADC(v14, v7);
    goto LABEL_7;
  }
  id v11 = [v7 version];
  uint64_t v12 = qword_11300;

  if (v11 != (id)v12) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_112F0);
  if (a3 == 12)
  {
    v16 = &xmmword_112B0;
  }
  else
  {
    if (a3 != 10)
    {
      v15 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_73E8(a3, v15);
      }
    }
    v16 = &xmmword_11270;
  }
  long long v17 = v16[1];
  *(_OWORD *)location = *v16;
  long long v18 = v16[2];
  long long v19 = v16[3];
  long long v52 = v17;
  long long v53 = v18;
  long long v54 = v19;

  *(_OWORD *)&p_layoutConstants->numberTicks = *(_OWORD *)location;
  *(_OWORD *)&v5->_layoutConstants.tickSize.height = v52;
  *(_OWORD *)&v5->_layoutConstants.timerLabelBottom = v53;
  *(_OWORD *)&v5->_layoutConstants.timerLabelMaxWidth = v54;

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1D24;
  v49[3] = &unk_C470;
  v20 = v5;
  v50 = v20;
  v21 = objc_retainBlock(v49);
  v22 = +[UIColor systemOrangeColor];
  v23 = [v22 colorWithAlphaComponent:0.3];
  uint64_t v24 = ((void (*)(void *, void *))v21[2])(v21, v23);
  id v25 = v20[1];
  v20[1] = (id)v24;

  v26 = +[UIColor systemOrangeColor];
  uint64_t v27 = ((void (*)(void *, void *))v21[2])(v21, v26);
  id v28 = v20[2];
  v20[2] = (id)v27;

  id v29 = objc_alloc_init((Class)CLKUIColoringLabel);
  id v30 = v20[6];
  v20[6] = v29;

  [v20[6] setInTimeTravel:0];
  objc_initWeak(location, v20);
  id v31 = v20[6];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1E00;
  v47[3] = &unk_C498;
  objc_copyWeak(&v48, location);
  [v31 setNowProvider:v47];
  id v32 = v20[6];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1E60;
  v45[3] = &unk_C4C0;
  objc_copyWeak(&v46, location);
  [v32 setNeedsResizeHandler:v45];
  [v20[6] setMaxWidth:v5->_layoutConstants.timerLabelMaxWidth];
  v33 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v5->_layoutConstants.timerLabelFontSize design:UIFontWeightSemibold];
  v34 = [v33 CLKFontWithAlternativePunctuation];

  [v20[6] setFont:v34];
  id v35 = v20[6];
  v36 = +[UIColor whiteColor];
  [v35 setTextColor:v36];

  [v20[6] setHidden:1];
  v37 = [v20 contentView];
  [v37 addSubview:v20[6]];

  v38 = [v20 device];
  uint64_t v39 = +[NTKTimerBundleTimelineEntry fullColorSymbolImageProviderForDevice:v38 withOverridePointSize:v5->_layoutConstants.overridePointSize];
  id v40 = v20[4];
  v20[4] = (id)v39;

  uint64_t v41 = objc_opt_new();
  id v42 = v20[5];
  v20[5] = (id)v41;

  v43 = [v20 contentView];
  [v43 addSubview:v20[5]];

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(location);

  return v5;
}

- (void)dealloc
{
  [(NTKTimerRichComplicationBaseCircularView *)self _pause];
  v3.receiver = self;
  v3.super_class = (Class)NTKTimerRichComplicationBaseCircularView;
  [(NTKTimerRichComplicationBaseCircularView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)NTKTimerRichComplicationBaseCircularView;
  [(NTKTimerRichComplicationBaseCircularView *)&v29 layoutSubviews];
  objc_super v3 = [(NTKTimerRichComplicationBaseCircularView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(NTKTimerRichComplicationBaseCircularView *)self device];
  CLKSizeCenteredInRectForDevice();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[NTKRichComplicationDialView setFrame:](self->_backgroundDial, "setFrame:", v14, v16, v18, v20);
  -[NTKRichComplicationDialView setFrame:](self->_foregroundDial, "setFrame:", v14, v16, v18, v20);
  [(CLKUIColoringLabel *)self->_timerLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_timerLabel frame];
  double v23 = v22;
  if (v21 >= self->_layoutConstants.timerLabelMaxWidth) {
    double timerLabelMaxWidth = self->_layoutConstants.timerLabelMaxWidth;
  }
  else {
    double timerLabelMaxWidth = v21;
  }
  double timerLabelBottom = self->_layoutConstants.timerLabelBottom;
  v26 = [(CLKUIColoringLabel *)self->_timerLabel font];
  [v26 ascender];
  *(float *)&double v27 = timerLabelBottom - v27;
  double v28 = ceilf(*(float *)&v27);

  -[CLKUIColoringLabel setFrame:](self->_timerLabel, "setFrame:", (v9 - timerLabelMaxWidth) * 0.5, v28, timerLabelMaxWidth, v23);
  -[UIImageView setFrame:](self->_timerImageView, "setFrame:", v5, v7, v9, v11);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v23 = a3;
  if (self->_updateToken)
  {
    double v5 = [(CLKUIColoringLabel *)self->_timerLabel textProvider];
    [v5 stopUpdatesForToken:self->_updateToken];

    updateToken = self->_updateToken;
    self->_updateToken = 0;
  }
  timerImageProvider = self->_timerImageProvider;
  double v8 = [v23 tintColor];
  [(CLKFullColorSymbolImageProvider *)timerImageProvider setTintColor:v8];

  timerImageView = self->_timerImageView;
  double v10 = [(CLKFullColorSymbolImageProvider *)self->_timerImageProvider createSymbolImage];
  [(UIImageView *)timerImageView setImage:v10];

  [(UIImageView *)self->_timerImageView setContentMode:4];
  double v11 = [v23 metadata];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"NTKTimerComplicationMetadataTimerDateKey"];
  timerDate = self->_timerDate;
  self->_timerDate = v12;

  double v14 = [v11 objectForKeyedSubscript:@"NTKTimerComplicationMetadataDurationKey"];
  [v14 doubleValue];
  self->_timerDuration = v15;

  double v16 = [v11 objectForKeyedSubscript:@"NTKTimerComplicationMetaDataRemainingPausedTimeKey"];
  [v16 doubleValue];
  self->_pausedTimeRemaining = v17;

  double v18 = [v11 objectForKeyedSubscript:@"NTKTimerComplicationMetadataTextProviderKey"];
  id v19 = [v18 copy];

  double v20 = [v11 objectForKeyedSubscript:@"NTKTimerComplicationMetaDataIsDefaultKey"];
  unsigned int v21 = [v20 BOOLValue];

  double v22 = [v11 objectForKeyedSubscript:@"NTKTimerComplicationMetadataStateKey"];
  if ([v22 isEqualToString:@"running"])
  {
    [(NTKTimerRichComplicationBaseCircularView *)self _updateDialProgress];
  }
  else
  {
    if (([v22 isEqualToString:@"paused"] & 1) == 0 && v21 == 1)
    {
      self->_showPlatter = 1;
      [(CLKUIColoringLabel *)self->_timerLabel setTextProvider:0];
      [(CLKUIColoringLabel *)self->_timerLabel setHidden:1];
      [(NTKRichComplicationDialView *)self->_backgroundDial setHidden:1];
      [(NTKRichComplicationDialView *)self->_foregroundDial setHidden:1];
      [(UIImageView *)self->_timerImageView setHidden:0];
      [(NTKTimerRichComplicationBaseCircularView *)self _pause];
      goto LABEL_10;
    }
    [(NTKTimerRichComplicationBaseCircularView *)self _updatePausedDialProgress];
  }
  self->_showPlatter = 0;
  [(CLKUIColoringLabel *)self->_timerLabel setTextProvider:v19];
  [(CLKUIColoringLabel *)self->_timerLabel setHidden:0];
  [(CLKUIColoringLabel *)self->_timerLabel setAlpha:1.0];
  [(NTKRichComplicationDialView *)self->_backgroundDial setHidden:0];
  [(NTKRichComplicationDialView *)self->_foregroundDial setHidden:0];
  [(UIImageView *)self->_timerImageView setHidden:1];
LABEL_10:
  [(NTKTimerRichComplicationBaseCircularView *)self _applyPausedUpdate];
  [(NTKTimerRichComplicationBaseCircularView *)self setNeedsLayout];
  [(NTKTimerRichComplicationBaseCircularView *)self _updatePlatterColor];
}

- (void)_applyPausedUpdate
{
  if ([(NTKTimerRichComplicationBaseCircularView *)self paused]) {
    [(NTKTimerRichComplicationBaseCircularView *)self _pause];
  }
  else {
    [(NTKTimerRichComplicationBaseCircularView *)self _resume];
  }
  id v3 = [(NTKTimerRichComplicationBaseCircularView *)self paused];
  id v4 = [(UIImageView *)self->_timerImageView layer];
  [v4 setShouldRasterize:v3];
}

- (void)_updatePausedDialProgress
{
  double v2 = self->_pausedTimeRemaining / self->_timerDuration;
  if (v2 > 1.0) {
    double v2 = 1.0;
  }
  double v3 = fmax(v2, 0.0);
  *(float *)&double v3 = v3;
  [(NTKRichComplicationDialView *)self->_foregroundDial setProgress:v3];
}

- (void)_updateDialProgress
{
  timerDate = self->_timerDate;
  id v4 = +[NSDate date];
  [(NSDate *)timerDate timeIntervalSinceDate:v4];
  double v6 = v5;

  double v7 = v6 / self->_timerDuration;
  if (v7 > 1.0) {
    double v7 = 1.0;
  }
  double v9 = fmax(v7, 0.0);
  foregroundDial = self->_foregroundDial;
  *(float *)&double v9 = v9;

  [(NTKRichComplicationDialView *)foregroundDial setProgress:v9];
}

- (void)_resume
{
  double v3 = [(CLKUIColoringLabel *)self->_timerLabel textProvider];
  [v3 setPaused:0];
  if (!self->_updateToken)
  {
    objc_initWeak(&location, self);
    id v4 = [(CLKUIColoringLabel *)self->_timerLabel textProvider];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_266C;
    v7[3] = &unk_C4C0;
    objc_copyWeak(&v8, &location);
    double v5 = [v4 startUpdatesWithHandler:v7];
    updateToken = self->_updateToken;
    self->_updateToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_pause
{
  id v5 = [(CLKUIColoringLabel *)self->_timerLabel textProvider];
  [v5 setPaused:1];
  if (self->_updateToken)
  {
    double v3 = [(CLKUIColoringLabel *)self->_timerLabel textProvider];
    [v3 stopUpdatesForToken:self->_updateToken];

    updateToken = self->_updateToken;
    self->_updateToken = 0;
  }
}

- (BOOL)templateWantsPlatter
{
  return self->_showPlatter;
}

- (int64_t)_backgroundFilterStyle
{
  return 0;
}

- (int64_t)_foregroundFilterStyle
{
  return 2;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKTimerRichComplicationBaseCircularView;
  -[NTKTimerRichComplicationBaseCircularView transitionToMonochromeWithFraction:](&v13, "transitionToMonochromeWithFraction:");
  id v5 = [(NTKTimerRichComplicationBaseCircularView *)self filterProvider];
  double v6 = objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKTimerRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"), a3);

  if (v6)
  {
    double v7 = [(UIImageView *)self->_timerImageView layer];
    [v7 setFilters:v6];

    id v8 = [(NTKRichComplicationDialView *)self->_backgroundDial layer];
    [v8 setFilters:v6];

    double v9 = [(NTKRichComplicationDialView *)self->_foregroundDial layer];
    [v9 setFilters:v6];
  }
  double v10 = [(NTKTimerRichComplicationBaseCircularView *)self filterProvider];
  double v11 = objc_msgSend(v10, "filtersForView:style:fraction:", self, -[NTKTimerRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"), a3);

  if (v11)
  {
    uint64_t v12 = [(CLKUIColoringLabel *)self->_timerLabel layer];
    [v12 setFilters:v11];
  }
}

- (void)updateMonochromeColor
{
  v11.receiver = self;
  v11.super_class = (Class)NTKTimerRichComplicationBaseCircularView;
  [(NTKTimerRichComplicationBaseCircularView *)&v11 updateMonochromeColor];
  double v3 = [(NTKTimerRichComplicationBaseCircularView *)self filterProvider];
  id v4 = objc_msgSend(v3, "filtersForView:style:", self, -[NTKTimerRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"));

  if (v4)
  {
    id v5 = [(UIImageView *)self->_timerImageView layer];
    [v5 setFilters:v4];

    double v6 = [(NTKRichComplicationDialView *)self->_backgroundDial layer];
    [v6 setFilters:v4];

    double v7 = [(NTKRichComplicationDialView *)self->_foregroundDial layer];
    [v7 setFilters:v4];
  }
  id v8 = [(NTKTimerRichComplicationBaseCircularView *)self filterProvider];
  double v9 = objc_msgSend(v8, "filtersForView:style:", self, -[NTKTimerRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"));

  if (v9)
  {
    double v10 = [(CLKUIColoringLabel *)self->_timerLabel layer];
    [v10 setFilters:v9];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_timerDate, 0);
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_storeStrong((id *)&self->_timerImageView, 0);
  objc_storeStrong((id *)&self->_timerImageProvider, 0);
  objc_storeStrong((id *)&self->_foregroundDial, 0);

  objc_storeStrong((id *)&self->_backgroundDial, 0);
}

@end