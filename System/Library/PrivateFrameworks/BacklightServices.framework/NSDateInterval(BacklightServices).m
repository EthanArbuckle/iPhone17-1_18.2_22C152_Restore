@interface NSDateInterval(BacklightServices)
- (BOOL)bls_containsDate:()BacklightServices withEpsilon:outDelta:;
- (id)bls_initWithStartMachContinuousTime:()BacklightServices endMachContinuousTime:;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (uint64_t)bls_containsDate:()BacklightServices withEpsilon:;
- (uint64_t)bls_machContinuousEndTime;
- (uint64_t)bls_machContinuousStartTime;
- (unint64_t)bls_machDuration;
@end

@implementation NSDateInterval(BacklightServices)

- (uint64_t)bls_machContinuousStartTime
{
  v1 = [a1 startDate];
  uint64_t v2 = objc_msgSend(v1, "bls_machContinuousTime");

  return v2;
}

- (uint64_t)bls_machContinuousEndTime
{
  v1 = [a1 endDate];
  uint64_t v2 = objc_msgSend(v1, "bls_machContinuousTime");

  return v2;
}

- (unint64_t)bls_machDuration
{
  [a1 duration];
  double v2 = v1;
  if (BLSMachTimeFromNSTimeInterval_onceToken != -1) {
    dispatch_once(&BLSMachTimeFromNSTimeInterval_onceToken, &__block_literal_global_78);
  }
  return (unint64_t)(v2 / *(double *)&BLSMachTimeFromNSTimeInterval___TimeScale);
}

- (id)bls_initWithStartMachContinuousTime:()BacklightServices endMachContinuousTime:
{
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  double v3 = v2;
  BSTimeDifferenceFromMachTimeToMachTime();
  double v5 = v4;
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v3];
  v7 = (void *)[a1 initWithStartDate:v6 duration:v5];

  return v7;
}

- (uint64_t)bls_containsDate:()BacklightServices withEpsilon:
{
  return objc_msgSend(a1, "bls_containsDate:withEpsilon:outDelta:", a3, 0);
}

- (BOOL)bls_containsDate:()BacklightServices withEpsilon:outDelta:
{
  id v8 = a4;
  v9 = v8;
  if (!v8)
  {
LABEL_5:
    BOOL v18 = 0;
    goto LABEL_9;
  }
  [v8 timeIntervalSinceReferenceDate];
  double v11 = v10;
  v12 = [a1 startDate];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  [a1 duration];
  double v16 = v14 - a2 - v11;
  if (v16 > 0.0)
  {
    if (a5)
    {
      double v17 = -v16;
LABEL_8:
      BOOL v18 = 0;
      *a5 = v17;
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  double v17 = v11 - (v14 + v15 + a2);
  BOOL v18 = v17 <= 0.0;
  if (a5 && v17 > 0.0) {
    goto LABEL_8;
  }
LABEL_9:

  return v18;
}

- (id)bls_loggingString
{
  double v2 = NSString;
  double v3 = [a1 startDate];
  double v4 = objc_msgSend(v3, "bls_loggingString");
  [a1 duration];
  v6 = [v2 stringWithFormat:@"%@ -> %.3fs duration", v4, v5];

  return v6;
}

- (id)bls_shortLoggingString
{
  double v2 = NSString;
  double v3 = [a1 startDate];
  double v4 = objc_msgSend(v3, "bls_shortLoggingString");
  [a1 duration];
  v6 = [v2 stringWithFormat:@"%@->%.3fs", v4, v5];

  return v6;
}

@end