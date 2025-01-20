@interface HAMenstrualAlgorithmsPrediction(HKMenstrualCycles)
- (HKMCProjection)hkmc_projectionConstrainingToMostLikelyDays:()HKMenstrualCycles overridePredictionPrimarySource:currentDayIndex:;
- (id)hkmc_description;
@end

@implementation HAMenstrualAlgorithmsPrediction(HKMenstrualCycles)

- (HKMCProjection)hkmc_projectionConstrainingToMostLikelyDays:()HKMenstrualCycles overridePredictionPrimarySource:currentDayIndex:
{
  id v8 = a4;
  double v9 = (double)[a1 julianDayOfWindowStart];
  [a1 startProbabilityMean];
  double v11 = v10 + v9;
  [a1 startProbabilityStdDev];
  double v13 = v12;
  double v14 = (double)[a1 julianDayOfWindowStart];
  [a1 endProbabilityMean];
  double v16 = v15 + v14;
  [a1 endProbabilityStdDev];
  double v18 = v17;
  unsigned int v19 = [a1 julianDayOfWindowStart];
  uint64_t v20 = [a1 lowRange];
  [a1 lowRange];
  if (a3)
  {
    unint64_t v22 = llround(v11);
    int64_t v23 = llround(v16 - v11) + 1;
  }
  else
  {
    int64_t v23 = v21;
    unint64_t v22 = v20 + v19;
  }
  uint64_t v24 = HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource([a1 predictionPrimarySource]);
  if (v8)
  {
    uint64_t v25 = HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource([v8 integerValue]);
    uint64_t v26 = v22 + v23 + 2;
    if (v23 <= 0) {
      uint64_t v26 = 0x8000000000000002;
    }
    BOOL v27 = v26 <= a5;
    uint64_t v28 = 3;
    if (!v27) {
      uint64_t v28 = 1;
    }
    if (v25 == 3) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = v25;
    }
  }
  else
  {
    uint64_t v29 = v24;
  }
  v30 = -[HKMCProjection initWithStartMean:startStandardDeviation:endMean:endStandardDeviation:allDays:partiallyLogged:daysOffsetFromCalendarMethod:predictionPrimarySource:]([HKMCProjection alloc], "initWithStartMean:startStandardDeviation:endMean:endStandardDeviation:allDays:partiallyLogged:daysOffsetFromCalendarMethod:predictionPrimarySource:", v22, v23, [a1 isOngoingMenstruation], objc_msgSend(a1, "daysOffsetFromCalendarMethod"), v29, v11, v13, v16, v18);

  return v30;
}

- (id)hkmc_description
{
  v2 = NSString;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfWindowStart"));
  [a1 startProbabilityMean];
  uint64_t v5 = v4;
  [a1 startProbabilityStdDev];
  uint64_t v7 = v6;
  [a1 endProbabilityMean];
  uint64_t v9 = v8;
  [a1 endProbabilityStdDev];
  uint64_t v11 = v10;
  v16.location = [a1 lowRange];
  double v12 = NSStringFromRange(v16);
  double v13 = [v2 stringWithFormat:@"<startDay:%@ start:%.2f±%.2f end:%.2f±%.2f lowRange:%@ isOngoing:%d>", v3, v5, v7, v9, v11, v12, objc_msgSend(a1, "isOngoingMenstruation")];

  return v13;
}

@end