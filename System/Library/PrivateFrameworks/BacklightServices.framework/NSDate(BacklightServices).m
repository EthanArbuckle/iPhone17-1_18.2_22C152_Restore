@interface NSDate(BacklightServices)
- (BOOL)bls_isOnOrAfter:()BacklightServices andOnOrBefore:;
- (BOOL)bls_isOnOrAfter:()BacklightServices andOnOrBefore:withEpsilon:;
- (__CFString)bls_loggingString;
- (__CFString)bls_shortLoggingString;
- (id)bls_initWithBSContinuousMachTime:()BacklightServices;
- (id)bls_initWithMachContinuousTime:()BacklightServices;
- (uint64_t)bls_compare:()BacklightServices withEpsilon:;
- (uint64_t)bls_fileNameString;
- (uint64_t)bls_machContinuousTime;
@end

@implementation NSDate(BacklightServices)

- (uint64_t)bls_machContinuousTime
{
  uint64_t v2 = mach_continuous_time();
  [a1 timeIntervalSinceNow];
  double v4 = v3;
  if (BLSMachTimeFromNSTimeInterval_onceToken != -1) {
    dispatch_once(&BLSMachTimeFromNSTimeInterval_onceToken, &__block_literal_global_78);
  }
  double v5 = fabs(v4) / *(double *)&BLSMachTimeFromNSTimeInterval___TimeScale;
  uint64_t v6 = v2 - (unint64_t)v5;
  if (v2 < (unint64_t)v5) {
    uint64_t v6 = 0;
  }
  if (v4 >= 0.0) {
    return v2 + (unint64_t)v5;
  }
  else {
    return v6;
  }
}

- (id)bls_initWithMachContinuousTime:()BacklightServices
{
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  double v3 = (void *)[a1 initWithTimeIntervalSinceNow:v2];

  return v3;
}

- (id)bls_initWithBSContinuousMachTime:()BacklightServices
{
  id v3 = a1;
  BSContinuousMachTimeNow();
  double v5 = (void *)[v3 initWithTimeIntervalSinceNow:v4 - a2];

  return v5;
}

- (__CFString)bls_loggingString
{
  if (bls_loggingString_onceToken != -1) {
    dispatch_once(&bls_loggingString_onceToken, &__block_literal_global_1);
  }
  double v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  char v3 = [a1 isEqualToDate:v2];

  if (v3)
  {
    double v4 = @"<Distant Past>";
  }
  else
  {
    double v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
    char v6 = [a1 isEqualToDate:v5];

    if (v6)
    {
      double v4 = @"<Distant Future>";
    }
    else
    {
      v7 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v8 = [a1 compare:v7];
      v9 = NSString;
      v10 = [(id)bls_loggingString_dateFormatter stringFromDate:a1];
      if (v8 == -1)
      {
        v11 = [(id)bls_loggingString_dateComponentsFormatter stringFromDate:a1 toDate:v7];
        [v9 stringWithFormat:@"%@ (%@ ago)", v10, v11];
      }
      else
      {
        v11 = [(id)bls_loggingString_dateComponentsFormatter stringFromDate:v7 toDate:a1];
        [v9 stringWithFormat:@"%@ (in %@)", v10, v11];
      }
      double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

- (__CFString)bls_shortLoggingString
{
  if (bls_shortLoggingString_onceToken != -1) {
    dispatch_once(&bls_shortLoggingString_onceToken, &__block_literal_global_22);
  }
  double v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  char v3 = [a1 isEqualToDate:v2];

  if (v3)
  {
    double v4 = @"<Distant Past>";
  }
  else
  {
    double v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
    char v6 = [a1 isEqualToDate:v5];

    if (v6)
    {
      double v4 = @"<Distant Future>";
    }
    else
    {
      double v4 = [(id)bls_shortLoggingString_dateFormatter stringFromDate:a1];
    }
  }

  return v4;
}

- (uint64_t)bls_fileNameString
{
  if (bls_fileNameString_onceToken != -1) {
    dispatch_once(&bls_fileNameString_onceToken, &__block_literal_global_27);
  }
  double v2 = (void *)bls_fileNameString_dateFormatter;

  return [v2 stringFromDate:a1];
}

- (uint64_t)bls_compare:()BacklightServices withEpsilon:
{
  id v6 = a4;
  [a1 timeIntervalSinceDate:v6];
  if (fabs(v7) >= a2) {
    uint64_t v8 = [a1 compare:v6];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)bls_isOnOrAfter:()BacklightServices andOnOrBefore:
{
  id v6 = a4;
  BOOL v7 = [a3 compare:a1] != 1 && objc_msgSend(v6, "compare:", a1) != -1;

  return v7;
}

- (BOOL)bls_isOnOrAfter:()BacklightServices andOnOrBefore:withEpsilon:
{
  id v8 = a5;
  BOOL v9 = objc_msgSend(a4, "bls_compare:withEpsilon:", a1, a2) != 1
    && objc_msgSend(v8, "bls_compare:withEpsilon:", a1, a2) != -1;

  return v9;
}

@end