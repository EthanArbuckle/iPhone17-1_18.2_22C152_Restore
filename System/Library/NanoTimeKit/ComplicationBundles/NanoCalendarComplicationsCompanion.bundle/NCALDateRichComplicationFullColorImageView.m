@interface NCALDateRichComplicationFullColorImageView
- (BOOL)displayLunarDate;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSDate)overrideDate;
- (id)_newLabelSubviewWithFont:(id)a3;
- (id)bodyTextProviderWithDate:(id)a3;
- (id)headerTextProviderWithDate:(id)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)initFullColorImageViewWithDevice:(id)a3 family:(int64_t)a4;
- (void)_commonInit;
- (void)_timeChanged:(id)a3;
- (void)_updateDate;
- (void)_updateFilters;
- (void)_updateFiltersShouldUseFraction:(BOOL)a3 fraction:(double)a4;
- (void)_updateFiltersWithFraction:(double)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)updateMonochromeFiltersWithAccentFilters:(id)a3 noAccentFilters:(id)a4;
@end

@implementation NCALDateRichComplicationFullColorImageView

- (id)initFullColorImageViewWithDevice:(id)a3 family:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCALDateRichComplicationFullColorImageView;
  v8 = [(NCALDateRichComplicationFullColorImageView *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_family = a4;
    [(NCALDateRichComplicationFullColorImageView *)v9 _commonInit];
  }

  return v9;
}

- (BOOL)displayLunarDate
{
  return 0;
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return [(NCALDateRichComplicationFullColorImageView *)self initFullColorImageViewWithDevice:a3 family:10];
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  v5 = [a3 metadata];
  id v8 = [v5 objectForKeyedSubscript:NCALDateComplicationOverrideMetadataKey];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v8;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    id v7 = 0;
  }
  [(NCALDateRichComplicationFullColorImageView *)self setOverrideDate:v7];
LABEL_5:
}

- (void)_commonInit
{
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  sub_90E4(self->_device, self->_family, (uint64_t)&v15);
  uint64_t v3 = UIFontSystemFontDesignRounded;
  +[CLKFont systemFontOfSize:weight:design:](CLKFont, "systemFontOfSize:weight:design:", UIFontSystemFontDesignRounded, v15);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(NCALDateRichComplicationFullColorImageView *)self _newLabelSubviewWithFont:v14];
  weekdayLabel = self->_weekdayLabel;
  self->_weekdayLabel = v4;

  [(CLKUIColoringLabel *)self->_weekdayLabel setUppercase:1];
  v6 = +[UIColor systemRedColor];
  [(CLKUIColoringLabel *)self->_weekdayLabel setColor:v6];

  id v7 = +[CLKFont systemFontOfSize:weight:design:](CLKFont, "systemFontOfSize:weight:design:", v3, v16);
  id v8 = [(NCALDateRichComplicationFullColorImageView *)self _newLabelSubviewWithFont:v7];
  dayLabel = self->_dayLabel;
  self->_dayLabel = v8;

  v10 = +[UIColor whiteColor];
  [(CLKUIColoringLabel *)self->_dayLabel setColor:v10];

  [(NCALDateRichComplicationFullColorImageView *)self _updateDate];
  objc_super v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_timeChanged:" name:UIApplicationSignificantTimeChangeNotification object:0];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_timeChanged:" name:CUIKPreferencesNotification_OverlayCalendarID object:0];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_timeChanged:" name:NTKLunarCalendarIDChangedNotification object:0];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NTKLunarCalendarIDChangedNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:NSCalendarDayChangedNotification object:0];

  v6.receiver = self;
  v6.super_class = (Class)NCALDateRichComplicationFullColorImageView;
  [(NCALDateRichComplicationFullColorImageView *)&v6 dealloc];
}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CLKUIColoringLabel);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_94C8;
  v10[3] = &unk_20AE0;
  objc_copyWeak(&v11, &location);
  [v5 setNowProvider:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9538;
  v8[3] = &unk_20B08;
  objc_copyWeak(&v9, &location);
  [v5 setNeedsResizeHandler:v8];
  [v5 setFont:v4];
  sub_90E4(self->_device, self->_family, (uint64_t)v7);
  [v5 setMaxWidth:v7[6]];
  [(NCALDateRichComplicationFullColorImageView *)self addSubview:v5];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)NCALDateRichComplicationFullColorImageView;
  [(NCALDateRichComplicationFullColorImageView *)&v34 layoutSubviews];
  uint64_t v33 = 0;
  long long v32 = 0u;
  memset(v31, 0, sizeof(v31));
  sub_90E4(self->_device, self->_family, (uint64_t)v31);
  [(NCALDateRichComplicationFullColorImageView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CLKUIColoringLabel *)self->_weekdayLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_weekdayLabel frame];
  CLKRectCenteredXInRectForDevice();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = *(double *)&v32;
  [(CLKUIColoringLabel *)self->_weekdayLabel _lastLineBaseline];
  -[CLKUIColoringLabel setFrame:](self->_weekdayLabel, "setFrame:", v12, v17 - v18, v14, v16);
  [(CLKUIColoringLabel *)self->_dayLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_dayLabel frame];
  CLKRectCenteredXInRectForDevice();
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = v17 + *((double *)&v32 + 1);
  [(CLKUIColoringLabel *)self->_dayLabel _lastLineBaseline];
  -[CLKUIColoringLabel setFrame:](self->_dayLabel, "setFrame:", v20, v25 - v26, v22, v24);
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  double Width = CGRectGetWidth(v35);
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  double Height = CGRectGetHeight(v36);
  if (Width < Height) {
    double Height = Width;
  }
  double v29 = Height * 0.5;
  v30 = [(NCALDateRichComplicationFullColorImageView *)self layer];
  [v30 setCornerRadius:v29];
}

- (void)_timeChanged:(id)a3
{
  id v4 = a3;
  double v5 = ncs_log_complication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CGFloat v6 = [v4 name];
    *(_DWORD *)buf = 136315394;
    double v9 = "-[NCALDateRichComplicationFullColorImageView _timeChanged:]";
    __int16 v10 = 2112;
    double v11 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s - Received %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9880;
  block[3] = &unk_20B30;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateDate
{
  double v3 = [(NCALDateRichComplicationFullColorImageView *)self overrideDate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[CLKDate complicationDate];
  }
  id v8 = v5;

  CGFloat v6 = [(NCALDateRichComplicationFullColorImageView *)self headerTextProviderWithDate:v8];
  [(CLKUIColoringLabel *)self->_weekdayLabel setTextProvider:v6];

  double v7 = [(NCALDateRichComplicationFullColorImageView *)self bodyTextProviderWithDate:v8];
  [(CLKUIColoringLabel *)self->_dayLabel setTextProvider:v7];

  [(NCALDateRichComplicationFullColorImageView *)self setNeedsLayout];
}

- (id)headerTextProviderWithDate:(id)a3
{
  id v4 = a3;
  if ([(NCALDateRichComplicationFullColorImageView *)self displayLunarDate]) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 512;
  }
  CGFloat v6 = +[CLKDateTextProvider textProviderWithDate:v4 units:v5];

  if ([(NCALDateRichComplicationFullColorImageView *)self displayLunarDate])
  {
    double v7 = OverlayCalendarLocaleID();
    [v6 setAlternateCalendarLocaleID:v7];
  }
  else
  {
    [v6 setAlternateCalendarLocaleID:0];
  }
  [v6 setShortUnits:1];

  return v6;
}

- (id)bodyTextProviderWithDate:(id)a3
{
  id v4 = +[CLKDateTextProvider textProviderWithDate:a3 units:16];
  [v4 setShortUnits:1];
  objc_msgSend(v4, "setAllowsNarrowUnits:", -[NCALDateRichComplicationFullColorImageView displayLunarDate](self, "displayLunarDate") ^ 1);
  if ([(NCALDateRichComplicationFullColorImageView *)self displayLunarDate])
  {
    uint64_t v5 = OverlayCalendarLocaleID();
    [v4 setAlternateCalendarLocaleID:v5];
  }
  else
  {
    [v4 setAlternateCalendarLocaleID:0];
  }

  return v4;
}

- (void)setOverrideDate:(id)a3
{
  id v5 = a3;
  if ((NTKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    [(NCALDateRichComplicationFullColorImageView *)self _updateDate];
  }
}

- (void)_updateFilters
{
}

- (void)_updateFiltersWithFraction:(double)a3
{
}

- (void)_updateFiltersShouldUseFraction:(BOOL)a3 fraction:(double)a4
{
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  id v8 = WeakRetained;
  if (v5)
  {
    id v10 = [WeakRetained filtersForView:self style:2 fraction:a4];
    [v8 filtersForView:self style:0 fraction:a4];
  }
  else
  {
    id v10 = [WeakRetained filtersForView:self style:2];
    [v8 filtersForView:self style:0];
  double v9 = };
  [(NCALDateRichComplicationFullColorImageView *)self updateMonochromeFiltersWithAccentFilters:v10 noAccentFilters:v9];
}

- (void)updateMonochromeFiltersWithAccentFilters:(id)a3 noAccentFilters:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    double v7 = [(CLKUIColoringLabel *)self->_weekdayLabel layer];
    [v7 setFilters:v9];
  }
  if (v6)
  {
    id v8 = [(CLKUIColoringLabel *)self->_dayLabel layer];
    [v8 setFilters:v6];
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end