@interface NCALDateRichComplicationCornerView
- (NCALDateRichComplicationCornerView)init;
- (id)_createAndAddColoringLabelWithFontSize:(double)a3 dayOffset:(int64_t)a4;
- (id)_createAndAddLabelPlatterWithAngularWidth:(double)a3 color:(id)a4;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_timeChanged:(id)a3;
- (void)_updateDate;
- (void)_updateFilters;
- (void)_updateFiltersShouldUseFraction:(BOOL)a3 fraction:(double)a4;
- (void)_updateFiltersWithFraction:(double)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
- (void)updateMonochromeFiltersWithAccentFilters:(id)a3 noAccentFilters:(id)a4;
@end

@implementation NCALDateRichComplicationCornerView

- (NCALDateRichComplicationCornerView)init
{
  v30.receiver = self;
  v30.super_class = (Class)NCALDateRichComplicationCornerView;
  v2 = [(NCALDateRichComplicationCornerView *)&v30 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v29 = 0;
    memset(v28, 0, sizeof(v28));
    v4 = [(NCALDateRichComplicationCornerView *)v2 device];
    sub_12270(v4, (uint64_t)v28);

    v5 = +[UIColor colorWithWhite:0.2 alpha:1.0];
    CLKDegreesToRadians();
    double v7 = v6;
    uint64_t v8 = -[NCALDateRichComplicationCornerView _createAndAddLabelPlatterWithAngularWidth:color:](v3, "_createAndAddLabelPlatterWithAngularWidth:color:", v5);
    previousDatePlatter = v3->_previousDatePlatter;
    v3->_previousDatePlatter = (CDCurvedRoundedRectShapeLayer *)v8;

    v10 = +[UIColor systemRedColor];
    uint64_t v11 = [(NCALDateRichComplicationCornerView *)v3 _createAndAddLabelPlatterWithAngularWidth:v10 color:v7];
    datePlatter = v3->_datePlatter;
    v3->_datePlatter = (CDCurvedRoundedRectShapeLayer *)v11;

    uint64_t v13 = [(NCALDateRichComplicationCornerView *)v3 _createAndAddLabelPlatterWithAngularWidth:v5 color:v7];
    nextDatePlatter = v3->_nextDatePlatter;
    v3->_nextDatePlatter = (CDCurvedRoundedRectShapeLayer *)v13;

    uint64_t v15 = [(NCALDateRichComplicationCornerView *)v3 _createAndAddColoringLabelWithFontSize:0 dayOffset:*(double *)v28];
    weekdayLabel = v3->_weekdayLabel;
    v3->_weekdayLabel = (CLKUICurvedColoringLabel *)v15;

    double v17 = *((double *)v28 + 1);
    uint64_t v18 = [(NCALDateRichComplicationCornerView *)v3 _createAndAddColoringLabelWithFontSize:-1 dayOffset:*((double *)v28 + 1)];
    previousDateLabel = v3->_previousDateLabel;
    v3->_previousDateLabel = (CLKUICurvedColoringLabel *)v18;

    uint64_t v20 = [(NCALDateRichComplicationCornerView *)v3 _createAndAddColoringLabelWithFontSize:0 dayOffset:v17];
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (CLKUICurvedColoringLabel *)v20;

    v22 = [(CLKUICurvedColoringLabel *)v3->_dateLabel layer];
    [v22 setCompositingFilter:kCAFilterSubtractS];

    uint64_t v23 = [(NCALDateRichComplicationCornerView *)v3 _createAndAddColoringLabelWithFontSize:1 dayOffset:v17];
    nextDateLabel = v3->_nextDateLabel;
    v3->_nextDateLabel = (CLKUICurvedColoringLabel *)v23;

    [(NCALDateRichComplicationCornerView *)v3 _updateDate];
    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v3 selector:"_timeChanged:" name:UIApplicationSignificantTimeChangeNotification object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v3 selector:"_timeChanged:" name:NSCalendarDayChangedNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NCALDateRichComplicationCornerView;
  [(NCALDateRichComplicationCornerView *)&v4 dealloc];
}

- (id)_createAndAddColoringLabelWithFontSize:(double)a3 dayOffset:(int64_t)a4
{
  id v7 = objc_msgSend(objc_alloc((Class)CLKUICurvedColoringLabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v7 setAlpha:1.0];
  uint64_t v8 = +[UIColor whiteColor];
  [v7 setColor:v8];

  v9 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:a3 design:UIFontWeightSemibold];
  [v7 setFont:v9];

  [v7 setInterior:0];
  [v7 setUppercase:1];
  [v7 setUsesLegibility:0];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_12620;
  v16[3] = &unk_20B08;
  objc_copyWeak(&v17, &location);
  [v7 setNeedsResizeHandler:v16];
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_12660;
  v14 = &unk_20C90;
  v15[1] = (id)a4;
  objc_copyWeak(v15, &location);
  [v7 setNowProvider:&v11];
  -[NCALDateRichComplicationCornerView addSubview:](self, "addSubview:", v7, v11, v12, v13, v14);
  objc_destroyWeak(v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v7;
}

- (id)_createAndAddLabelPlatterWithAngularWidth:(double)a3 color:(id)a4
{
  id v6 = a4;
  if (qword_28518 != -1) {
    dispatch_once(&qword_28518, &stru_20CB0);
  }
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  id v7 = [(NCALDateRichComplicationCornerView *)self device];
  sub_12270(v7, (uint64_t)&v18);

  uint64_t v8 = (char *)[(NCALDateRichComplicationCornerView *)self cornerComplicationPosition];
  if ((unint64_t)(v8 - 2) < 2)
  {
    double v9 = *((double *)&v20 + 1);
    double v10 = *((double *)&v19 + 1);
    goto LABEL_7;
  }
  if ((unint64_t)v8 <= 1)
  {
    double v9 = *(double *)&v20;
    double v10 = *(double *)&v19;
LABEL_7:
    double v11 = v9 - *((double *)&v22 + 1);
    double v12 = v10 - *(double *)&v23;
    goto LABEL_8;
  }
  double v12 = 0.0;
  double v11 = 0.0;
LABEL_8:
  id v13 = objc_alloc((Class)CDCurvedRoundedRectShapeLayer);
  id v14 = [v13 initWithAngularWidth:a3 innerRadius:v11 outerRadius:v12 cornerRadius:*((double *)&v23 + 1)];
  [v14 setActions:qword_28510];
  id v15 = v6;
  objc_msgSend(v14, "setFillColor:", objc_msgSend(v15, "CGColor"));
  v16 = [(NCALDateRichComplicationCornerView *)self layer];
  [v16 addSublayer:v14];

  return v14;
}

- (void)layoutSubviews
{
  v59.receiver = self;
  v59.super_class = (Class)NCALDateRichComplicationCornerView;
  [(NCALDateRichComplicationCornerView *)&v59 layoutSubviews];
  unint64_t v3 = (unint64_t)[(NCALDateRichComplicationCornerView *)self cornerComplicationPosition];
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  objc_super v4 = [(NCALDateRichComplicationCornerView *)self device];
  sub_12270(v4, (uint64_t)&v52);

  v5 = self->_weekdayLabel;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_12DBC;
  v42[3] = &unk_20CD8;
  id v6 = v5;
  v43 = v6;
  unint64_t v44 = v3;
  long long v49 = v56;
  long long v50 = v57;
  uint64_t v51 = v58;
  long long v45 = v52;
  long long v46 = v53;
  long long v48 = v55;
  long long v47 = v54;
  [(NCALDateRichComplicationCornerView *)self _enumerateLabelsWithBlock:v42];
  id v7 = [(NCALDateRichComplicationCornerView *)self device];
  [v7 screenBounds];
  double v9 = v8;
  double v11 = v10;

  CLKRectGetCenter();
  double x = v12;
  double y = v14;
  v16 = objc_opt_class();
  id v17 = [(NCALDateRichComplicationCornerView *)self device];
  [v16 viewSizeForDevice:v17];
  double v19 = v18;
  double v21 = v20;

  switch(v3)
  {
    case 0uLL:
      double v22 = *(double *)&v55;
      break;
    case 1uLL:
      double x = x - v9 + v19;
      double v22 = *(double *)&v55;
      break;
    case 2uLL:
      double y = y - v11 + v21;
      double v22 = *(double *)&v55;
      break;
    case 3uLL:
      double x = x - v9 + v19;
      double y = y - v11 + v21;
      double v22 = *(double *)&v55;
      break;
    default:
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      double v22 = *(double *)&v55;
      break;
  }
  [(NCALDateRichComplicationCornerView *)self innerComponentRotationInDegree];
  if ((v3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    double v23 = -1.0;
  }
  else {
    double v23 = 1.0;
  }
  if (NTKLayoutIsRTL()) {
    double v23 = -v23;
  }
  -[CDCurvedRoundedRectShapeLayer setPosition:](self->_previousDatePlatter, "setPosition:", x, y);
  previousDatePlatter = self->_previousDatePlatter;
  double v25 = *((double *)&v55 + 1);
  CLKDegreesToRadians();
  CGAffineTransformMakeRotation(&v41, v26);
  [(CDCurvedRoundedRectShapeLayer *)previousDatePlatter setAffineTransform:&v41];
  -[CDCurvedRoundedRectShapeLayer setPosition:](self->_datePlatter, "setPosition:", x, y);
  datePlatter = self->_datePlatter;
  CLKDegreesToRadians();
  CGAffineTransformMakeRotation(&v40, v28);
  [(CDCurvedRoundedRectShapeLayer *)datePlatter setAffineTransform:&v40];
  -[CDCurvedRoundedRectShapeLayer setPosition:](self->_nextDatePlatter, "setPosition:", x, y);
  nextDatePlatter = self->_nextDatePlatter;
  CLKDegreesToRadians();
  CGAffineTransformMakeRotation(&v39, v30);
  [(CDCurvedRoundedRectShapeLayer *)nextDatePlatter setAffineTransform:&v39];
  weekdayLabel = self->_weekdayLabel;
  [(NCALDateRichComplicationCornerView *)self outerComponentRotationInDegree];
  [(NCALDateRichComplicationCornerView *)self _layoutCurvedLabel:weekdayLabel centerAngleInDegree:v22 editingRotationInDegree:v32];
  previousDateLabel = self->_previousDateLabel;
  [(NCALDateRichComplicationCornerView *)self innerComponentRotationInDegree];
  [(NCALDateRichComplicationCornerView *)self _layoutCurvedLabel:previousDateLabel centerAngleInDegree:v22 + v23 * v25 editingRotationInDegree:v34];
  dateLabel = self->_dateLabel;
  [(NCALDateRichComplicationCornerView *)self innerComponentRotationInDegree];
  [(NCALDateRichComplicationCornerView *)self _layoutCurvedLabel:dateLabel centerAngleInDegree:v22 editingRotationInDegree:v36];
  nextDateLabel = self->_nextDateLabel;
  [(NCALDateRichComplicationCornerView *)self innerComponentRotationInDegree];
  [(NCALDateRichComplicationCornerView *)self _layoutCurvedLabel:nextDateLabel centerAngleInDegree:v22 - v23 * v25 editingRotationInDegree:v38];
}

- (void)_timeChanged:(id)a3
{
  id v4 = a3;
  v5 = ncs_log_complication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 name];
    *(_DWORD *)buf = 136315394;
    double v9 = "-[NCALDateRichComplicationCornerView _timeChanged:]";
    __int16 v10 = 2112;
    double v11 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s - Received %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12FB4;
  block[3] = &unk_20B30;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateDate
{
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    id v4 = overrideDate;
  }
  else
  {
    id v4 = +[CLKDate complicationDate];
  }
  double v14 = v4;
  v5 = +[CLKDateTextProvider textProviderWithDate:v4 units:512];
  [v5 setShortUnits:1];
  [(CLKUICurvedColoringLabel *)self->_weekdayLabel setTextProvider:v5];
  previousDateLabel = self->_previousDateLabel;
  id v7 = NTKAddDaysToDate();
  double v8 = +[CLKDateTextProvider textProviderWithDate:v7 units:16];
  [(CLKUICurvedColoringLabel *)previousDateLabel setTextProvider:v8];

  dateLabel = self->_dateLabel;
  __int16 v10 = +[CLKDateTextProvider textProviderWithDate:v14 units:16];
  [(CLKUICurvedColoringLabel *)dateLabel setTextProvider:v10];

  nextDateLabel = self->_nextDateLabel;
  double v12 = NTKAddDaysToDate();
  id v13 = +[CLKDateTextProvider textProviderWithDate:v12 units:16];
  [(CLKUICurvedColoringLabel *)nextDateLabel setTextProvider:v13];
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  id v4 = (void (**)(id, CLKUICurvedColoringLabel *))((char *)a3 + 16);
  v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_previousDateLabel);
  (*v4)(v6, self->_dateLabel);
  (*v4)(v6, self->_nextDateLabel);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  v5 = [a3 metadata];
  id v6 = [v5 objectForKeyedSubscript:NCALDateComplicationOverrideMetadataKey];
  overrideDate = self->_overrideDate;
  self->_overrideDate = v6;

  [(NCALDateRichComplicationCornerView *)self _updateDate];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NCALDateRichComplicationCornerView _updateFiltersWithFraction:](self, "_updateFiltersWithFraction:");
  previousDatePlatter = self->_previousDatePlatter;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v5 = v5;
  [(CDCurvedRoundedRectShapeLayer *)previousDatePlatter setOpacity:v5];
  nextDatePlatter = self->_nextDatePlatter;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v7 = v7;

  [(CDCurvedRoundedRectShapeLayer *)nextDatePlatter setOpacity:v7];
}

- (void)updateMonochromeColor
{
  [(NCALDateRichComplicationCornerView *)self _updateFilters];
  LODWORD(v3) = 1051931443;
  [(CDCurvedRoundedRectShapeLayer *)self->_previousDatePlatter setOpacity:v3];
  nextDatePlatter = self->_nextDatePlatter;
  LODWORD(v5) = 1051931443;

  [(CDCurvedRoundedRectShapeLayer *)nextDatePlatter setOpacity:v5];
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
  double v7 = [(NCALDateRichComplicationCornerView *)self filterProvider];
  double v8 = v7;
  if (v5)
  {
    id v11 = [v7 filtersForView:self style:2 fraction:a4];

    double v9 = [(NCALDateRichComplicationCornerView *)self filterProvider];
    [v9 filtersForView:self style:0 fraction:a4];
  }
  else
  {
    id v11 = [v7 filtersForView:self style:2];

    double v9 = [(NCALDateRichComplicationCornerView *)self filterProvider];
    [v9 filtersForView:self style:0];
  __int16 v10 = };

  [(NCALDateRichComplicationCornerView *)self updateMonochromeFiltersWithAccentFilters:v11 noAccentFilters:v10];
}

- (void)updateMonochromeFiltersWithAccentFilters:(id)a3 noAccentFilters:(id)a4
{
  previousDatePlatter = self->_previousDatePlatter;
  id v7 = a4;
  id v8 = a3;
  [(CDCurvedRoundedRectShapeLayer *)previousDatePlatter setFilters:v8];
  [(CDCurvedRoundedRectShapeLayer *)self->_nextDatePlatter setFilters:v8];
  double v9 = [(CLKUICurvedColoringLabel *)self->_previousDateLabel layer];
  [v9 setFilters:v8];

  __int16 v10 = [(CLKUICurvedColoringLabel *)self->_nextDateLabel layer];
  [v10 setFilters:v8];

  [(CDCurvedRoundedRectShapeLayer *)self->_datePlatter setFilters:v8];
  id v11 = [(CLKUICurvedColoringLabel *)self->_dateLabel layer];
  [v11 setFilters:v8];

  id v12 = [(CLKUICurvedColoringLabel *)self->_weekdayLabel layer];
  [v12 setFilters:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_nextDatePlatter, 0);
  objc_storeStrong((id *)&self->_datePlatter, 0);
  objc_storeStrong((id *)&self->_previousDatePlatter, 0);
  objc_storeStrong((id *)&self->_nextDateLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_previousDateLabel, 0);

  objc_storeStrong((id *)&self->_weekdayLabel, 0);
}

@end