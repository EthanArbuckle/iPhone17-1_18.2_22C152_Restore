@interface NLActivityRichComplicationChartView
- (double)_exercisePointRelativeHeightForValue:(double)a3;
- (double)_movePointRelativeHeightForValue:(double)a3;
- (id)_generateChartPointsForQuantityStatisticsInfo:(id)a3 withUnit:(id)a4 accumulateFractionalValues:(BOOL)a5;
- (id)_generateStandChartPointsForStandHourInfo:(id)a3;
- (id)_keyForDate:(id)a3;
- (id)_timeStringByRemovingSpacesFromTimeString:(id)a3;
- (id)initForDevice:(id)a3;
- (void)_createHourFormatter;
- (void)_currentLocaleChangeOccurred;
- (void)_drawChartsBarsInContext:(CGContext *)a3 lineNumber:(unint64_t)a4 xPosition:(double)a5;
- (void)_registerForNotifications;
- (void)_updateHourLabelsText;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setExerciseGraphData:(id)a3;
- (void)setMoveGraphData:(id)a3 activityMoveMode:(int64_t)a4;
- (void)setStandGraphData:(id)a3;
@end

@implementation NLActivityRichComplicationChartView

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NLActivityRichComplicationChartView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[NLActivityRichComplicationChartView initWithFrame:](&v37, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    v11 = +[UIColor clearColor];
    [(NLActivityRichComplicationChartView *)v10 setBackgroundColor:v11];

    [(NLActivityRichComplicationChartView *)v10 setClipsToBounds:0];
    uint64_t v12 = +[UIColor colorWithWhite:1.0 alpha:0.3];
    chartLineColor = v10->_chartLineColor;
    v10->_chartLineColor = (UIColor *)v12;

    v14 = NTKMoveGradientLightColor();
    v15 = NTKMoveGradientDarkColor();
    v10->_moveBarGradient = (CGGradient *)+[ARUIMetricColors newGradientForStartColor:v14 endColor:v15];

    uint64_t v16 = NTKMoveAdjustmentButtonBackgroundColor();
    moveBarFadedColor = v10->_moveBarFadedColor;
    v10->_moveBarFadedColor = (UIColor *)v16;

    v18 = NTKExerciseGradientLightColor();
    v19 = NTKExerciseGradientDarkColor();
    v10->_exerciseBarGradient = (CGGradient *)+[ARUIMetricColors newGradientForStartColor:v18 endColor:v19];

    uint64_t v20 = NTKExerciseAdjustmentButtonBackgroundColor();
    exerciseBarFadedColor = v10->_exerciseBarFadedColor;
    v10->_exerciseBarFadedColor = (UIColor *)v20;

    v22 = NTKStandGradientLightColor();
    v23 = NTKStandGradientDarkColor();
    v10->_standBarGradient = (CGGradient *)+[ARUIMetricColors newGradientForStartColor:v22 endColor:v23];

    long long v35 = 0u;
    long long v36 = 0u;
    memset(v34, 0, sizeof(v34));
    sub_343C(v10->_device, v34);
    v24 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:*((double *)&v35 + 1) design:UIFontWeightSemibold];
    v25 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    midnightHourLabel = v10->_midnightHourLabel;
    v10->_midnightHourLabel = v25;

    [(UILabel *)v10->_midnightHourLabel setFont:v24];
    [(UILabel *)v10->_midnightHourLabel setTextColor:v10->_chartLineColor];
    [(NLActivityRichComplicationChartView *)v10 addSubview:v10->_midnightHourLabel];
    v27 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    sixAMHourLabel = v10->_sixAMHourLabel;
    v10->_sixAMHourLabel = v27;

    [(UILabel *)v10->_sixAMHourLabel setFont:v24];
    [(UILabel *)v10->_sixAMHourLabel setTextColor:v10->_chartLineColor];
    [(NLActivityRichComplicationChartView *)v10 addSubview:v10->_sixAMHourLabel];
    v29 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    noonHourLabel = v10->_noonHourLabel;
    v10->_noonHourLabel = v29;

    [(UILabel *)v10->_noonHourLabel setFont:v24];
    [(UILabel *)v10->_noonHourLabel setTextColor:v10->_chartLineColor];
    [(NLActivityRichComplicationChartView *)v10 addSubview:v10->_noonHourLabel];
    v31 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    sixPMHourLabel = v10->_sixPMHourLabel;
    v10->_sixPMHourLabel = v31;

    [(UILabel *)v10->_sixPMHourLabel setFont:v24];
    [(UILabel *)v10->_sixPMHourLabel setTextColor:v10->_chartLineColor];
    [(NLActivityRichComplicationChartView *)v10 addSubview:v10->_sixPMHourLabel];
    [(NLActivityRichComplicationChartView *)v10 _createHourFormatter];
    [(NLActivityRichComplicationChartView *)v10 _updateHourLabelsText];
    [(NLActivityRichComplicationChartView *)v10 _registerForNotifications];
  }
  return v10;
}

- (void)dealloc
{
  CGGradientRelease(self->_moveBarGradient);
  CGGradientRelease(self->_exerciseBarGradient);
  CGGradientRelease(self->_standBarGradient);
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NLActivityRichComplicationChartView;
  [(NLActivityRichComplicationChartView *)&v4 dealloc];
}

- (void)_createHourFormatter
{
  id v6 = +[NSLocale currentLocale];
  v3 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
  hourFormatter = self->_hourFormatter;
  self->_hourFormatter = v3;

  [(NSDateFormatter *)self->_hourFormatter setLocale:v6];
  id v5 = +[NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:v6];
  [(NSDateFormatter *)self->_hourFormatter setDateFormat:v5];
}

- (void)_updateHourLabelsText
{
  id v18 = objc_alloc_init((Class)NSDateComponents);
  [v18 setDay:12];
  [v18 setMonth:1];
  [v18 setYear:2010];
  v3 = +[NSCalendar currentCalendar];
  uint64_t v4 = [v3 dateFromComponents:v18];
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setHour:6];
  v17 = (void *)v4;
  id v6 = [(NSDateFormatter *)self->_hourFormatter stringFromDate:v4];
  uint64_t v16 = [(NLActivityRichComplicationChartView *)self _timeStringByRemovingSpacesFromTimeString:v6];

  [(UILabel *)self->_midnightHourLabel setText:v16];
  v7 = [v3 dateByAddingComponents:v5 toDate:v4 options:0];
  v8 = [(NSDateFormatter *)self->_hourFormatter stringFromDate:v7];
  v9 = [(NLActivityRichComplicationChartView *)self _timeStringByRemovingSpacesFromTimeString:v8];

  [(UILabel *)self->_sixAMHourLabel setText:v9];
  v10 = [v3 dateByAddingComponents:v5 toDate:v7 options:0];
  v11 = [(NSDateFormatter *)self->_hourFormatter stringFromDate:v10];
  uint64_t v12 = [(NLActivityRichComplicationChartView *)self _timeStringByRemovingSpacesFromTimeString:v11];

  [(UILabel *)self->_noonHourLabel setText:v12];
  v13 = [v3 dateByAddingComponents:v5 toDate:v10 options:0];
  v14 = [(NSDateFormatter *)self->_hourFormatter stringFromDate:v13];
  v15 = [(NLActivityRichComplicationChartView *)self _timeStringByRemovingSpacesFromTimeString:v14];

  [(UILabel *)self->_sixPMHourLabel setText:v15];
}

- (id)_timeStringByRemovingSpacesFromTimeString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSLocale currentLocale];
  id v5 = [v4 languageCode];
  if ([@"hi" isEqualToString:v5])
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [v3 stringByReplacingOccurrencesOfString:@" " withString:&stru_108F0];
  }
  v7 = v6;

  return v7;
}

- (void)_currentLocaleChangeOccurred
{
  [(NLActivityRichComplicationChartView *)self _createHourFormatter];
  [(NLActivityRichComplicationChartView *)self _updateHourLabelsText];

  [(NLActivityRichComplicationChartView *)self setNeedsDisplay];
}

- (void)_registerForNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_currentLocaleChangeOccurred" name:NSCurrentLocaleDidChangeNotification object:0];
}

- (void)setMoveGraphData:(id)a3 activityMoveMode:(int64_t)a4
{
  if (a4 == 2)
  {
    id v6 = a3;
    v7 = +[HKUnit minuteUnit];
  }
  else
  {
    id v8 = a3;
    v9 = +[FIUIActivityDataModel formattingManager];
    v10 = [v9 unitManager];
    v7 = [v10 userActiveEnergyBurnedUnit];
  }
  v11 = [(NLActivityRichComplicationChartView *)self _generateChartPointsForQuantityStatisticsInfo:a3 withUnit:v7 accumulateFractionalValues:0];

  moveChartPoints = self->_moveChartPoints;
  self->_moveChartPoints = v11;

  v13 = +[NSNumber numberWithInteger:0x8000000000000000];
  maxMoveValue = self->_maxMoveValue;
  self->_maxMoveValue = v13;

  v15 = [(NSDictionary *)self->_moveChartPoints allValues];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3BD0;
  v16[3] = &unk_10568;
  v16[4] = self;
  [v15 enumerateObjectsUsingBlock:v16];

  [(NLActivityRichComplicationChartView *)self setNeedsDisplay];
}

- (void)setExerciseGraphData:(id)a3
{
  id v4 = a3;
  id v5 = +[HKUnit minuteUnit];
  id v6 = [(NLActivityRichComplicationChartView *)self _generateChartPointsForQuantityStatisticsInfo:v4 withUnit:v5 accumulateFractionalValues:1];

  exerciseChartPoints = self->_exerciseChartPoints;
  self->_exerciseChartPoints = v6;

  id v8 = +[NSNumber numberWithInteger:0x8000000000000000];
  maxExerciseValue = self->_maxExerciseValue;
  self->_maxExerciseValue = v8;

  v10 = [(NSDictionary *)self->_exerciseChartPoints allValues];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3D64;
  v11[3] = &unk_10568;
  v11[4] = self;
  [v10 enumerateObjectsUsingBlock:v11];

  [(NLActivityRichComplicationChartView *)self setNeedsDisplay];
}

- (void)setStandGraphData:(id)a3
{
  id v4 = [(NLActivityRichComplicationChartView *)self _generateStandChartPointsForStandHourInfo:a3];
  standChartPoints = self->_standChartPoints;
  self->_standChartPoints = v4;

  [(NLActivityRichComplicationChartView *)self setNeedsDisplay];
}

- (id)_keyForDate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 components:96 fromDate:v3];

  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v5 hour] + (void)objc_msgSend(v5, "minute"));

  return v6;
}

- (id)_generateChartPointsForQuantityStatisticsInfo:(id)a3 withUnit:(id)a4 accumulateFractionalValues:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v41 = a4;
  v9 = +[NSMutableDictionary dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v11)
  {
    v13 = 0;
    objc_super v37 = v10;
    goto LABEL_28;
  }
  id v12 = v11;
  v13 = 0;
  uint64_t v14 = *(void *)v43;
  double v15 = 0.0;
  id obj = v10;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v43 != v14) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      id v18 = objc_msgSend(v17, "quantityValue", obj);
      [v18 doubleValueForUnit:v41];
      double v20 = v19;

      double v21 = floor(v20);
      double v22 = v20 - v21;
      if (!v5) {
        double v22 = -0.0;
      }
      double v23 = v15 + v22;
      BOOL v24 = v23 >= 1.0;
      if (1.0 - v23 < 0.01) {
        BOOL v24 = 1;
      }
      double v25 = v23 + -1.0;
      if (v23 + -1.0 < 0.0) {
        double v25 = 0.0;
      }
      if (v24) {
        double v26 = v21 + 1.0;
      }
      else {
        double v26 = v21;
      }
      if (v24) {
        double v15 = v25;
      }
      else {
        double v15 = v23;
      }
      v27 = objc_alloc_init(NLActivityRichComplicationChartPoint);
      v28 = [v17 startDate];
      [(NLActivityRichComplicationChartPoint *)v27 setXValue:v28];

      v29 = +[NSNumber numberWithDouble:v26];
      [(NLActivityRichComplicationChartPoint *)v27 setYValue:v29];

      v30 = [v17 startDate];
      v31 = [(NLActivityRichComplicationChartView *)self _keyForDate:v30];

      [v9 setObject:v27 forKeyedSubscript:v31];
      if (v26 > 0.0)
      {
        v32 = v27;

        v13 = v32;
      }
    }
    id v10 = obj;
    id v12 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v12);

  if (v15 > 0.7 && v5)
  {
    v34 = [(NLActivityRichComplicationChartPoint *)v13 yValue];
    [v34 doubleValue];
    double v36 = v35;

    objc_super v37 = +[NSNumber numberWithDouble:v36 + 1.0];
    [(NLActivityRichComplicationChartPoint *)v13 setYValue:v37];
LABEL_28:
  }
  id v38 = [v9 copy];

  return v38;
}

- (id)_generateStandChartPointsForStandHourInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableDictionary dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_alloc_init(NLActivityRichComplicationChartPoint);
        [v10 timeStamp];
        id v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
        [(NLActivityRichComplicationChartPoint *)v11 setXValue:v12];
        if ([v10 state]) {
          v13 = &off_110B8;
        }
        else {
          v13 = &off_110A8;
        }
        [(NLActivityRichComplicationChartPoint *)v11 setYValue:v13];
        uint64_t v14 = [(NLActivityRichComplicationChartView *)self _keyForDate:v12];
        [v5 setObject:v11 forKeyedSubscript:v14];
      }
      id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v15 = [v5 copy];

  return v15;
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)NLActivityRichComplicationChartView;
  [(NLActivityRichComplicationChartView *)&v45 layoutSubviews];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  sub_343C(self->_device, &v35);
  int64_t v3 = *((void *)&v40 + 1) - *((void *)&v40 + 1) / (unint64_t)v41;
  uint64_t v4 = *((void *)&v40 + 1) - 1;
  double v5 = (double)(uint64_t)(*((void *)&v40 + 1) / (unint64_t)v41);
  CLKRoundForDevice();
  double v7 = v6;
  CLKRoundForDevice();
  double v9 = v8 * (double)v3 + v5 * v7;
  CLKRoundForDevice();
  double v11 = v9 + (double)v4 * v10;
  [(NLActivityRichComplicationChartView *)self bounds];
  self->_double chartLineStartPositionX = (v12 - v11) * 0.5;
  long long v13 = v36;
  *(void *)&self->_moveChartBottomLineY = v36;
  double v14 = *(double *)&v43;
  double v15 = *(double *)&v37;
  double v16 = *(double *)&v43 + *(double *)&v13 + *((double *)&v13 + 1);
  self->_exerciseChartBottomLineY = v16;
  double v17 = v14 + v16 + v15;
  self->_standChartBottomLineY = v17;
  sixAMHourLabel = self->_sixAMHourLabel;
  v46[0] = self->_midnightHourLabel;
  v46[1] = sixAMHourLabel;
  sixPMHourLabel = self->_sixPMHourLabel;
  v46[2] = self->_noonHourLabel;
  v46[3] = sixPMHourLabel;
  long long v20 = +[NSArray arrayWithObjects:v46 count:4];
  long long v21 = +[NSMutableArray array];
  double chartLineStartPositionX = self->_chartLineStartPositionX;
  double v23 = +[NSNumber numberWithDouble:chartLineStartPositionX];
  [v21 addObject:v23];

  if (v4)
  {
    uint64_t v24 = 0;
    unint64_t v25 = 0;
    unint64_t v26 = 0;
    double v27 = v14 + v17;
    double v28 = *(double *)&v44;
    v29 = v20;
    do
    {
      if (!(v24 + 6 * (v26 / 6)) && v25 < (unint64_t)[v20 count])
      {
        v30 = [v20 objectAtIndexedSubscript:v25];
        [v30 sizeToFit];
        [v30 bounds];
        objc_msgSend(v30, "setFrame:", chartLineStartPositionX + v28, v27);
        ++v25;
      }
      CLKRoundForDevice();
      double chartLineStartPositionX = v31;
      v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v21 addObject:v32];

      ++v26;
      --v24;
      --v4;
      long long v20 = v29;
    }
    while (v4);
  }
  v33 = (NSArray *)[v21 copy];
  chartLineXPositions = self->_chartLineXPositions;
  self->_chartLineXPositions = v33;

  [(NLActivityRichComplicationChartView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  double v9 = +[UIColor clearColor];
  [v9 setFill];

  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  UIRectFill(v45);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  sub_343C(self->_device, &v35);
  double v10 = [(NSArray *)self->_chartLineXPositions lastObject];
  [v10 floatValue];
  CGFloat v12 = v11 - self->_chartLineStartPositionX;

  [(NLActivityRichComplicationChartView *)self bounds];
  uint64_t v14 = v13;
  uint64_t v15 = *((void *)&v41 + 1);
  uint64_t v16 = *((void *)&v42 + 1);
  [(UIColor *)self->_chartLineColor setFill];
  double chartLineStartPositionX = self->_chartLineStartPositionX;
  v46.origin.CGFloat y = self->_moveChartBottomLineY;
  CGFloat v18 = *(double *)&v43;
  v46.origin.CGFloat x = chartLineStartPositionX;
  v46.size.CGFloat width = v12;
  *(void *)&v46.size.CGFloat height = v43;
  UIRectFill(v46);
  v47.origin.CGFloat y = self->_exerciseChartBottomLineY;
  v47.origin.CGFloat x = chartLineStartPositionX;
  v47.size.CGFloat width = v12;
  v47.size.CGFloat height = v18;
  UIRectFill(v47);
  v48.origin.CGFloat y = self->_standChartBottomLineY;
  v48.origin.CGFloat x = chartLineStartPositionX;
  v48.size.CGFloat width = v12;
  v48.size.CGFloat height = v18;
  UIRectFill(v48);
  chartLineXPositions = self->_chartLineXPositions;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  long long v27 = v41;
  long long v28 = v42;
  long long v29 = v43;
  long long v30 = v44;
  long long v23 = v37;
  long long v24 = v38;
  long long v25 = v39;
  long long v26 = v40;
  long long v21 = v35;
  long long v22 = v36;
  v20[2] = sub_4900;
  v20[3] = &unk_10590;
  uint64_t v31 = v14;
  uint64_t v32 = v15;
  uint64_t v33 = v16;
  v20[4] = self;
  CGContextRef v34 = CurrentContext;
  [(NSArray *)chartLineXPositions enumerateObjectsUsingBlock:v20];
}

- (void)_drawChartsBarsInContext:(CGContext *)a3 lineNumber:(unint64_t)a4 xPosition:(double)a5
{
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  sub_343C(self->_device, &v70);
  long long v9 = v71;
  double v10 = *(double *)&v70;
  double v11 = *(double *)&v78;
  double v12 = *(double *)&v72;
  double v13 = *(double *)&v71 + *(double *)&v78 + *((double *)&v71 + 1);
  CLKRoundForDevice();
  double v15 = v14;
  v60 = +[NSNumber numberWithUnsignedInteger:a4];
  uint64_t v16 = -[NSDictionary objectForKeyedSubscript:](self->_standChartPoints, "objectForKeyedSubscript:");
  double v17 = v16;
  if (v16)
  {
    double v18 = v12 + v11 + v13 - v10;
    long long v19 = [v16 yValue];
    id v20 = [v19 integerValue];

    double v21 = *(double *)&v75;
    CGFloat v22 = *(double *)&v75 * 0.5;
    Mutable = CGPathCreateMutable();
    v88.origin.CGFloat x = *((double *)&v70 + 1) + a5;
    v88.size.CGFloat height = -v21;
    v88.origin.CGFloat y = v18;
    v88.size.CGFloat width = v21;
    CGPathAddRoundedRect(Mutable, 0, v88, v22, v22);
    CGContextSaveGState(a3);
    if (!v20) {
      CGContextSetAlpha(a3, 0.3);
    }
    CGContextAddPath(a3, Mutable);
    CGContextClip(a3);
    v82.CGFloat x = 1.0;
    v82.CGFloat y = 0.0;
    v85.CGFloat x = 1.0;
    v85.CGFloat y = v18;
    CGContextDrawLinearGradient(a3, self->_standBarGradient, v82, v85, 0);
    CGContextRestoreGState(a3);
    CGPathRelease(Mutable);
  }
  v59 = v17;
  CGContextRef c = a3;
  double v24 = *(double *)&v9 - v10;
  double rect = v13 - v10;
  double v25 = *((double *)&v72 + 1);
  path = CGPathCreateMutable();
  long long v26 = CGPathCreateMutable();
  v63 = CGPathCreateMutable();
  long long v27 = CGPathCreateMutable();
  uint64_t v28 = +[NSNumber numberWithUnsignedInteger:a4];
  +[NSNumber numberWithUnsignedInteger:a4 + 30];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v57 = long long v69 = 0u;
  v58 = (void *)v28;
  v80[0] = v28;
  v80[1] = v57;
  id obj = +[NSArray arrayWithObjects:v80 count:2];
  id v29 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v67;
    double v32 = *((double *)&v73 + 1);
    double v33 = -*((double *)&v73 + 1);
    double v34 = v25 + *((double *)&v70 + 1);
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v67 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        long long v37 = [(NSDictionary *)self->_moveChartPoints objectForKeyedSubscript:v36];
        long long v38 = [v37 yValue];
        [v38 doubleValue];
        double v40 = v39;

        double v41 = v33;
        long long v42 = v26;
        if (v40 > 0.0)
        {
          [(NLActivityRichComplicationChartView *)self _movePointRelativeHeightForValue:v40];
          if (v43 == 0.0) {
            double v43 = v32;
          }
          double v41 = -v43;
          long long v42 = path;
        }
        double v44 = v15;
        double v45 = v24;
        double v46 = v25;
        CGPathAddRoundedRect(v42, 0, *(CGRect *)(&v41 - 3), v25 * 0.5, v25 * 0.5);
        CGRect v47 = [(NSDictionary *)self->_exerciseChartPoints objectForKeyedSubscript:v36];
        CGRect v48 = [v47 yValue];
        [v48 doubleValue];
        double v50 = v49;

        double v51 = v33;
        v52 = v27;
        if (v50 > 0.0)
        {
          [(NLActivityRichComplicationChartView *)self _exercisePointRelativeHeightForValue:v50];
          if (v53 == 0.0) {
            double v53 = v32;
          }
          double v51 = -v53;
          v52 = v63;
        }
        double v54 = v15;
        double v55 = rect;
        double v56 = v25;
        CGPathAddRoundedRect(v52, 0, *(CGRect *)(&v51 - 3), v25 * 0.5, v25 * 0.5);
        double v15 = v15 + v34;
      }
      id v30 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
    }
    while (v30);
  }

  if (!CGPathIsEmpty(v26))
  {
    CGContextSaveGState(c);
    CGContextAddPath(c, v26);
    CGContextSetFillColorWithColor(c, [(UIColor *)self->_moveBarFadedColor CGColor]);
    CGContextFillPath(c);
    CGContextRestoreGState(c);
  }
  CGPathRelease(v26);
  if (!CGPathIsEmpty(path))
  {
    CGContextSaveGState(c);
    CGContextAddPath(c, path);
    CGContextClip(c);
    v83.CGFloat x = 1.0;
    v83.CGFloat y = 0.0;
    v86.CGFloat x = 1.0;
    v86.CGFloat y = v24;
    CGContextDrawLinearGradient(c, self->_moveBarGradient, v83, v86, 0);
    CGContextRestoreGState(c);
  }
  CGPathRelease(path);
  if (!CGPathIsEmpty(v27))
  {
    CGContextSaveGState(c);
    CGContextAddPath(c, v27);
    CGContextSetFillColorWithColor(c, [(UIColor *)self->_exerciseBarFadedColor CGColor]);
    CGContextFillPath(c);
    CGContextRestoreGState(c);
  }
  CGPathRelease(v27);
  if (!CGPathIsEmpty(v63))
  {
    CGContextSaveGState(c);
    CGContextAddPath(c, v63);
    CGContextClip(c);
    v84.CGFloat x = 1.0;
    v84.CGFloat y = 0.0;
    v87.CGFloat x = 1.0;
    v87.CGFloat y = rect;
    CGContextDrawLinearGradient(c, self->_exerciseBarGradient, v84, v87, 0);
    CGContextRestoreGState(c);
  }
  CGPathRelease(v63);
}

- (double)_movePointRelativeHeightForValue:(double)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  sub_343C(self->_device, v8);
  [(NSNumber *)self->_maxMoveValue doubleValue];
  double v6 = v5;
  double result = 0.0;
  if (v6 > 0.00000011920929)
  {
    double result = a3 / v6 * *(double *)&v10;
    if (result < *(double *)&v9) {
      return *(double *)&v9;
    }
  }
  return result;
}

- (double)_exercisePointRelativeHeightForValue:(double)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  sub_343C(self->_device, v8);
  [(NSNumber *)self->_maxExerciseValue doubleValue];
  double v6 = v5;
  double result = 0.0;
  if (v6 > 0.00000011920929)
  {
    double result = a3 / v6 * *((double *)&v10 + 1);
    if (result < *(double *)&v9) {
      return *(double *)&v9;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sixPMHourLabel, 0);
  objc_storeStrong((id *)&self->_noonHourLabel, 0);
  objc_storeStrong((id *)&self->_sixAMHourLabel, 0);
  objc_storeStrong((id *)&self->_midnightHourLabel, 0);
  objc_storeStrong((id *)&self->_hourFormatter, 0);
  objc_storeStrong((id *)&self->_exerciseBarFadedColor, 0);
  objc_storeStrong((id *)&self->_moveBarFadedColor, 0);
  objc_storeStrong((id *)&self->_chartLineXPositions, 0);
  objc_storeStrong((id *)&self->_chartLineColor, 0);
  objc_storeStrong((id *)&self->_standChartPoints, 0);
  objc_storeStrong((id *)&self->_maxExerciseValue, 0);
  objc_storeStrong((id *)&self->_exerciseChartPoints, 0);
  objc_storeStrong((id *)&self->_maxMoveValue, 0);
  objc_storeStrong((id *)&self->_moveChartPoints, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end