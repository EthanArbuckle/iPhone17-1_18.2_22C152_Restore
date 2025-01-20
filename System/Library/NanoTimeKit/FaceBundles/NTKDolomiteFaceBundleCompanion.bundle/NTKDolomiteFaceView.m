@interface NTKDolomiteFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_needsContentTransitionView;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKDolomiteFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_palette;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5 refreshHandler:(id)a6;
- (id)createFaceColorPalette;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPauseStateToActiveContentViewIfNecessary;
- (void)_applyStyle:(unint64_t)a3;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_loadActiveViews;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_setNumeral:(unint64_t)a3;
- (void)_setStatusBarIconShadowNeeded:(BOOL)a3;
- (void)_setStyle:(unint64_t)a3;
- (void)_timerSecondFired:(int)a3;
- (void)_unloadActiveViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateColorsWithPalette:(id)a3;
- (void)dealloc;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKDolomiteFaceView

- (NTKDolomiteFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKDolomiteFaceView;
  v9 = [(NTKDolomiteFaceView *)&v22 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = +[NTKDolomiteNumeralEditOption defaultOptionForDevice:v8];
    v9->_numeral = (unint64_t)[v10 numeral];

    v11 = +[NTKDolomiteStyleEditOption defaultOptionForDevice:v8];
    v9->_style = (unint64_t)[v11 style];

    v9->_isAOD1hzTimeline = NTKEnableAOD1hzTimeline();
    objc_initWeak(&location, v9);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1B28;
    v19[3] = &unk_D58420;
    objc_copyWeak(&v20, &location);
    v12 = objc_retainBlock(v19);
    id dateDefaultProvider = v9->_dateDefaultProvider;
    v9->_id dateDefaultProvider = v12;

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1B98;
    v17[3] = &unk_D58420;
    objc_copyWeak(&v18, &location);
    v14 = objc_retainBlock(v17);
    id dateOverrideProvider = v9->_dateOverrideProvider;
    v9->_id dateOverrideProvider = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  [(NTKDolomiteFaceView *)self _stopTimer];
  v3.receiver = self;
  v3.super_class = (Class)NTKDolomiteFaceView;
  [(NTKDolomiteFaceView *)&v3 dealloc];
}

- (void)_loadSnapshotContentViews
{
}

- (void)_unloadSnapshotContentViews
{
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDolomiteFaceView;
  [(NTKDolomiteFaceView *)&v3 _applyFrozen];
  [(NTKDolomiteFaceView *)self _applyPauseStateToActiveContentViewIfNecessary];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v15 = a3;
  if (v15)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    p_isShowOverride = &self->_isShowOverride;
    if (self->_isShowOverride) {
      goto LABEL_18;
    }
    [(NTKDolomiteContentView *)self->_contentOverrideView updateDate];
    char v8 = 1;
  }
  else
  {
    p_isShowOverride = &self->_isShowOverride;
    if (!self->_isShowOverride) {
      goto LABEL_18;
    }
    char v8 = 0;
  }
  BOOL *p_isShowOverride = v8;
  v9 = [(NTKDolomiteContentView *)self->_contentOverrideView layer];
  v10 = v9;
  if (a4 <= 0.0)
  {
    [v9 removeAnimationForKey:@"fade"];
    double v14 = 0.0;
    if (v15) {
      *(float *)&double v14 = 1.0;
    }
    [v10 setOpacity:v14];
  }
  else
  {
    v11 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    if (v15) {
      v12 = &off_D58D78;
    }
    else {
      v12 = &off_D58D88;
    }
    if (v15) {
      v13 = &off_D58D88;
    }
    else {
      v13 = &off_D58D78;
    }
    [v11 setFromValue:v12];
    [v11 setToValue:v13];
    [v11 setFillMode:kCAFillModeBoth];
    [v11 setDuration:a4];
    [v11 setRemovedOnCompletion:0];
    [v10 addAnimation:v11 forKey:@"fade"];
  }
LABEL_18:
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  contentActiveView = self->_contentActiveView;
  BOOL v5 = [(NTKDolomiteFaceView *)self dataMode] == (char *)&dword_0 + 1;

  [(NTKDolomiteContentView *)contentActiveView setAdjustsForStatusBarIcon:v3 animated:v5];
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_isStatusBarIconShadowNeeded;
}

- (void)_setStatusBarIconShadowNeeded:(BOOL)a3
{
  if (self->_isStatusBarIconShadowNeeded != a3)
  {
    self->_isStatusBarIconShadowNeeded = a3;
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1F64;
    v3[3] = &unk_D58448;
    objc_copyWeak(&v4, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)_timerSecondFired:(int)a3
{
}

- (void)_applyPauseStateToActiveContentViewIfNecessary
{
  id v3 = [(NTKDolomiteFaceView *)self isFrozen];
  if (self->_isPaused != v3)
  {
    id v4 = v3;
    self->_isPaused = (char)v3;
    if (v3) {
      [(NTKDolomiteFaceView *)self _stopTimer];
    }
    else {
      [(NTKDolomiteFaceView *)self _startTimer];
    }
    [(NTKDolomiteContentView *)self->_contentActiveView setPaused:v4];
    [(NTKDolomiteContentView *)self->_contentActiveView updateDate];
    BOOL v5 = [(NTKDolomiteFaceView *)self dataMode] == (char *)&dword_0 + 2;
    contentOverrideView = self->_contentOverrideView;
    [(NTKDolomiteContentView *)contentOverrideView forceColorRefresh:v5];
  }
}

- (id)createFaceColorPalette
{
  v2 = [[NTKDolomiteColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)_palette
{
  return [(NTKDolomiteFaceView *)self faceColorPalette];
}

- (void)_updateColorsWithPalette:(id)a3
{
  contentActiveView = self->_contentActiveView;
  id v5 = a3;
  [(NTKDolomiteContentView *)contentActiveView setPalette:v5];
  [(NTKDolomiteContentView *)self->_contentOverrideView setPalette:v5];
}

- (void)_prepareForEditing
{
  [(NTKDolomiteContentView *)self->_contentActiveView setIsEditing:1];
  [(NTKDolomiteContentView *)self->_contentOverrideView setIsEditing:1];
  v5.receiver = self;
  v5.super_class = (Class)NTKDolomiteFaceView;
  [(NTKDolomiteFaceView *)&v5 _prepareForEditing];
  objc_storeStrong((id *)&self->_specifierDate, self->_overrideDate);
  id v3 = [(NTKDolomiteContentView *)self->_contentOverrideView layer];
  [v3 removeAnimationForKey:@"fade"];
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];
  [(NTKDolomiteFaceView *)self _applyPauseStateToActiveContentViewIfNecessary];
}

- (void)_cleanupAfterEditing
{
  [(NTKDolomiteContentView *)self->_contentActiveView setIsEditing:0];
  [(NTKDolomiteContentView *)self->_contentOverrideView setIsEditing:0];
  specifierDate = self->_specifierDate;
  self->_specifierDate = 0;

  v6.receiver = self;
  v6.super_class = (Class)NTKDolomiteFaceView;
  [(NTKDolomiteFaceView *)&v6 _cleanupAfterEditing];
  [(NTKDolomiteFaceView *)self _applyStyle:[(NTKDolomiteContentView *)self->_contentActiveView style]];
  double v4 = [(NTKDolomiteContentView *)self->_contentOverrideView layer];
  LODWORD(v5) = 1.0;
  [v4 setOpacity:v5];
  [(NTKDolomiteFaceView *)self _applyPauseStateToActiveContentViewIfNecessary];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKDolomiteFaceView;
  [(NTKDolomiteFaceView *)&v10 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  switch(a4)
  {
    case 10:
      v9 = [(NTKDolomiteFaceView *)self _palette];
      [(NTKDolomiteFaceView *)self _updateColorsWithPalette:v9];

      break;
    case 15:
      -[NTKDolomiteFaceView _setStyle:](self, "_setStyle:", [v8 style]);
      break;
    case 19:
      -[NTKDolomiteFaceView _setNumeral:](self, "_setNumeral:", [v8 numeral]);
      break;
  }
}

- (void)_setNumeral:(unint64_t)a3
{
  if (self->_numeral != a3)
  {
    self->_numeral = a3;
    -[NTKDolomiteContentView setNumeral:](self->_contentActiveView, "setNumeral:");
    [(NTKDolomiteContentView *)self->_contentActiveView updateDate];
    [(NTKDolomiteContentView *)self->_contentOverrideView setNumeral:self->_numeral];
    contentOverrideView = self->_contentOverrideView;
    [(NTKDolomiteContentView *)contentOverrideView updateDate];
  }
}

- (void)_applyStyle:(unint64_t)a3
{
  self->_style = a3;
  uint64_t v5 = 2 * (a3 == 1);
  -[NTKDolomiteContentView setStyle:](self->_contentActiveView, "setStyle:");
  [(NTKDolomiteContentView *)self->_contentActiveView setBackgroundStyle:v5];
  [(NTKDolomiteContentView *)self->_contentActiveView updateDate];
  [(NTKDolomiteContentView *)self->_contentOverrideView setStyle:a3];
  [(NTKDolomiteContentView *)self->_contentOverrideView setBackgroundStyle:v5];
  [(NTKDolomiteContentView *)self->_contentOverrideView updateDate];

  [(NTKDolomiteFaceView *)self _setStatusBarIconShadowNeeded:a3 == 0];
}

- (void)_setStyle:(unint64_t)a3
{
  if ([(NTKDolomiteContentView *)self->_contentActiveView style] != a3
    || [(NTKDolomiteContentView *)self->_contentOverrideView style] != a3)
  {
    [(NTKDolomiteFaceView *)self _applyStyle:a3];
  }
  self->_style = a3;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v31 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 != 19)
  {
    if (a6 != 15)
    {
      if (a6 != 10) {
        goto LABEL_22;
      }
      double v14 = [(NTKDolomiteFaceView *)self interpolatedColorPalette];
      [(NTKDolomiteFaceView *)self _updateColorsWithPalette:v14];
      goto LABEL_21;
    }
    v19 = (char *)[v31 style];
    id v20 = (char *)[v12 style];
    v21 = [(NTKDolomiteContentView *)self->_contentOverrideView layer];
    double v14 = v21;
    HIDWORD(v22) = 1058682594;
    if (a3 >= 0.0001 && v19 != v20)
    {
      HIDWORD(v22) = 1072693038;
      if (a3 <= 0.9999)
      {
        [(NTKDolomiteContentView *)self->_contentActiveView setStyle:v19];
        [(NTKDolomiteContentView *)self->_contentActiveView setBackgroundStyle:2 * (v19 == (unsigned char *)&dword_0 + 1)];
        [(NTKDolomiteContentView *)self->_contentActiveView updateDate];
        [(NTKDolomiteContentView *)self->_contentOverrideView setStyle:v20];
        [(NTKDolomiteContentView *)self->_contentOverrideView setBackgroundStyle:2 * (v20 == (unsigned char *)&dword_0 + 1)];
        [(NTKDolomiteContentView *)self->_contentOverrideView updateDate];
        *(float *)&double v28 = a3;
        [v14 setOpacity:v28];
        CLKMapFractionIntoRange();
        contentOverrideView = self->_contentOverrideView;
        goto LABEL_20;
      }
      v19 = v20;
    }
    LODWORD(v22) = 1.0;
    [v21 setOpacity:v22];
    [(NTKDolomiteFaceView *)self _setStyle:v19];
    contentOverrideView = self->_contentOverrideView;
    double v25 = 1.0;
LABEL_20:
    [(NTKDolomiteContentView *)contentOverrideView setDigitFadeFraction:v25];
LABEL_21:

    goto LABEL_22;
  }
  id v15 = [v31 numeral];
  id v16 = [v12 numeral];
  if (v15 == v16)
  {
    [(NTKDolomiteFaceView *)self _setNumeral:v15];
    v17 = self->_contentOverrideView;
    double v18 = 1.0;
  }
  else
  {
    if (a3 >= 0.5)
    {
      id v29 = v16;
      CLKMapFractionIntoRange();
      double v27 = v30;
      id v15 = v29;
    }
    else
    {
      CLKMapFractionIntoRange();
      double v27 = v26;
    }
    [(NTKDolomiteFaceView *)self _setNumeral:v15];
    v17 = self->_contentOverrideView;
    double v18 = v27;
  }
  [(NTKDolomiteContentView *)v17 setDigitFadeFraction:v18];
LABEL_22:
}

- (void)_loadActiveViews
{
  [(NTKDolomiteFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v32 = [(NTKDolomiteFaceView *)self device];
  id v12 = [(NTKDolomiteFaceView *)self contentView];
  uint64_t v31 = 2 * (self->_style == 1);
  id v13 = [NTKDolomiteContentView alloc];
  unint64_t numeral = self->_numeral;
  unint64_t style = self->_style;
  id v16 = [(NTKDolomiteFaceView *)self _palette];
  LOWORD(v29) = self->_is24HourMode;
  v17 = -[NTKDolomiteContentView initWithFrame:role:numeral:style:palette:backgroundStyle:digitStyle:dateProvider:is24HourMode:forceDynamicIndexZero:contentOption:device:](v13, "initWithFrame:role:numeral:style:palette:backgroundStyle:digitStyle:dateProvider:is24HourMode:forceDynamicIndexZero:contentOption:device:", 0, numeral, style, v16, v31, 0, v5, v7, v9, v11, self->_dateDefaultProvider, v29, 0, v32);
  contentActiveView = self->_contentActiveView;
  self->_contentActiveView = v17;

  v19 = [NTKDolomiteContentView alloc];
  unint64_t v20 = self->_numeral;
  unint64_t v21 = self->_style;
  double v22 = [(NTKDolomiteFaceView *)self _palette];
  BYTE1(v30) = 1;
  LOBYTE(v30) = self->_is24HourMode;
  v23 = -[NTKDolomiteContentView initWithFrame:role:numeral:style:palette:backgroundStyle:digitStyle:dateProvider:is24HourMode:forceDynamicIndexZero:contentOption:device:](v19, "initWithFrame:role:numeral:style:palette:backgroundStyle:digitStyle:dateProvider:is24HourMode:forceDynamicIndexZero:contentOption:device:", 0, v20, v21, v22, v31, 0, v5, v7, v9, v11, self->_dateOverrideProvider, v30, 0, v32);
  contentOverrideView = self->_contentOverrideView;
  self->_contentOverrideView = v23;

  [(NTKDolomiteContentView *)self->_contentOverrideView setPaused:1];
  LOBYTE(v2) = self->_isShowOverride;
  double v25 = [(NTKDolomiteContentView *)self->_contentOverrideView layer];
  *(float *)&double v26 = (float)v2;
  [v25 setOpacity:v26];
  double v27 = (NTKRoundedCornerOverlayView *)objc_msgSend(objc_alloc((Class)NTKRoundedCornerOverlayView), "initWithFrame:forDeviceCornerRadius:", v32, v5, v7, v9, v11);
  cornerView = self->_cornerView;
  self->_cornerView = v27;

  [v12 addSubview:self->_contentActiveView];
  [v12 bringSubviewToFront:self->_contentActiveView];
  [v12 insertSubview:self->_contentOverrideView aboveSubview:self->_contentActiveView];
  [v12 insertSubview:self->_cornerView aboveSubview:self->_contentOverrideView];
}

- (void)_unloadActiveViews
{
  [(NTKDolomiteContentView *)self->_contentActiveView removeFromSuperview];
  contentActiveView = self->_contentActiveView;
  self->_contentActiveView = 0;

  [(NTKDolomiteContentView *)self->_contentOverrideView removeFromSuperview];
  contentOverrideView = self->_contentOverrideView;
  self->_contentOverrideView = 0;

  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (BOOL)_needsContentTransitionView
{
  return self->_isAOD1hzTimeline && !self->_style;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  double v4 = &off_D58F50;
  if (a3 != 15) {
    double v4 = 0;
  }
  if (a3 == 19) {
    return &off_D58F38;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5 refreshHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 == 15)
  {
    id v14 = v10;
    id v13 = [v11 objectForKeyedSubscript:&off_D58E08];
    goto LABEL_5;
  }
  if (a4 == 19)
  {
    id v13 = v10;
    id v14 = [v11 objectForKeyedSubscript:&off_D58DF0];
LABEL_5:
    id v15 = [v11 objectForKeyedSubscript:&off_D58DD8];
    id v16 = +[NSString stringWithFormat:@"%@-%@-%@", v13, v14, v15];
    v17 = +[NTKSwatchRenderer cachedSwatchForKey:v16];
    double v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      double v27 = [(NTKDolomiteFaceView *)self device];
      unint64_t v20 = [[NTKDolomiteFaceView alloc] initWithFaceStyle:44 forDevice:v27 clientIdentifier:0];
      [(NTKDolomiteFaceView *)self frame];
      -[NTKDolomiteFaceView setFrame:](v20, "setFrame:");
      [(NTKDolomiteFaceView *)v20 _loadSnapshotContentViews];
      [(NTKDolomiteFaceView *)v20 setOption:v13 forCustomEditMode:19 slot:0];
      [(NTKDolomiteFaceView *)v20 setOption:v14 forCustomEditMode:15 slot:0];
      [(NTKDolomiteFaceView *)v20 setOption:v15 forCustomEditMode:10 slot:0];
      unint64_t v21 = NTKIdealizedDate();
      [(NTKDolomiteFaceView *)v20 setOverrideDate:v21 duration:0.0];

      [(NTKDolomiteFaceView *)v20 layoutIfNeeded];
      [(NTKDolomiteFaceView *)v20 setNeedsDisplay];
      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", [v10 swatchStyle]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_2E50;
      block[3] = &unk_D58470;
      uint64_t v33 = v22;
      uint64_t v34 = v23;
      uint64_t v29 = v20;
      id v30 = v27;
      id v31 = v16;
      id v32 = v12;
      id v24 = v27;
      double v25 = v20;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    goto LABEL_10;
  }
  double v18 = objc_opt_new();
LABEL_10:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateOverrideProvider, 0);
  objc_storeStrong(&self->_dateDefaultProvider, 0);
  objc_storeStrong((id *)&self->_specifierDate, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_contentOverrideView, 0);
  objc_storeStrong((id *)&self->_contentActiveView, 0);

  objc_storeStrong((id *)&self->_cornerView, 0);
}

@end