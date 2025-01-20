@interface HDAudioAnalyticsExposureCalculator
- (HDAudioAnalyticsExposureCalculator)initWithTargetDate:(id)a3 exposureType:(int64_t)a4 profile:(id)a5;
- (HDProfile)profile;
- (NSDate)targetDate;
- (id)audioExposureResultWithError:(id *)a3;
- (id)notificationCountForRollingDays:(int64_t)a3 error:(id *)a4;
- (id)sevenDayDoseForMostRecentNotificationWithError:(id *)a3;
- (int64_t)audioExposureType;
- (void)setAudioExposureType:(int64_t)a3;
- (void)setProfile:(id)a3;
- (void)setTargetDate:(id)a3;
@end

@implementation HDAudioAnalyticsExposureCalculator

- (HDAudioAnalyticsExposureCalculator)initWithTargetDate:(id)a3 exposureType:(int64_t)a4 profile:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDAudioAnalyticsExposureCalculator;
  v10 = [(HDAudioAnalyticsExposureCalculator *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(HDAudioAnalyticsExposureCalculator *)v10 setTargetDate:v8];
    [(HDAudioAnalyticsExposureCalculator *)v11 setAudioExposureType:a4];
    [(HDAudioAnalyticsExposureCalculator *)v11 setProfile:v9];
    v12 = v11;
  }

  return v11;
}

- (id)audioExposureResultWithError:(id *)a3
{
  v5 = [(HDAudioAnalyticsExposureCalculator *)self targetDate];
  v6 = +[HDAudioAnalyticsUtilities rollingDays:7 beforeDate:v5];

  int64_t v7 = [(HDAudioAnalyticsExposureCalculator *)self audioExposureType];
  id v8 = [(HDAudioAnalyticsExposureCalculator *)self profile];
  id v9 = [v6 startDate];
  v10 = [v6 endDate];
  id v20 = 0;
  v11 = +[HDAudioAnalyticsUtilities audioAverageAndDurationForExposureType:v7 profile:v8 startDate:v9 endDate:v10 error:&v20];
  id v12 = v20;

  if (v11)
  {
    int64_t v13 = [(HDAudioAnalyticsExposureCalculator *)self audioExposureType];
    +[HDAudioAnalyticsUtilities leqFromStatistics:v11];
    if (v13 == 3) {
      +[HDAudioAnalyticsUtilities boundedIntegerForSoundReductionLEQ:](HDAudioAnalyticsUtilities, "boundedIntegerForSoundReductionLEQ:");
    }
    else {
      +[HDAudioAnalyticsUtilities boundedIntegerForLEQ:](HDAudioAnalyticsUtilities, "boundedIntegerForLEQ:");
    }
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    +[HDAudioAnalyticsUtilities durationFromStatistics:v11];
    v17 = +[HDAudioAnalyticsUtilities boundedIntegerForExposureDuration:](HDAudioAnalyticsUtilities, "boundedIntegerForExposureDuration:");
    +[HDAudioAnalyticsUtilities doseFromStatistics:v11 days:7];
    v18 = +[HDAudioAnalyticsUtilities boundedIntegerForDose:](HDAudioAnalyticsUtilities, "boundedIntegerForDose:");
    v16 = [[HDAudioAnalyticsBucketedExposureResult alloc] initWithLEQ:v15 duration:v17 dose:v18];

    goto LABEL_11;
  }
  id v14 = v12;
  id v15 = v14;
  if (v14)
  {
    if (a3)
    {
      id v15 = v14;
      v16 = 0;
      *a3 = v15;
      goto LABEL_11;
    }
    _HKLogDroppedError();
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)notificationCountForRollingDays:(int64_t)a3 error:(id *)a4
{
  int64_t v7 = [(HDAudioAnalyticsExposureCalculator *)self targetDate];
  id v8 = +[HDAudioAnalyticsUtilities rollingDays:a3 beforeDate:v7];

  int64_t v9 = [(HDAudioAnalyticsExposureCalculator *)self audioExposureType];
  v10 = [(HDAudioAnalyticsExposureCalculator *)self profile];
  v11 = [v8 startDate];
  id v12 = [v8 endDate];
  id v18 = 0;
  int64_t v13 = +[HDAudioAnalyticsUtilities audioExposureEventsForExposureType:v9 profile:v10 startDate:v11 endDate:v12 error:&v18];
  id v14 = v18;

  if (v13)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "count"));
  }
  else
  {
    id v16 = v14;
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v15 = 0;
  }

  return v15;
}

- (id)sevenDayDoseForMostRecentNotificationWithError:(id *)a3
{
  int64_t v5 = [(HDAudioAnalyticsExposureCalculator *)self audioExposureType];
  v6 = [(HDAudioAnalyticsExposureCalculator *)self profile];
  id v21 = 0;
  int64_t v7 = +[HDAudioAnalyticsUtilities latestAudioExposureEventForExposureType:v5 profile:v6 error:&v21];
  id v8 = v21;

  if (v7)
  {
    int64_t v9 = [(HDAudioAnalyticsExposureCalculator *)self audioExposureType];
    v10 = [(HDAudioAnalyticsExposureCalculator *)self profile];
    v11 = [v7 startDate];
    id v12 = [v7 endDate];
    id v20 = v8;
    int64_t v13 = +[HDAudioAnalyticsUtilities audioAverageAndDurationForExposureType:v9 profile:v10 startDate:v11 endDate:v12 error:&v20];
    id v14 = v20;

    if (v13)
    {
      id v15 = NSNumber;
      +[HDAudioAnalyticsUtilities doseFromStatistics:v13 days:7];
      v17 = [v15 numberWithInteger:(uint64_t)v16];
    }
    else
    {
      id v18 = v14;
      if (v18)
      {
        if (a3) {
          *a3 = v18;
        }
        else {
          _HKLogDroppedError();
        }
      }

      v17 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      v17 = &unk_26D9E9958;
      goto LABEL_16;
    }
    if (a3)
    {
      id v14 = v8;
      v17 = 0;
      *a3 = v14;
    }
    else
    {
      _HKLogDroppedError();
      v17 = 0;
      id v14 = v8;
    }
  }

LABEL_16:
  return v17;
}

- (NSDate)targetDate
{
  return self->_targetDate;
}

- (void)setTargetDate:(id)a3
{
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (int64_t)audioExposureType
{
  return self->_audioExposureType;
}

- (void)setAudioExposureType:(int64_t)a3
{
  self->_audioExposureType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_targetDate, 0);
}

@end