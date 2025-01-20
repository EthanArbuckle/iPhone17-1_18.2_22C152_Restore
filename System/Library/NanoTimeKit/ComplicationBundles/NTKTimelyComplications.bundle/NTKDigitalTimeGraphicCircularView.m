@interface NTKDigitalTimeGraphicCircularView
+ ($58D15C9700E10FDF418FBC0C790388C2)_layoutConstantsForDevice:(SEL)a3;
+ (BOOL)tritium_wantsCrossfadeAnimation;
+ (int64_t)_filterStyle;
- ($58D15C9700E10FDF418FBC0C790388C2)layoutConstants;
- (CLKClockTimerToken)clockTimerToken;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSDate)overrideDate;
- (NTKDigitalTimeLabel)timeLabel;
- (NTKRichComplicationDialView)filledSecondsDialView;
- (NTKRichComplicationDialView)unfilledSecondsDialView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_updateProgress;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)pauseLiveFullColorImageView;
- (void)resumeLiveFullColorImageView;
- (void)setClockTimerToken:(id)a3;
- (void)setFilledSecondsDialView:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setLayoutConstants:(id *)a3;
- (void)setOverrideDate:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)setUnfilledSecondsDialView:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKDigitalTimeGraphicCircularView

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)NTKDigitalTimeGraphicCircularView;
  [(NTKDigitalTimeGraphicCircularView *)&v28 layoutSubviews];
  [(NTKDigitalTimeGraphicCircularView *)self bounds];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double v7 = CGRectGetWidth(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v32);
  if (v7 < v8) {
    double v8 = v7;
  }
  double v9 = v8 * 0.5;
  v10 = [(NTKDigitalTimeGraphicCircularView *)self layer];
  [v10 setCornerRadius:v9];
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v12 = CGRectGetHeight(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v36);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v15 = [(NTKDigitalTimeGraphicCircularView *)self unfilledSecondsDialView];
  v29[0] = v15;
  v16 = [(NTKDigitalTimeGraphicCircularView *)self filledSecondsDialView];
  v29[1] = v16;
  v17 = +[NSArray arrayWithObjects:v29 count:2];

  id v18 = [v17 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v22, "setBounds:", 0.0, 0.0, v11, v12);
        objc_msgSend(v22, "setCenter:", MidX, MidY);
      }
      id v19 = [v17 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v19);
  }

  v23 = [(NTKDigitalTimeGraphicCircularView *)self timeLabel];
  objc_msgSend(v23, "setBounds:", 0.0, 0.0, v11, v12);
  objc_msgSend(v23, "setCenter:", MidX, MidY);
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NTKDigitalTimeGraphicCircularView;
  v5 = -[NTKDigitalTimeGraphicCircularView initWithFrame:](&v29, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    [(id)objc_opt_class() _layoutConstantsForDevice:v4];
    double v7 = v6;
    v5->_layoutConstants.secondsTickSize.CGFloat width = v8;
    v5->_layoutConstants.secondsTickSize.CGFloat height = v9;
    v5->_layoutConstants.secondsDialDiameter = v10;
    v5->_layoutConstants.timeFontSize = v6;
    v5->_inactiveTickAccentAlpha = 0.25;
    v5->_activeTickAccentAlpha = 0.9;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_8888;
    v27[3] = &unk_10520;
    v27[4] = 60;
    *(CGFloat *)&v27[5] = v8;
    *(CGFloat *)&v27[6] = v9;
    long long v28 = xmmword_FA80;
    double v11 = objc_retainBlock(v27);
    double v12 = +[UIColor colorWithWhite:1.0 alpha:v5->_inactiveTickAccentAlpha];
    uint64_t v13 = ((void (*)(void *, void *))v11[2])(v11, v12);
    unfilledSecondsDialView = v5->_unfilledSecondsDialView;
    v5->_unfilledSecondsDialView = (NTKRichComplicationDialView *)v13;

    [(NTKDigitalTimeGraphicCircularView *)v5 addSubview:v5->_unfilledSecondsDialView];
    v15 = +[UIColor colorWithWhite:1.0 alpha:v5->_activeTickAccentAlpha];
    uint64_t v16 = ((void (*)(void *, void *))v11[2])(v11, v15);
    filledSecondsDialView = v5->_filledSecondsDialView;
    v5->_filledSecondsDialView = (NTKRichComplicationDialView *)v16;

    LODWORD(v18) = 0.5;
    [(NTKRichComplicationDialView *)v5->_filledSecondsDialView setProgress:v18];
    [(NTKDigitalTimeGraphicCircularView *)v5 addSubview:v5->_filledSecondsDialView];
    id v19 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v7 design:UIFontWeightSemibold];
    uint64_t v20 = [v19 CLKFontWithAlternativePunctuation];

    id v21 = [objc_alloc((Class)NTKDigitalTimeLabel) initWithTimeLabelOptions:1 forDevice:v4];
    [v21 setFont:v20];
    v22 = +[UIColor whiteColor];
    [v21 setColor:v22];

    v23 = +[UIColor systemOrangeColor];
    [v21 setTextColor:v23];

    timeLabel = v5->_timeLabel;
    v5->_timeLabel = (NTKDigitalTimeLabel *)v21;
    id v25 = v21;

    [(NTKDigitalTimeGraphicCircularView *)v5 addSubview:v5->_timeLabel];
  }

  return v5;
}

- (void)pauseLiveFullColorImageView
{
}

- (void)resumeLiveFullColorImageView
{
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  double v6 = [v5 metadata];
  double v7 = [v6 objectForKey:@"NTKDigitalTimeGraphicCircularViewOverrideDateKey"];
  unsigned int v8 = objc_msgSend(v5, "tritium_isTritiumInactiveFullColorImageProvider");

  if (v8 && !v7)
  {
    double v7 = +[CLKDate complicationDate];
  }
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CGFloat v9 = self;
    double v10 = v7;
  }
  else
  {
    CGFloat v9 = self;
    double v10 = 0;
  }
  [(NTKDigitalTimeGraphicCircularView *)v9 setOverrideDate:v10];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_8A80;
  v13[3] = &unk_10540;
  char v14 = v8;
  double v11 = objc_retainBlock(v13);
  double v12 = [(NTKDigitalTimeGraphicCircularView *)self filledSecondsDialView];
  ((void (*)(void *, void *))v11[2])(v11, v12);
  [(NTKDigitalTimeGraphicCircularView *)self _updateProgress];
}

+ (BOOL)tritium_wantsCrossfadeAnimation
{
  return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v5 = [(id)objc_opt_class() _filterStyle];
  double v6 = [(NTKDigitalTimeGraphicCircularView *)self filterProvider];
  double v7 = [v6 device];
  int v8 = NTKShowGossamerUI();

  if (v8) {
    id v5 = 0;
  }
  CGFloat v9 = [(NTKDigitalTimeGraphicCircularView *)self filterProvider];
  id v23 = [v9 filtersForView:self style:v5 fraction:a3];

  if (v23)
  {
    double v10 = [(NTKDigitalTimeGraphicCircularView *)self timeLabel];
    double v11 = [v10 layer];
    [v11 setFilters:v23];
  }
  double v12 = [(NTKDigitalTimeGraphicCircularView *)self filterProvider];
  uint64_t v13 = [v12 device];
  int v14 = NTKShowGossamerUI();

  if (v14)
  {
    v15 = [(NTKDigitalTimeGraphicCircularView *)self filterProvider];
    uint64_t v16 = [v15 colorForView:self accented:1];

    v17 = +[UIColor whiteColor];
    double v18 = NTKInterpolateBetweenColors();

    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    id v19 = [(NTKDigitalTimeGraphicCircularView *)self unfilledSecondsDialView];
    uint64_t v20 = [v18 colorWithAlphaComponent:self->_inactiveTickAccentAlpha];
    [v19 setTickColor:v20];

    id v21 = [(NTKDigitalTimeGraphicCircularView *)self filledSecondsDialView];
    v22 = [v18 colorWithAlphaComponent:self->_activeTickAccentAlpha];
    [v21 setTickColor:v22];

    +[CATransaction commit];
  }
}

- (void)updateMonochromeColor
{
}

+ ($58D15C9700E10FDF418FBC0C790388C2)_layoutConstantsForDevice:(SEL)a3
{
  sub_8D20(a4);
  return result;
}

+ (int64_t)_filterStyle
{
  return 2;
}

- (void)_startClockUpdates
{
  v3 = [(NTKDigitalTimeGraphicCircularView *)self clockTimerToken];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = +[CLKClockTimer sharedInstance];
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    double v7 = sub_8F60;
    int v8 = &unk_104B8;
    objc_copyWeak(&v9, &location);
    v3 = [v4 startUpdatesWithUpdateFrequency:1 withHandler:&v5 identificationLog:&stru_10560];

    -[NTKDigitalTimeGraphicCircularView setClockTimerToken:](self, "setClockTimerToken:", v3, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopClockUpdates
{
  id v4 = [(NTKDigitalTimeGraphicCircularView *)self clockTimerToken];
  if (v4)
  {
    v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:v4];

    [(NTKDigitalTimeGraphicCircularView *)self setClockTimerToken:0];
  }
}

- (void)_updateProgress
{
  v3 = [(NTKDigitalTimeGraphicCircularView *)self overrideDate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NTKDate faceDate];
  }
  uint64_t v6 = v5;
  double v7 = +[NSCalendar currentCalendar];
  float v8 = (float)((uint64_t)[v7 component:128 fromDate:v6] % 60) / 60.0;
  id v9 = [(NTKDigitalTimeGraphicCircularView *)self timeLabel];
  double v10 = [v9 timeFormatter];
  double v11 = [(NTKDigitalTimeGraphicCircularView *)self filledSecondsDialView];
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:0.0];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_9218;
  double v18 = &unk_10588;
  float v22 = v8;
  id v19 = v11;
  id v20 = v10;
  id v21 = v4;
  id v12 = v4;
  id v13 = v10;
  id v14 = v11;
  +[UIView performWithoutAnimation:&v15];
  +[CATransaction commit];
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (NTKDigitalTimeLabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (NTKRichComplicationDialView)unfilledSecondsDialView
{
  return self->_unfilledSecondsDialView;
}

- (void)setUnfilledSecondsDialView:(id)a3
{
}

- (NTKRichComplicationDialView)filledSecondsDialView
{
  return self->_filledSecondsDialView;
}

- (void)setFilledSecondsDialView:(id)a3
{
}

- (CLKClockTimerToken)clockTimerToken
{
  return self->_clockTimerToken;
}

- (void)setClockTimerToken:(id)a3
{
}

- ($58D15C9700E10FDF418FBC0C790388C2)layoutConstants
{
  return self;
}

- (void)setLayoutConstants:(id *)a3
{
  self->_layoutConstants.secondsTickSize.CGFloat width = v3;
  self->_layoutConstants.secondsTickSize.CGFloat height = v4;
  self->_layoutConstants.secondsDialDiameter = v5;
  self->_layoutConstants.timeFontSize = v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_filledSecondsDialView, 0);
  objc_storeStrong((id *)&self->_unfilledSecondsDialView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);

  objc_destroyWeak((id *)&self->_filterProvider);
}

@end