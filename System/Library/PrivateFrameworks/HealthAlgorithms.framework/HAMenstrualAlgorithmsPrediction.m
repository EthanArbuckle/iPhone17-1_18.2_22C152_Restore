@interface HAMenstrualAlgorithmsPrediction
+ (BOOL)supportsSecureCoding;
- (BOOL)isOngoingMenstruation;
- (HAMenstrualAlgorithmsPrediction)initWithCoder:(id)a3;
- (_NSRange)lowRange;
- (double)endProbabilityMean;
- (double)endProbabilityStdDev;
- (double)startProbabilityMean;
- (double)startProbabilityStdDev;
- (int64_t)daysOffsetFromCalendarMethod;
- (unsigned)julianDayOfWindowStart;
- (unsigned)predictionPrimarySource;
- (void)encodeWithCoder:(id)a3;
- (void)setDaysOffsetFromCalendarMethod:(int64_t)a3;
- (void)setEndProbabilityMean:(double)a3;
- (void)setEndProbabilityStdDev:(double)a3;
- (void)setIsOngoingMenstruation:(BOOL)a3;
- (void)setJulianDayOfWindowStart:(unsigned int)a3;
- (void)setLowRange:(_NSRange)a3;
- (void)setPredictionPrimarySource:(unsigned __int8)a3;
- (void)setStartProbabilityMean:(double)a3;
- (void)setStartProbabilityStdDev:(double)a3;
@end

@implementation HAMenstrualAlgorithmsPrediction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsPrediction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAMenstrualAlgorithmsPrediction *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_julianDayOfWindowStart);
    v5->_julianDayOfWindowStart = [v4 decodeInt32ForKey:v6];

    v7 = NSStringFromSelector(sel_startProbabilityMean);
    [v4 decodeDoubleForKey:v7];
    v5->_startProbabilityMean = v8;

    v9 = NSStringFromSelector(sel_endProbabilityMean);
    [v4 decodeDoubleForKey:v9];
    v5->_endProbabilityMean = v10;

    v11 = NSStringFromSelector(sel_startProbabilityStdDev);
    [v4 decodeDoubleForKey:v11];
    v5->_startProbabilityStdDev = v12;

    v13 = NSStringFromSelector(sel_endProbabilityStdDev);
    [v4 decodeDoubleForKey:v13];
    v5->_endProbabilityStdDev = v14;

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector(sel_lowRange);
    v17 = [v4 decodeObjectOfClass:v15 forKey:v16];

    v5->_lowRange.location = [v17 rangeValue];
    v5->_lowRange.length = v18;
    v19 = NSStringFromSelector(sel_isOngoingMenstruation);
    v5->_isOngoingMenstruation = [v4 decodeBoolForKey:v19];

    v20 = NSStringFromSelector(sel_predictionPrimarySource);
    v5->_predictionPrimarySource = [v4 decodeInt32ForKey:v20];

    v21 = NSStringFromSelector(sel_daysOffsetFromCalendarMethod);
    v5->_daysOffsetFromCalendarMethod = [v4 decodeIntegerForKey:v21];

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  uint64_t julianDayOfWindowStart = self->_julianDayOfWindowStart;
  v5 = NSStringFromSelector(sel_julianDayOfWindowStart);
  [v21 encodeInt32:julianDayOfWindowStart forKey:v5];

  double startProbabilityMean = self->_startProbabilityMean;
  v7 = NSStringFromSelector(sel_startProbabilityMean);
  [v21 encodeDouble:v7 forKey:startProbabilityMean];

  double endProbabilityMean = self->_endProbabilityMean;
  v9 = NSStringFromSelector(sel_endProbabilityMean);
  [v21 encodeDouble:v9 forKey:endProbabilityMean];

  double startProbabilityStdDev = self->_startProbabilityStdDev;
  v11 = NSStringFromSelector(sel_startProbabilityStdDev);
  [v21 encodeDouble:v11 forKey:startProbabilityStdDev];

  double endProbabilityStdDev = self->_endProbabilityStdDev;
  v13 = NSStringFromSelector(sel_endProbabilityStdDev);
  [v21 encodeDouble:v13 forKey:endProbabilityStdDev];

  double v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_lowRange.location, self->_lowRange.length);
  uint64_t v15 = NSStringFromSelector(sel_lowRange);
  [v21 encodeObject:v14 forKey:v15];

  LODWORD(v15) = self->_isOngoingMenstruation;
  v16 = NSStringFromSelector(sel_isOngoingMenstruation);
  [v21 encodeBool:v15 != 0 forKey:v16];

  uint64_t predictionPrimarySource = self->_predictionPrimarySource;
  NSUInteger v18 = NSStringFromSelector(sel_predictionPrimarySource);
  [v21 encodeInt32:predictionPrimarySource forKey:v18];

  int64_t daysOffsetFromCalendarMethod = self->_daysOffsetFromCalendarMethod;
  v20 = NSStringFromSelector(sel_daysOffsetFromCalendarMethod);
  [v21 encodeInteger:daysOffsetFromCalendarMethod forKey:v20];
}

- (unsigned)julianDayOfWindowStart
{
  return self->_julianDayOfWindowStart;
}

- (void)setJulianDayOfWindowStart:(unsigned int)a3
{
  self->_uint64_t julianDayOfWindowStart = a3;
}

- (double)startProbabilityMean
{
  return self->_startProbabilityMean;
}

- (void)setStartProbabilityMean:(double)a3
{
  self->_double startProbabilityMean = a3;
}

- (double)endProbabilityMean
{
  return self->_endProbabilityMean;
}

- (void)setEndProbabilityMean:(double)a3
{
  self->_double endProbabilityMean = a3;
}

- (double)startProbabilityStdDev
{
  return self->_startProbabilityStdDev;
}

- (void)setStartProbabilityStdDev:(double)a3
{
  self->_double startProbabilityStdDev = a3;
}

- (double)endProbabilityStdDev
{
  return self->_endProbabilityStdDev;
}

- (void)setEndProbabilityStdDev:(double)a3
{
  self->_double endProbabilityStdDev = a3;
}

- (_NSRange)lowRange
{
  NSUInteger length = self->_lowRange.length;
  NSUInteger location = self->_lowRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLowRange:(_NSRange)a3
{
  self->_lowRange = a3;
}

- (BOOL)isOngoingMenstruation
{
  return self->_isOngoingMenstruation;
}

- (void)setIsOngoingMenstruation:(BOOL)a3
{
  self->_isOngoingMenstruation = a3;
}

- (unsigned)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void)setPredictionPrimarySource:(unsigned __int8)a3
{
  self->_uint64_t predictionPrimarySource = a3;
}

- (int64_t)daysOffsetFromCalendarMethod
{
  return self->_daysOffsetFromCalendarMethod;
}

- (void)setDaysOffsetFromCalendarMethod:(int64_t)a3
{
  self->_int64_t daysOffsetFromCalendarMethod = a3;
}

@end