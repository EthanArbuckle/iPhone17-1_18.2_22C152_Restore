@interface HKMCProjection
+ (BOOL)supportsSecureCoding;
- ($0AC6E346AE4835514AAA8AC86D8F4844)allDays;
- ($0AC6E346AE4835514AAA8AC86D8F4844)mostLikelyDays;
- ($0AC6E346AE4835514AAA8AC86D8F4844)startDayRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPartiallyLogged;
- (HKMCProjection)initWithCoder:(id)a3;
- (HKMCProjection)initWithStartMean:(double)a3 startStandardDeviation:(double)a4 endMean:(double)a5 endStandardDeviation:(double)a6 allDays:(id)a7 partiallyLogged:(BOOL)a8 daysOffsetFromCalendarMethod:(int64_t)a9 predictionPrimarySource:(int64_t)a10;
- (NSString)hk_redactedDescription;
- (double)endMean;
- (double)endStandardDeviation;
- (double)startMean;
- (double)startStandardDeviation;
- (id)description;
- (int64_t)_dayIndexFromMean:(double)a3 standardDeviation:(double)a4 coefficient:(double)a5;
- (int64_t)dayIndexFromEndWithCoefficient:(double)a3;
- (int64_t)dayIndexFromStartWithCoefficient:(double)a3;
- (int64_t)daysOffsetFromCalendarMethod;
- (int64_t)predictionPrimarySource;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCProjection

- (HKMCProjection)initWithStartMean:(double)a3 startStandardDeviation:(double)a4 endMean:(double)a5 endStandardDeviation:(double)a6 allDays:(id)a7 partiallyLogged:(BOOL)a8 daysOffsetFromCalendarMethod:(int64_t)a9 predictionPrimarySource:(int64_t)a10
{
  int64_t var1 = a7.var1;
  int64_t var0 = a7.var0;
  v32.receiver = self;
  v32.super_class = (Class)HKMCProjection;
  v20 = [(HKMCProjection *)&v32 init];
  v21 = v20;
  if (!v20) {
    goto LABEL_15;
  }
  v20->_startMean = a3;
  v20->_startStandardDeviation = a4;
  v20->_endMean = a5;
  v20->_endStandardDeviation = a6;
  v20->_allDays.start = var0;
  v20->_allDays.duration = var1;
  v20->_partiallyLogged = a8;
  v20->_daysOffsetFromCalendarMethod = a9;
  v20->_predictionPrimarySource = a10;
  v22 = [MEMORY[0x263F0A980] sharedBehavior];
  int v23 = [v22 isAppleInternalInstall];

  if (v23)
  {
    [(HKMCProjection *)v21 mostLikelyDays];
    if (HKUnionDayIndexRange() != var0 || v24 != var1)
    {
      v31 = [MEMORY[0x263F08690] currentHandler];
      [v31 handleFailureInMethod:a2, v21, @"HKMCProjection.m", 44, @"Invalid parameter not satisfying: %@", @"HKEqualDayIndexRanges(HKUnionDayIndexRange([self mostLikelyDays], allDays), allDays)" object file lineNumber description];
    }
  }
  [(HKMCProjection *)v21 mostLikelyDays];
  if (HKUnionDayIndexRange() == var0 && v26 == var1)
  {
LABEL_15:
    v29 = v21;
  }
  else
  {
    _HKInitializeLogging();
    v28 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_FAULT)) {
      -[HKMCProjection initWithStartMean:startStandardDeviation:endMean:endStandardDeviation:allDays:partiallyLogged:daysOffsetFromCalendarMethod:predictionPrimarySource:](v28);
    }
    v29 = 0;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double startMean = self->_startMean;
  id v5 = a3;
  [v5 encodeDouble:@"StartMean" forKey:startMean];
  [v5 encodeDouble:@"StartStandardDeviation" forKey:self->_startStandardDeviation];
  [v5 encodeDouble:@"EndMean" forKey:self->_endMean];
  [v5 encodeDouble:@"EndStandardDeviation" forKey:self->_endStandardDeviation];
  [v5 encodeInteger:self->_allDays.start forKey:@"AllDaysStart"];
  [v5 encodeInteger:self->_allDays.duration forKey:@"AllDaysDuration"];
  [v5 encodeBool:self->_partiallyLogged forKey:@"PartiallyLogged"];
  [v5 encodeInteger:self->_daysOffsetFromCalendarMethod forKey:@"DaysOffsetFromCalendarMethod"];
  [v5 encodeInteger:self->_predictionPrimarySource forKey:@"PredictionPrimarySource"];
}

- (HKMCProjection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMCProjection;
  id v5 = [(HKMCProjection *)&v11 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"StartMean"];
    v5->_double startMean = v6;
    [v4 decodeDoubleForKey:@"StartStandardDeviation"];
    v5->_startStandardDeviation = v7;
    [v4 decodeDoubleForKey:@"EndMean"];
    v5->_endMean = v8;
    [v4 decodeDoubleForKey:@"EndStandardDeviation"];
    v5->_endStandardDeviation = v9;
    v5->_allDays.start = [v4 decodeIntegerForKey:@"AllDaysStart"];
    v5->_allDays.duration = [v4 decodeIntegerForKey:@"AllDaysDuration"];
    v5->_partiallyLogged = [v4 decodeBoolForKey:@"PartiallyLogged"];
    v5->_daysOffsetFromCalendarMethod = [v4 decodeIntegerForKey:@"DaysOffsetFromCalendarMethod"];
    v5->_predictionPrimarySource = [v4 decodeIntegerForKey:@"PredictionPrimarySource"];
  }

  return v5;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)mostLikelyDays
{
  double startMean = self->_startMean;
  int64_t v3 = llround(self->_endMean - startMean) + 1;
  int64_t v4 = llround(startMean);
  result.int64_t var1 = v3;
  result.int64_t var0 = v4;
  return result;
}

- (int64_t)dayIndexFromStartWithCoefficient:(double)a3
{
  return [(HKMCProjection *)self _dayIndexFromMean:self->_startMean standardDeviation:self->_startStandardDeviation coefficient:a3];
}

- (int64_t)dayIndexFromEndWithCoefficient:(double)a3
{
  return [(HKMCProjection *)self _dayIndexFromMean:self->_endMean standardDeviation:self->_endStandardDeviation coefficient:a3];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)startDayRange
{
  int64_t start = self->_allDays.start;
  int64_t v3 = (2 * ([(HKMCProjection *)self mostLikelyDays] - start)) | 1;
  int64_t v4 = start;
  result.int64_t var1 = v3;
  result.int64_t var0 = v4;
  return result;
}

- (int64_t)_dayIndexFromMean:(double)a3 standardDeviation:(double)a4 coefficient:(double)a5
{
  return llround(a3 + a5 * a4);
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v13 = *(_OWORD *)&self->_startMean;
  double endMean = self->_endMean;
  double endStandardDeviation = self->_endStandardDeviation;
  double v7 = NSStringFromHKDayIndexRange();
  BOOL partiallyLogged = self->_partiallyLogged;
  double v9 = [NSNumber numberWithInteger:self->_daysOffsetFromCalendarMethod];
  v10 = [NSNumber numberWithInteger:self->_predictionPrimarySource];
  objc_super v11 = [v3 stringWithFormat:@"<%@:%p start:%.2f±%.2f end:%.2f±%.2f allDays:%@ partiallyLogged:%d daysShifted:%@ predictionPrimarySource:%@>", v4, self, v13, *(void *)&endMean, *(void *)&endStandardDeviation, v7, partiallyLogged, v9, v10];

  return v11;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMCProjection *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || vabdd_f64(self->_startMean, v4->_startMean) >= 2.22044605e-16
    || vabdd_f64(self->_startStandardDeviation, v4->_startStandardDeviation) >= 2.22044605e-16
    || vabdd_f64(self->_endMean, v4->_endMean) >= 2.22044605e-16
    || vabdd_f64(self->_endStandardDeviation, v4->_endStandardDeviation) >= 2.22044605e-16)
  {
    goto LABEL_12;
  }
  uint64_t v5 = [(HKMCProjection *)self allDays];
  uint64_t v7 = v6;
  BOOL v9 = 0;
  if (v5 == [(HKMCProjection *)v4 allDays] && v7 == v8)
  {
    if (self->_partiallyLogged == v4->_partiallyLogged
      && self->_daysOffsetFromCalendarMethod == v4->_daysOffsetFromCalendarMethod)
    {
      BOOL v9 = self->_predictionPrimarySource == v4->_predictionPrimarySource;
      goto LABEL_14;
    }
LABEL_12:
    BOOL v9 = 0;
  }
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [NSNumber numberWithDouble:self->_startMean];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [NSNumber numberWithDouble:self->_startStandardDeviation];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [NSNumber numberWithDouble:self->_endMean];
  uint64_t v8 = [v7 hash];
  BOOL v9 = [NSNumber numberWithDouble:self->_endStandardDeviation];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  objc_super v11 = [NSNumber numberWithInteger:self->_allDays.start];
  uint64_t v12 = [v11 hash];
  long long v13 = [NSNumber numberWithInteger:self->_allDays.duration];
  uint64_t v14 = v10 ^ v12 ^ [v13 hash] ^ self->_partiallyLogged;
  v15 = [NSNumber numberWithInteger:self->_daysOffsetFromCalendarMethod];
  unint64_t v16 = v14 ^ [v15 hash] ^ self->_predictionPrimarySource;

  return v16;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)allDays
{
  int64_t duration = self->_allDays.duration;
  int64_t start = self->_allDays.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (BOOL)isPartiallyLogged
{
  return self->_partiallyLogged;
}

- (int64_t)daysOffsetFromCalendarMethod
{
  return self->_daysOffsetFromCalendarMethod;
}

- (int64_t)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (double)startMean
{
  return self->_startMean;
}

- (double)startStandardDeviation
{
  return self->_startStandardDeviation;
}

- (double)endMean
{
  return self->_endMean;
}

- (double)endStandardDeviation
{
  return self->_endStandardDeviation;
}

- (void)initWithStartMean:(void *)a1 startStandardDeviation:endMean:endStandardDeviation:allDays:partiallyLogged:daysOffsetFromCalendarMethod:predictionPrimarySource:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_fault_impl(&dword_2249E9000, v1, OS_LOG_TYPE_FAULT, "[%{public}@] Cannot create projection with most likely days outside of all days", (uint8_t *)&v3, 0xCu);
}

@end