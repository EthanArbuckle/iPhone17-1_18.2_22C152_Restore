@interface NSTimeZone(MPAdditions)
- (id)ISO8601TimeZoneOffsetFromUTC;
@end

@implementation NSTimeZone(MPAdditions)

- (id)ISO8601TimeZoneOffsetFromUTC
{
  double v2 = (double)[a1 secondsFromGMT] / 3600.0;
  double v3 = fabs(v2);
  LODWORD(v1) = vcvtmd_s64_f64(v3);
  uint64_t v4 = (int)(fmod(v3, 1.0) * 60.0);
  v5 = @"-";
  if (v2 >= 0.0) {
    v5 = @"+";
  }
  v6 = NSString;
  v7 = v5;
  v8 = objc_msgSend(v6, "stringWithFormat:", @"%02d", v1);
  v9 = objc_msgSend(NSString, "stringWithFormat:", @":%02d", v4);
  if (v4) {
    [NSString stringWithFormat:@"%@%@%@", v7, v8, v9];
  }
  else {
  v10 = [NSString stringWithFormat:@"%@%@", v7, v8, v12];
  }

  return v10;
}

@end