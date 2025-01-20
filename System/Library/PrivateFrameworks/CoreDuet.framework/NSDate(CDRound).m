@interface NSDate(CDRound)
- (uint64_t)cd_dateWithCeilingForAlignment:()CDRound;
- (uint64_t)cd_dateWithCeilingForAlignment:()CDRound withOffset:inTimeZone:;
- (uint64_t)cd_dateWithFloorForAlignment:()CDRound;
- (uint64_t)cd_dateWithFloorForAlignment:()CDRound withOffset:inTimeZone:;
@end

@implementation NSDate(CDRound)

- (uint64_t)cd_dateWithFloorForAlignment:()CDRound
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 timeIntervalSinceReferenceDate];
  double v5 = (double)((uint64_t)v4 / (unint64_t)a2 * (unint64_t)a2);
  return [v3 dateWithTimeIntervalSinceReferenceDate:v5];
}

- (uint64_t)cd_dateWithCeilingForAlignment:()CDRound
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 timeIntervalSinceReferenceDate];
  unint64_t v5 = (uint64_t)v4 % (unint64_t)a2;
  unint64_t v6 = (unint64_t)a2 - v5;
  if (!v5) {
    unint64_t v6 = 0;
  }
  double v7 = (double)(v6 + (uint64_t)v4);
  return [v3 dateWithTimeIntervalSinceReferenceDate:v7];
}

- (uint64_t)cd_dateWithFloorForAlignment:()CDRound withOffset:inTimeZone:
{
  double v8 = (double)[a5 secondsFromGMT];
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 timeIntervalSinceReferenceDate];
  double v11 = v10 - fmod(v10 + v8 - a3, a2);
  return [v9 dateWithTimeIntervalSinceReferenceDate:v11];
}

- (uint64_t)cd_dateWithCeilingForAlignment:()CDRound withOffset:inTimeZone:
{
  double v8 = (double)[a5 secondsFromGMT];
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 timeIntervalSinceReferenceDate];
  double v11 = v10;
  long double v12 = fmod(v10 + v8 - a3, a2);
  double v13 = a2 - v12;
  BOOL v14 = v12 == 0.0;
  double v15 = -0.0;
  if (!v14) {
    double v15 = v13;
  }
  double v16 = v11 + v15;
  return [v9 dateWithTimeIntervalSinceReferenceDate:v16];
}

@end