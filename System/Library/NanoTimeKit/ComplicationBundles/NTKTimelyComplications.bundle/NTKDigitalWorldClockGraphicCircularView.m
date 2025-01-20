@interface NTKDigitalWorldClockGraphicCircularView
+ ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstantsForDevice:(SEL)a3;
+ (BOOL)_shouldUseDaytimeColoringForTransitInfo:(id)a3 atDate:(id)a4;
+ (void)initialize;
- ($8502DCEA08BBBE1AB2005217B3838BBD)layoutConstants;
- (ALCity)city;
- (BOOL)isSunUp;
- (CLKClockTimerToken)clockTimerToken;
- (CLKMonochromeFilterProvider)filterProvider;
- (CLKUIColoringLabel)timeLabel;
- (NSDate)overrideDate;
- (UIImageView)moonImageView;
- (UIImageView)sunImageView;
- (UILabel)cityLabel;
- (id)_cityLabelColor;
- (id)_complicationBackgroundColor;
- (id)_timeTextColor;
- (id)_transitInfoForDate:(id)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_updateColors;
- (void)_updateDayTimeColoring;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)pauseLiveFullColorImageView;
- (void)resumeLiveFullColorImageView;
- (void)setCity:(id)a3;
- (void)setCityLabel:(id)a3;
- (void)setClockTimerToken:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setIsSunUp:(BOOL)a3;
- (void)setLayoutConstants:(id *)a3;
- (void)setMoonImageView:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setSunImageView:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKDigitalWorldClockGraphicCircularView

+ (void)initialize
{
  if (qword_18070 != -1) {
    dispatch_once(&qword_18070, &stru_10468);
  }
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)NTKDigitalWorldClockGraphicCircularView;
  [(NTKDigitalWorldClockGraphicCircularView *)&v29 layoutSubviews];
  [(NTKDigitalWorldClockGraphicCircularView *)self bounds];
  double Width = CGRectGetWidth(v30);
  [(NTKDigitalWorldClockGraphicCircularView *)self bounds];
  double Height = CGRectGetHeight(v31);
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = Width;
  v32.size.height = Height;
  double v5 = CGRectGetWidth(v32);
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = Width;
  v33.size.height = Height;
  double v6 = CGRectGetHeight(v33);
  if (v5 < v6) {
    double v6 = v5;
  }
  double v7 = v6 * 0.5;
  v8 = [(NTKDigitalWorldClockGraphicCircularView *)self layer];
  [v8 setCornerRadius:v7];
  double timeLabelBottom = self->_layoutConstants.timeLabelBottom;
  double cityLabelBottom = self->_layoutConstants.cityLabelBottom;
  v34.origin.x = 0.0;
  v34.origin.y = 0.0;
  v34.size.width = Width;
  v34.size.height = Height;
  double v11 = CGRectGetWidth(v34);
  v12 = [(NTKDigitalWorldClockGraphicCircularView *)self timeLabel];
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, Width, Height);
  [v12 sizeToFit];
  [v12 frame];
  double v14 = v13;
  double v15 = (Width - v11) * 0.5;
  v16 = [v12 font];
  [v16 ascender];
  *(float *)&double v17 = timeLabelBottom - v17;
  double v18 = ceilf(*(float *)&v17);

  objc_msgSend(v12, "setFrame:", v15, v18, v11, v14);
  v19 = [(NTKDigitalWorldClockGraphicCircularView *)self cityLabel];
  [v19 sizeToFit];
  [v19 frame];
  double v21 = v20;
  v22 = [v19 font];
  [v22 ascender];
  *(float *)&double v23 = cityLabelBottom - v23;
  double v24 = ceilf(*(float *)&v23);

  objc_msgSend(v19, "setFrame:", v15, v24, v11, v21);
  [(NTKDigitalWorldClockGraphicCircularView *)self layoutConstants];
  v35.origin.x = 0.0;
  v35.origin.y = 0.0;
  v35.size.width = Width;
  v35.size.height = Height;
  double MidX = CGRectGetMidX(v35);
  v26 = [(NTKDigitalWorldClockGraphicCircularView *)self sunImageView];
  objc_msgSend(v26, "setCenter:", MidX, 0.0);
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = Width;
  v36.size.height = Height;
  double v27 = CGRectGetMidX(v36);
  v28 = [(NTKDigitalWorldClockGraphicCircularView *)self moonImageView];
  objc_msgSend(v28, "setCenter:", v27, 0.0);
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NTKDigitalWorldClockGraphicCircularView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[NTKDigitalWorldClockGraphicCircularView initWithFrame:](&v40, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v9 = objc_opt_class();
    if (v9)
    {
      [v9 _layoutConstantsForDevice:v4];
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
    }
    long long v10 = v39;
    long long v12 = v36;
    long long v11 = v37;
    *(_OWORD *)(v8 + 120) = v38;
    *(_OWORD *)(v8 + 136) = v10;
    *(_OWORD *)(v8 + 88) = v12;
    *(_OWORD *)(v8 + 104) = v11;
    char v13 = NTKShowGossamerUI();
    v8[16] = v13;
    if ((v13 & 1) == 0) {
      [v8 setBackgroundColor:qword_18068];
    }
    double v14 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:*(double *)&v36 design:UIFontWeightSemibold];
    uint64_t v15 = [v14 CLKFontWithAlternativePunctuation];

    id v16 = objc_msgSend(objc_alloc((Class)CLKUIColoringLabel), "initWithFrame:options:", 4, CGRectZero.origin.x, y, width, height);
    [v16 setFont:v15];
    [v16 setTextAlignment:1];
    [v16 setFont:v15];
    double v17 = +[UIColor whiteColor];
    [v16 setColor:v17];

    double v18 = +[UIColor whiteColor];
    [v16 setTextColor:v18];

    objc_initWeak(&location, v8);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_6470;
    v33[3] = &unk_10490;
    objc_copyWeak(&v34, &location);
    [v16 setNowProvider:v33];
    objc_storeStrong((id *)v8 + 6, v16);
    [v8 addSubview:*((void *)v8 + 6)];
    v19 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:*(double *)&v37 design:UIFontWeightSemibold];
    double v20 = [v19 CLKFontWithAlternativePunctuation];
    CGRect v32 = (void *)v15;

    id v21 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [v21 setTextAlignment:1];
    [v21 setFont:v20];
    v22 = +[UIColor systemOrangeColor];
    [v21 setTextColor:v22];

    objc_storeStrong((id *)v8 + 7, v21);
    [v8 addSubview:*((void *)v8 + 7)];
    double v23 = +[UIImage systemImageNamed:@"sun.max.fill"];
    id v24 = [objc_alloc((Class)UIImageView) initWithImage:v23];
    [v24 setContentMode:1];
    objc_msgSend(v24, "setFrame:", 0.0, 0.0, *(double *)&v38, *(double *)&v38);
    v25 = +[UIColor systemYellowColor];
    [v24 setTintColor:v25];

    v26 = [v24 layer];
    objc_msgSend(v26, "setAnchorPoint:", 0.5, 0.0);

    [v24 setHidden:1];
    objc_storeStrong((id *)v8 + 9, v24);
    [v8 addSubview:*((void *)v8 + 9)];
    double v27 = +[UIImage systemImageNamed:@"moon.fill"];
    id v28 = [objc_alloc((Class)UIImageView) initWithImage:v27];
    [v28 setContentMode:1];
    objc_msgSend(v28, "setFrame:", 0.0, 0.0, *((double *)&v38 + 1), *((double *)&v38 + 1));
    objc_super v29 = +[UIColor systemTealColor];
    [v28 setTintColor:v29];

    CGRect v30 = [v28 layer];
    objc_msgSend(v30, "setAnchorPoint:", 0.5, 0.0);

    objc_storeStrong((id *)v8 + 10, v28);
    [v8 addSubview:*((void *)v8 + 10)];
    [v8 _updateColors];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
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
  double v5 = [a3 metadata];
  double v6 = [v5 objectForKey:@"NTKDigitalWorldClockGraphicCircularViewOverrideDateKey"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v7 = self;
    v8 = v6;
  }
  else
  {
    double v7 = self;
    v8 = 0;
  }
  [(NTKDigitalWorldClockGraphicCircularView *)v7 setOverrideDate:v8];
  v9 = [v5 objectForKey:@"NTKDigitalWorldClockGraphicCircularViewCityKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v10 = self;
    long long v11 = v9;
  }
  else
  {
    long long v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_B034((uint64_t)self, v5, v12);
    }

    long long v10 = self;
    long long v11 = 0;
  }
  [(NTKDigitalWorldClockGraphicCircularView *)v10 setCity:v11];
  char v13 = [(NTKDigitalWorldClockGraphicCircularView *)self timeLabel];
  double v14 = [v5 objectForKey:@"NTKDigitalWorldClockGraphicCircularViewTimeTextProviderKey"];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v13 setTextProvider:v14];
  }
  else
  {
    uint64_t v15 = +[CLKSimpleTextProvider textProviderWithText:&stru_10610];
    [v13 setTextProvider:v15];
  }
  id v16 = [(NTKDigitalWorldClockGraphicCircularView *)self cityLabel];
  double v17 = [v5 objectForKey:@"NTKDigitalWorldClockGraphicCircularViewCityNameKey"];
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v18 = v16;
    v19 = v17;
  }
  else
  {
    double v18 = v16;
    v19 = 0;
  }
  [v18 setText:v19];
  [(NTKDigitalWorldClockGraphicCircularView *)self _updateDayTimeColoring];
  [(NTKDigitalWorldClockGraphicCircularView *)self setNeedsLayout];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  double v5 = [(NTKDigitalWorldClockGraphicCircularView *)self filterProvider];
  id v16 = [v5 filtersForView:self style:2 fraction:a3];

  double v6 = [(NTKDigitalWorldClockGraphicCircularView *)self cityLabel];
  double v7 = [v6 layer];
  [v7 setFilters:v16];
  v8 = [(NTKDigitalWorldClockGraphicCircularView *)self sunImageView];
  v9 = [v8 layer];
  [v9 setFilters:v16];
  long long v10 = [(NTKDigitalWorldClockGraphicCircularView *)self moonImageView];
  long long v11 = [v10 layer];
  [v11 setFilters:v16];
  long long v12 = [(NTKDigitalWorldClockGraphicCircularView *)self filterProvider];
  char v13 = [v12 filtersForView:self style:0 fraction:a3];

  double v14 = [(NTKDigitalWorldClockGraphicCircularView *)self timeLabel];
  uint64_t v15 = [v14 layer];
  [v15 setFilters:v13];
}

- (void)updateMonochromeColor
{
  v3 = [(NTKDigitalWorldClockGraphicCircularView *)self filterProvider];
  id v14 = [v3 filtersForView:self style:2];

  id v4 = [(NTKDigitalWorldClockGraphicCircularView *)self cityLabel];
  double v5 = [v4 layer];
  [v5 setFilters:v14];
  double v6 = [(NTKDigitalWorldClockGraphicCircularView *)self sunImageView];
  double v7 = [v6 layer];
  [v7 setFilters:v14];
  v8 = [(NTKDigitalWorldClockGraphicCircularView *)self moonImageView];
  v9 = [v8 layer];
  [v9 setFilters:v14];
  long long v10 = [(NTKDigitalWorldClockGraphicCircularView *)self filterProvider];
  long long v11 = [v10 filtersForView:self style:0];

  long long v12 = [(NTKDigitalWorldClockGraphicCircularView *)self timeLabel];
  char v13 = [v12 layer];
  [v13 setFilters:v11];
}

+ ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstantsForDevice:(SEL)a3
{
  sub_69F8(a4, retstr);
  return result;
}

+ (BOOL)_shouldUseDaytimeColoringForTransitInfo:(id)a3 atDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 rise];
  if (v7)
  {
  }
  else
  {
    v8 = [v5 set];

    if (!v8)
    {
      BOOL v16 = [v5 constantSun] == (char *)&dword_0 + 2;
LABEL_14:
      char v20 = v16;
      goto LABEL_17;
    }
  }
  uint64_t v9 = [v5 rise];
  if (v9)
  {
    long long v10 = (void *)v9;
    long long v11 = [v5 set];

    if (v11)
    {
      long long v12 = [v5 rise];
      id v13 = [v6 compare:v12];

      id v14 = [v5 set];
      uint64_t v15 = (char *)[v6 compare:v14];

      BOOL v16 = (unint64_t)v13 < 2 && v15 + 1 == 0;
      goto LABEL_14;
    }
  }
  double v17 = [v5 rise];

  if (v17)
  {
    double v18 = [v5 rise];
    id v19 = [v6 compare:v18];

    char v20 = (unint64_t)v19 < 2;
    goto LABEL_17;
  }
  id v21 = [v5 set];

  if (v21)
  {
    v22 = [v5 set];
    double v23 = (char *)[v6 compare:v22];

    BOOL v16 = v23 + 1 == 0;
    goto LABEL_14;
  }
  v25 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_B11C(v25);
  }

  char v20 = 1;
LABEL_17:

  return v20;
}

- (void)_startClockUpdates
{
  v3 = [(NTKDigitalWorldClockGraphicCircularView *)self clockTimerToken];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = +[CLKClockTimer sharedInstance];
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    double v7 = sub_6E04;
    v8 = &unk_104B8;
    objc_copyWeak(&v9, &location);
    v3 = [v4 startUpdatesWithUpdateFrequency:1 withHandler:&v5 identificationLog:&stru_104F8];

    -[NTKDigitalWorldClockGraphicCircularView setClockTimerToken:](self, "setClockTimerToken:", v3, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopClockUpdates
{
  id v4 = [(NTKDigitalWorldClockGraphicCircularView *)self clockTimerToken];
  if (v4)
  {
    v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:v4];

    [(NTKDigitalWorldClockGraphicCircularView *)self setClockTimerToken:0];
  }
}

- (void)_updateDayTimeColoring
{
  v3 = [(NTKDigitalWorldClockGraphicCircularView *)self overrideDate];
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
  double v7 = [(NTKDigitalWorldClockGraphicCircularView *)self _transitInfoForDate:v5];
  id v8 = [(id)objc_opt_class() _shouldUseDaytimeColoringForTransitInfo:v7 atDate:v6];
  if (v8 != [(NTKDigitalWorldClockGraphicCircularView *)self isSunUp])
  {
    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = objc_opt_class();
      CFStringRef v11 = @"nighttime";
      if (v8) {
        CFStringRef v11 = @"daytime";
      }
      int v15 = 138543618;
      BOOL v16 = v10;
      __int16 v17 = 2114;
      CFStringRef v18 = v11;
      id v12 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%{public}@ Switch to %{public}@.", (uint8_t *)&v15, 0x16u);
    }
    [(NTKDigitalWorldClockGraphicCircularView *)self setIsSunUp:v8];
    id v13 = [(NTKDigitalWorldClockGraphicCircularView *)self sunImageView];
    [v13 setHidden:v8 ^ 1];
    id v14 = [(NTKDigitalWorldClockGraphicCircularView *)self moonImageView];
    [v14 setHidden:v8];
  }
}

- (void)_updateColors
{
  if (!self->_showGossamerUI)
  {
    v3 = [(NTKDigitalWorldClockGraphicCircularView *)self _complicationBackgroundColor];
    [(NTKDigitalWorldClockGraphicCircularView *)self setBackgroundColor:v3];
  }
  id v7 = [(NTKDigitalWorldClockGraphicCircularView *)self _timeTextColor];
  id v4 = [(NTKDigitalWorldClockGraphicCircularView *)self timeLabel];
  [v4 setColor:v7];
  [v4 setTextColor:v7];
  id v5 = [(NTKDigitalWorldClockGraphicCircularView *)self _cityLabelColor];
  uint64_t v6 = [(NTKDigitalWorldClockGraphicCircularView *)self cityLabel];
  [v6 setTextColor:v5];
}

- (id)_complicationBackgroundColor
{
  return (id)qword_18068;
}

- (id)_timeTextColor
{
  return +[UIColor whiteColor];
}

- (id)_cityLabelColor
{
  return +[UIColor systemOrangeColor];
}

- (id)_transitInfoForDate:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKDigitalWorldClockGraphicCircularView *)self city];
  if (v5)
  {
    p_transitInfo = &self->_transitInfo;
    id v7 = self->_transitInfo;
    if (([(CLKUIAlmanacTransitInfo *)v7 isDateWithinTransitInfo:v4] & 1) == 0)
    {
      id v8 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 138543362;
        id v14 = (id)objc_opt_class();
        id v9 = v14;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@ Calculate updated CLKUIAlmanacTransitInfo.", (uint8_t *)&v13, 0xCu);
      }
      long long v10 = [(NTKDigitalWorldClockGraphicCircularView *)self city];
      CFStringRef v11 = +[CLKUIAlmanacTransitInfo transitInfoForDate:v4 city:v10];

      objc_storeStrong((id *)p_transitInfo, v11);
      id v7 = (CLKUIAlmanacTransitInfo *)v11;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (ALCity)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (CLKUIColoringLabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (UILabel)cityLabel
{
  return self->_cityLabel;
}

- (void)setCityLabel:(id)a3
{
}

- (BOOL)isSunUp
{
  return self->_isSunUp;
}

- (void)setIsSunUp:(BOOL)a3
{
  self->_isSunUp = a3;
}

- (CLKClockTimerToken)clockTimerToken
{
  return self->_clockTimerToken;
}

- (void)setClockTimerToken:(id)a3
{
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)layoutConstants
{
  long long v3 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var2 = v3;
  long long v4 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var7;
  *(_OWORD *)&retstr->var6 = v4;
  return self;
}

- (void)setLayoutConstants:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var6;
  long long v5 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_layoutConstants.sunGlyphLength = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_layoutConstants.sunGlyphPadding = v3;
  *(_OWORD *)&self->_layoutConstants.timeFontSize = v5;
  *(_OWORD *)&self->_layoutConstants.cityFontSize = v4;
}

- (UIImageView)sunImageView
{
  return self->_sunImageView;
}

- (void)setSunImageView:(id)a3
{
}

- (UIImageView)moonImageView
{
  return self->_moonImageView;
}

- (void)setMoonImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moonImageView, 0);
  objc_storeStrong((id *)&self->_sunImageView, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_cityLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_destroyWeak((id *)&self->_filterProvider);

  objc_storeStrong((id *)&self->_transitInfo, 0);
}

@end