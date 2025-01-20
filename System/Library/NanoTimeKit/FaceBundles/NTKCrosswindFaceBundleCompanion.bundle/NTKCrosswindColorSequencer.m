@interface NTKCrosswindColorSequencer
+ (double)initialAngleProgressesForReferenceDate:withCalendar:;
+ (id)_defaultReferenceDateWithCalendar:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)colorCompositionForDate:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)referenceComposition;
- (NSCalendar)calendar;
- (NSDate)referenceDate;
- (NTKCrosswindColorSequencer)initWithCalendar:(id)a3 gradientCount:(unint64_t)a4;
- (NTKCrosswindColorSequencer)initWithCalendar:(id)a3 gradientCount:(unint64_t)a4 referenceDate:(id)a5 referenceComposition:(id)a6;
- (int64_t)_numberOfHandCrossingsInTimeInterval:(double)a3 betweenHandsWithCrossInterval:(double)a4 initialProgress:(double)a5 forHandAtAngle:(double)a6 crossingHandAtAngle:(double)a7;
- (unint64_t)gradientCount;
- (void)_didConfigureReferenceTimeForReason:(id)a3;
- (void)_handleReferenceTimeChange:(id)a3;
- (void)_updateReferenceTimeForReason:(id)a3;
@end

@implementation NTKCrosswindColorSequencer

- (NTKCrosswindColorSequencer)initWithCalendar:(id)a3 gradientCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _defaultReferenceDateWithCalendar:v6];
  id v8 = [(id)objc_opt_class() _defaultReferenceComposition];
  v10 = -[NTKCrosswindColorSequencer initWithCalendar:gradientCount:referenceDate:referenceComposition:](self, "initWithCalendar:gradientCount:referenceDate:referenceComposition:", v6, a4, v7, v8, v9);

  if (v10)
  {
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v10 selector:"_handleReferenceTimeChange:" name:NSCalendarDayChangedNotification object:0];
    [v11 addObserver:v10 selector:"_handleReferenceTimeChange:" name:NSCurrentLocaleDidChangeNotification object:0];
    [v11 addObserver:v10 selector:"_handleReferenceTimeChange:" name:NSSystemTimeZoneDidChangeNotification object:0];
    [v11 addObserver:v10 selector:"_handleReferenceTimeChange:" name:UIApplicationSignificantTimeChangeNotification object:0];
  }
  return v10;
}

- (NTKCrosswindColorSequencer)initWithCalendar:(id)a3 gradientCount:(unint64_t)a4 referenceDate:(id)a5 referenceComposition:(id)a6
{
  unint64_t var1 = a6.var1;
  unint64_t var0 = a6.var0;
  id v12 = a3;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)NTKCrosswindColorSequencer;
  v14 = [(NTKCrosswindColorSequencer *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_calendar, a3);
    v15->_gradientCount = a4;
    objc_storeStrong((id *)&v15->_referenceDate, a5);
    v15->_referenceComposition.innerSecondGradientIndex = var0;
    v15->_referenceComposition.outerSecondGradientIndex = var1;
    [(id)objc_opt_class() initialAngleProgressesForReferenceDate:v13 withCalendar:v12];
    *(void *)v15->_initialReferenceAngleProgresses = v16;
    [(NTKCrosswindColorSequencer *)v15 _didConfigureReferenceTimeForReason:@"Initialization"];
  }

  return v15;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)colorCompositionForDate:(id)a3
{
  id v4 = a3;
  NTKHourMinuteSecondAnglesForTime();
  [v4 timeIntervalSinceDate:self->_referenceDate];
  double v6 = v5;

  uint64_t v7 = [(NTKCrosswindColorSequencer *)self _numberOfHandCrossingsInTimeInterval:v6 betweenHandsWithCrossInterval:61.0169492 initialProgress:COERCE_FLOAT(*(void *)self->_initialReferenceAngleProgresses) forHandAtAngle:0.0 crossingHandAtAngle:0.0];
  int64_t v8 = [(NTKCrosswindColorSequencer *)self _numberOfHandCrossingsInTimeInterval:v6 betweenHandsWithCrossInterval:60.0834492 initialProgress:*(float *)&self->_initialReferenceAngleProgresses[4] forHandAtAngle:0.0 crossingHandAtAngle:0.0];
  unint64_t innerSecondGradientIndex = self->_referenceComposition.innerSecondGradientIndex;
  unint64_t outerSecondGradientIndex = self->_referenceComposition.outerSecondGradientIndex;
  unint64_t gradientCount = self->_gradientCount;
  uint64_t v12 = NTKCrosswindOffsetIndexWrapped(innerSecondGradientIndex, v8 + v7, gradientCount);
  unint64_t v13 = NTKCrosswindOffsetIndexWrapped(outerSecondGradientIndex, v7, gradientCount);
  unint64_t v14 = v12;
  result.unint64_t var1 = v13;
  result.unint64_t var0 = v14;
  return result;
}

- (int64_t)_numberOfHandCrossingsInTimeInterval:(double)a3 betweenHandsWithCrossInterval:(double)a4 initialProgress:(double)a5 forHandAtAngle:(double)a6 crossingHandAtAngle:(double)a7
{
  double v7 = a3 / a4 + a5;
  double v8 = floor(v7);
  unint64_t v9 = vcvtmd_s64_f64(v7);
  double v10 = a6 + 6.28318531;
  if (a6 >= a7) {
    double v10 = a6;
  }
  double v11 = fmod(v10 - a7, 6.28318531) / 6.28318531;
  double v12 = v7 - (double)(uint64_t)v8;
  if (v12 > 0.9 && v11 < 0.1) {
    return v9 + 1;
  }
  BOOL v14 = v11 > 0.9 && v12 < 0.1;
  return v9 - v14;
}

- (void)_handleReferenceTimeChange:(id)a3
{
  v3 = [a3 name];
  id v4 = [v3 copy];

  id v5 = v4;
  BSDispatchMain();
}

- (void)_updateReferenceTimeForReason:(id)a3
{
  id v7 = a3;
  id v4 = [(id)objc_opt_class() _defaultReferenceDateWithCalendar:self->_calendar];
  referenceDate = self->_referenceDate;
  self->_referenceDate = v4;

  [(id)objc_opt_class() initialAngleProgressesForReferenceDate:self->_referenceDate withCalendar:self->_calendar];
  *(void *)self->_initialReferenceAngleProgresses = v6;
  [(NTKCrosswindColorSequencer *)self _didConfigureReferenceTimeForReason:v7];
}

- (void)_didConfigureReferenceTimeForReason:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    referenceDate = self->_referenceDate;
    int v9 = 138413058;
    double v10 = v7;
    __int16 v11 = 2048;
    double v12 = self;
    __int16 v13 = 2112;
    BOOL v14 = referenceDate;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> set reference date to '%@'; reason: '%@'",
      (uint8_t *)&v9,
      0x2Au);
  }
}

+ (id)_defaultReferenceDateWithCalendar:(id)a3
{
  id v3 = a3;
  id v4 = NTKIdealizedDate();
  id v5 = [v3 timeZone];
  uint64_t v6 = [v3 componentsInTimeZone:v5 fromDate:v4];

  [v6 setDay:1];
  id v7 = [v3 dateFromComponents:v6];

  return v7;
}

+ (double)initialAngleProgressesForReferenceDate:withCalendar:
{
  NTKHourMinuteSecondAnglesForTime();
  float v0 = fmod(0.0 - 0.0, 6.28318531) / 6.28318531;
  float v3 = v0;
  *(float *)&unsigned int v1 = fmod(0.0 - 0.0, 6.28318531) / 6.28318531;
  return COERCE_DOUBLE(__PAIR64__(v1, LODWORD(v3)));
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (unint64_t)gradientCount
{
  return self->_gradientCount;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)referenceComposition
{
  unint64_t outerSecondGradientIndex = self->_referenceComposition.outerSecondGradientIndex;
  unint64_t innerSecondGradientIndex = self->_referenceComposition.innerSecondGradientIndex;
  result.unint64_t var1 = outerSecondGradientIndex;
  result.unint64_t var0 = innerSecondGradientIndex;
  return result;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end