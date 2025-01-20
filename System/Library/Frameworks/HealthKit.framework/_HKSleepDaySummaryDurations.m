@interface _HKSleepDaySummaryDurations
+ (id)durationsFromSleepPeriod:(id)a3 dateInterval:(id)a4;
- (_HKSleepDaySummaryDurations)initWithInBedDuration:(double)a3 sleepDuration:(double)a4 unspecifiedSleepDuration:(double)a5 coreSleepDuration:(double)a6 deepSleepDuration:(double)a7 remSleepDuration:(double)a8 awakeDuration:(double)a9;
- (double)awakeDuration;
- (double)coreSleepDuration;
- (double)deepSleepDuration;
- (double)inBedDuration;
- (double)maxDuration;
- (double)remSleepDuration;
- (double)sleepDuration;
- (double)unspecifiedSleepDuration;
- (id)durationsByAdding:(id)a3;
@end

@implementation _HKSleepDaySummaryDurations

- (_HKSleepDaySummaryDurations)initWithInBedDuration:(double)a3 sleepDuration:(double)a4 unspecifiedSleepDuration:(double)a5 coreSleepDuration:(double)a6 deepSleepDuration:(double)a7 remSleepDuration:(double)a8 awakeDuration:(double)a9
{
  v17.receiver = self;
  v17.super_class = (Class)_HKSleepDaySummaryDurations;
  result = [(_HKSleepDaySummaryDurations *)&v17 init];
  if (result)
  {
    result->_inBedDuration = a3;
    result->_sleepDuration = a4;
    result->_unspecifiedSleepDuration = a5;
    result->_coreSleepDuration = a6;
    result->_deepSleepDuration = a7;
    result->_remSleepDuration = a8;
    result->_awakeDuration = a9;
  }
  return result;
}

+ (id)durationsFromSleepPeriod:(id)a3 dateInterval:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 durationForCategory:1 overlappingDateInterval:v5];
  double v8 = v7;
  [v6 durationForCategory:3 overlappingDateInterval:v5];
  double v10 = v9;
  [v6 durationForCategory:4 overlappingDateInterval:v5];
  double v12 = v11;
  [v6 durationForCategory:5 overlappingDateInterval:v5];
  double v14 = v13;
  [v6 durationForCategory:2 overlappingDateInterval:v5];
  double v16 = v15;
  [v6 durationForCategory:0 overlappingDateInterval:v5];
  double v18 = v17;

  v19 = [[_HKSleepDaySummaryDurations alloc] initWithInBedDuration:v18 sleepDuration:v8 + v10 + v12 + v14 unspecifiedSleepDuration:v8 coreSleepDuration:v10 deepSleepDuration:v12 remSleepDuration:v14 awakeDuration:v16];

  return v19;
}

- (id)durationsByAdding:(id)a3
{
  id v4 = a3;
  id v5 = [_HKSleepDaySummaryDurations alloc];
  [(_HKSleepDaySummaryDurations *)self inBedDuration];
  double v7 = v6;
  [v4 inBedDuration];
  double v9 = v7 + v8;
  [(_HKSleepDaySummaryDurations *)self sleepDuration];
  double v11 = v10;
  [v4 sleepDuration];
  double v13 = v11 + v12;
  [(_HKSleepDaySummaryDurations *)self unspecifiedSleepDuration];
  double v15 = v14;
  [v4 unspecifiedSleepDuration];
  double v17 = v15 + v16;
  [(_HKSleepDaySummaryDurations *)self coreSleepDuration];
  double v19 = v18;
  [v4 coreSleepDuration];
  double v21 = v19 + v20;
  [(_HKSleepDaySummaryDurations *)self deepSleepDuration];
  double v23 = v22;
  [v4 deepSleepDuration];
  double v25 = v23 + v24;
  [(_HKSleepDaySummaryDurations *)self remSleepDuration];
  double v27 = v26;
  [v4 remSleepDuration];
  double v29 = v27 + v28;
  [(_HKSleepDaySummaryDurations *)self awakeDuration];
  double v31 = v30;
  [v4 awakeDuration];
  double v33 = v32;

  v34 = [(_HKSleepDaySummaryDurations *)v5 initWithInBedDuration:v9 sleepDuration:v13 unspecifiedSleepDuration:v17 coreSleepDuration:v21 deepSleepDuration:v25 remSleepDuration:v29 awakeDuration:v31 + v33];

  return v34;
}

- (double)maxDuration
{
  [(_HKSleepDaySummaryDurations *)self sleepDuration];
  double v4 = v3;
  [(_HKSleepDaySummaryDurations *)self inBedDuration];
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (double)inBedDuration
{
  return self->_inBedDuration;
}

- (double)sleepDuration
{
  return self->_sleepDuration;
}

- (double)unspecifiedSleepDuration
{
  return self->_unspecifiedSleepDuration;
}

- (double)coreSleepDuration
{
  return self->_coreSleepDuration;
}

- (double)deepSleepDuration
{
  return self->_deepSleepDuration;
}

- (double)remSleepDuration
{
  return self->_remSleepDuration;
}

- (double)awakeDuration
{
  return self->_awakeDuration;
}

@end