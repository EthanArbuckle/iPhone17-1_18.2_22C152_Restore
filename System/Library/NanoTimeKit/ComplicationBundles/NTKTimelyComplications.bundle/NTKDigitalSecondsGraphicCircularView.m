@interface NTKDigitalSecondsGraphicCircularView
+ ($58D15C9700E10FDF418FBC0C790388C2)_layoutConstantsForDevice:(SEL)a3;
+ (BOOL)tritium_wantsCrossfadeAnimation;
+ (int64_t)_filterStyle;
- ($58D15C9700E10FDF418FBC0C790388C2)layoutConstants;
- (CLKClockTimerToken)clockTimerToken;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSDate)overrideDate;
- (NTKRichComplicationDialView)filledSecondsDialView;
- (NTKRichComplicationDialView)unfilledSecondsDialView;
- (UILabel)timeLabel;
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

@implementation NTKDigitalSecondsGraphicCircularView

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)NTKDigitalSecondsGraphicCircularView;
  [(NTKDigitalSecondsGraphicCircularView *)&v28 layoutSubviews];
  [(NTKDigitalSecondsGraphicCircularView *)self bounds];
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
  v10 = [(NTKDigitalSecondsGraphicCircularView *)self layer];
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
  v15 = [(NTKDigitalSecondsGraphicCircularView *)self unfilledSecondsDialView];
  v29[0] = v15;
  v16 = [(NTKDigitalSecondsGraphicCircularView *)self filledSecondsDialView];
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

  v23 = [(NTKDigitalSecondsGraphicCircularView *)self timeLabel];
  objc_msgSend(v23, "setBounds:", 0.0, 0.0, v11, v12);
  objc_msgSend(v23, "setCenter:", MidX, MidY);
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NTKDigitalSecondsGraphicCircularView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  double v8 = -[NTKDigitalSecondsGraphicCircularView initWithFrame:](&v32, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    [(id)objc_opt_class() _layoutConstantsForDevice:v4];
    double v10 = v9;
    v8->_layoutConstants.secondsTickSize.double width = v11;
    v8->_layoutConstants.secondsTickSize.double height = v12;
    v8->_layoutConstants.secondsDialDiameter = v13;
    v8->_layoutConstants.timeFontSize = v9;
    v8->_inactiveTickAccentAlpha = 0.25;
    v8->_activeTickAccentAlpha = 0.9;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_9FF8;
    v30[3] = &unk_10520;
    v30[4] = 60;
    *(CGFloat *)&v30[5] = v11;
    *(CGFloat *)&v30[6] = v12;
    long long v31 = xmmword_FA80;
    v14 = objc_retainBlock(v30);
    v15 = +[UIColor colorWithWhite:1.0 alpha:v8->_inactiveTickAccentAlpha];
    uint64_t v16 = ((void (*)(void *, void *))v14[2])(v14, v15);
    unfilledSecondsDialView = v8->_unfilledSecondsDialView;
    v8->_unfilledSecondsDialView = (NTKRichComplicationDialView *)v16;

    [(NTKDigitalSecondsGraphicCircularView *)v8 addSubview:v8->_unfilledSecondsDialView];
    id v18 = +[UIColor systemOrangeColor];
    id v19 = [v18 colorWithAlphaComponent:v8->_activeTickAccentAlpha];

    uint64_t v20 = ((void (*)(void *, void *))v14[2])(v14, v19);
    filledSecondsDialView = v8->_filledSecondsDialView;
    v8->_filledSecondsDialView = (NTKRichComplicationDialView *)v20;

    LODWORD(v22) = 0.5;
    [(NTKRichComplicationDialView *)v8->_filledSecondsDialView setProgress:v22];
    [(NTKDigitalSecondsGraphicCircularView *)v8 addSubview:v8->_filledSecondsDialView];
    v23 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v10 design:UIFontWeightMedium];
    long long v24 = [v23 CLKFontWithAlternativePunctuation];

    long long v25 = [v24 CLKFontWithMonospacedNumbers];
    long long v26 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(UILabel *)v26 setTextAlignment:1];
    [(UILabel *)v26 setFont:v25];
    timeLabel = v8->_timeLabel;
    v8->_timeLabel = v26;
    objc_super v28 = v26;

    [(NTKDigitalSecondsGraphicCircularView *)v8 addSubview:v8->_timeLabel];
  }

  return v8;
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
  v6 = [v5 metadata];
  double v7 = [v6 objectForKey:@"NTKDigitalSecondsGraphicCircularViewOverrideDateKey"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v8 = self;
    double v9 = v7;
  }
  else
  {
    double v8 = self;
    double v9 = 0;
  }
  [(NTKDigitalSecondsGraphicCircularView *)v8 setOverrideDate:v9];
  unsigned __int8 v10 = objc_msgSend(v5, "tritium_isTritiumInactiveFullColorImageProvider");

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_A200;
  v14[3] = &unk_10540;
  unsigned __int8 v15 = v10;
  CGFloat v11 = objc_retainBlock(v14);
  CGFloat v12 = [(NTKDigitalSecondsGraphicCircularView *)self timeLabel];
  ((void (*)(void *, void *))v11[2])(v11, v12);
  double v13 = [(NTKDigitalSecondsGraphicCircularView *)self filledSecondsDialView];
  ((void (*)(void *, void *))v11[2])(v11, v13);
  [(NTKDigitalSecondsGraphicCircularView *)self _updateProgress];
}

+ (BOOL)tritium_wantsCrossfadeAnimation
{
  return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v5 = [(NTKDigitalSecondsGraphicCircularView *)self filterProvider];
  v6 = [v5 device];
  int v7 = NTKShowGossamerUI();

  if (v7)
  {
    double v8 = [(NTKDigitalSecondsGraphicCircularView *)self filterProvider];
    id v20 = [v8 colorForView:self accented:1];

    double v9 = +[UIColor systemOrangeColor];
    unsigned __int8 v10 = NTKInterpolateBetweenColors();

    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    CGFloat v11 = [(NTKDigitalSecondsGraphicCircularView *)self unfilledSecondsDialView];
    CGFloat v12 = [v10 colorWithAlphaComponent:self->_inactiveTickAccentAlpha];
    [v11 setTickColor:v12];

    double v13 = [(NTKDigitalSecondsGraphicCircularView *)self filledSecondsDialView];
    v14 = [v10 colorWithAlphaComponent:self->_activeTickAccentAlpha];
    [v13 setTickColor:v14];

    +[CATransaction commit];
    unsigned __int8 v15 = [(NTKDigitalSecondsGraphicCircularView *)self filterProvider];
    uint64_t v16 = [v15 colorForView:self accented:0];

    [(UILabel *)self->_timeLabel setTextColor:v16];
  }
  else
  {
    id v17 = [(id)objc_opt_class() _filterStyle];
    id v18 = [(NTKDigitalSecondsGraphicCircularView *)self filterProvider];
    id v20 = [v18 filtersForView:self style:v17 fraction:a3];

    id v19 = v20;
    if (!v20) {
      goto LABEL_6;
    }
    unsigned __int8 v10 = [(NTKDigitalSecondsGraphicCircularView *)self filledSecondsDialView];
    uint64_t v16 = [v10 layer];
    [v16 setFilters:v20];
  }

  id v19 = v20;
LABEL_6:
}

- (void)updateMonochromeColor
{
  v3 = [(NTKDigitalSecondsGraphicCircularView *)self filterProvider];
  id v4 = [v3 device];
  int v5 = NTKShowGossamerUI();

  if (v5)
  {
    v6 = [(NTKDigitalSecondsGraphicCircularView *)self filterProvider];
    id v17 = [v6 colorForView:self accented:1];

    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    int v7 = [(NTKDigitalSecondsGraphicCircularView *)self unfilledSecondsDialView];
    double v8 = [v17 colorWithAlphaComponent:self->_inactiveTickAccentAlpha];
    [v7 setTickColor:v8];

    double v9 = [(NTKDigitalSecondsGraphicCircularView *)self filledSecondsDialView];
    unsigned __int8 v10 = [v17 colorWithAlphaComponent:self->_activeTickAccentAlpha];
    [v9 setTickColor:v10];

    +[CATransaction commit];
    CGFloat v11 = [(NTKDigitalSecondsGraphicCircularView *)self filterProvider];
    CGFloat v12 = [v11 colorForView:self accented:0];

    [(UILabel *)self->_timeLabel setTextColor:v12];
  }
  else
  {
    id v13 = [(id)objc_opt_class() _filterStyle];
    v14 = [(NTKDigitalSecondsGraphicCircularView *)self filterProvider];
    id v17 = [v14 filtersForView:self style:v13];

    unsigned __int8 v15 = v17;
    if (!v17) {
      goto LABEL_6;
    }
    CGFloat v12 = [(NTKDigitalSecondsGraphicCircularView *)self filledSecondsDialView];
    uint64_t v16 = [v12 layer];
    [v16 setFilters:v17];
  }
  unsigned __int8 v15 = v17;
LABEL_6:
}

+ ($58D15C9700E10FDF418FBC0C790388C2)_layoutConstantsForDevice:(SEL)a3
{
  sub_A678(a4);
  return result;
}

+ (int64_t)_filterStyle
{
  return 2;
}

- (void)_startClockUpdates
{
  v3 = [(NTKDigitalSecondsGraphicCircularView *)self clockTimerToken];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = +[CLKClockTimer sharedInstance];
    int v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    int v7 = sub_A8B8;
    double v8 = &unk_104B8;
    objc_copyWeak(&v9, &location);
    v3 = [v4 startUpdatesWithUpdateFrequency:1 withHandler:&v5 identificationLog:&stru_105B0];

    -[NTKDigitalSecondsGraphicCircularView setClockTimerToken:](self, "setClockTimerToken:", v3, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopClockUpdates
{
  id v4 = [(NTKDigitalSecondsGraphicCircularView *)self clockTimerToken];
  if (v4)
  {
    v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:v4];

    [(NTKDigitalSecondsGraphicCircularView *)self setClockTimerToken:0];
  }
}

- (void)_updateProgress
{
  v3 = [(NTKDigitalSecondsGraphicCircularView *)self overrideDate];
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
  int v7 = +[NSCalendar currentCalendar];
  uint64_t v8 = (uint64_t)[v7 component:128 fromDate:v6];
  float v9 = (float)(v8 % 60) / 60.0;
  unsigned __int8 v10 = [(NTKDigitalSecondsGraphicCircularView *)self timeLabel];
  CGFloat v11 = +[NSNumber numberWithInteger:v8];
  CGFloat v12 = +[NSNumberFormatter localizedStringFromNumber:v11 numberStyle:0];

  id v13 = [(NTKDigitalSecondsGraphicCircularView *)self filledSecondsDialView];
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:0.0];
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_ABA4;
  id v20 = &unk_10588;
  float v24 = v9;
  id v21 = v13;
  id v22 = v10;
  id v23 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v13;
  +[UIView performWithoutAnimation:&v17];
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

- (UILabel)timeLabel
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
  self->_layoutConstants.secondsTickSize.double width = v3;
  self->_layoutConstants.secondsTickSize.double height = v4;
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